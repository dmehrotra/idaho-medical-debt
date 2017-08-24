# -*- coding: utf-8 -*-

import re
import codecs
import requests
from bs4 import BeautifulSoup,Comment
import sys
import psycopg2
from itertools import takewhile, chain
from re import sub
from decimal import Decimal

db = psycopg2.connect("dbname=idaho_supreme_court_records")
c = db.cursor()

f = open((sys.argv[1]), "r").read()
plaintiff = sys.argv[2]

c.execute("select id from plaintiffs where LOWER(name) = '"+ plaintiff +"'")

for p in c:
	plaintiff_id = p[0]

if plaintiff_id:
	print(plaintiff_id)

soup = BeautifulSoup(f, 'html.parser')
cases = []
case_details = {}


def parse_case_details(case):
	cleaned_case={}
	case = [var for var in case if var != " "]
	case = BeautifulSoup(str(case).replace(',',''),"html.parser")
	for tr in case.findAll('tr'):	
			for index,th in enumerate(tr.findAll('th')):		
				try:
					ths = ''.join(e for e in th.string.replace('\\xa0','') if e.isalnum())
					
					if ths == "Defendants":
						cleaned_case[ths] = th.findNext('td').string.replace('\\xa0','')
					elif ths != '':
						if len(tr.findAll("td")) > 0:
							if index > 0:
								try:	
									cleaned_case[ths] = tr.findAll("td")[index+1].string.replace('\\xa0','')
								except IndexError:	
									pass
							else:
								if tr.findAll("td")[index].string:
									cleaned_case[ths] = tr.findAll("td")[index].string.replace('\\xa0','')
				except:
					pass	

	return cleaned_case

def parse_judgement_details(case):
	cleaned_judgement={}
	judgement = [var for var in case if var != " "]
	judgement = BeautifulSoup(str(judgement).replace(',',''),"html.parser")
	
	for tr in judgement.findAll('tr'):
		if len(tr.findAll('td')[1::1]) == 6:
			
			cleaned_judgement["judgement_date"] = tr.findAll('td')[1::1][0].string
			cleaned_judgement["judgement_type"] = tr.findAll('td')[1::1][1].string
			cleaned_judgement["judgement_amount"] = "0.00"
		for th in tr.findAll('th'):
			if re.search(ur'([£$€])(\d+(?:\.\d{2})?)',th.string.replace('\\xa0','')):
				cleaned_judgement["judgement_amount"] = re.search(ur'([£$€])(\d+(?:\.\d{2})?)',th.string.replace('\\xa0','')).group()
	


	return cleaned_judgement

def parse_warrant_details(case):
	warrants=[]
	returned = []
	warrant = [var for var in case if var != " "]
	warrant = BeautifulSoup(str(warrant).replace(',',''),"html.parser")
	for tr in warrant.findAll("tr"):
		w = {}
		r = {}
		if len(tr.findAll('td')[1::1]) > 1:
			
			if "warrant" in tr.findAll('td')[1::1][1].string.lower() and "attachment" not in tr.findAll('td')[1::1][1].string.lower() and "returned" not in tr.findAll('td')[1::1][1].string.lower() and "quash" not in tr.findAll('td')[1::1][1].string.lower():
				
				details = tr.findAll('td')[1::1][1].string

				w["bond_amount"] = "0.00"
				if re.search(ur'\$?\d{1,}\.\d{2}',details):
					w["bond_amount"] = re.search(ur'\$?\d{1,}\.\d{2}',details).group()

				w["issued"] = tr.findAll('td')[1::1][0].string
				w["defendant"] = details.split("  ")[-1]
				w["reason"] = ""
				if len(details.split("  ")) > 1:
					
					w["reason"] = details.split("  ")[1]

			if "warrant returned" in tr.findAll('td')[1::1][1].string.lower():
				details = tr.findAll('td')[1::1][1].string
		
				r["returned"] = tr.findAll('td')[1::1][0].string
				r["reason"] = " "
				r["defendant"] = details.split("  ")[-1]
				if len(details.split("  ")) > 1:
					print(details.split("  ")[1])
					r["reason"] = details.split("  ")[1]
					
		if w:
			warrants.append(w)
		if r:
			returned.append(r)

	return [warrants,returned]



def build_case_details(comment):
	loop = True
	case = {"details": []}
	while loop:	
		if comment.next_element != " Case Detail End ":
			case["details"].append(comment)
			comment = comment.next_element
		elif comment.next_element == " Case Detail End ":
			loop = False
			return case	

def build_judgement_details(comment):
	loop = True
	judgement = {"details": []}
	while loop:
	
		if comment.next_element != " Disposition End ":
			judgement["details"].append(comment)
			comment = comment.next_element
		elif comment.next_element == " Disposition End ":
			loop = False
			return judgement

					

def build_warrant_details(comment):
	loop = True
	warrant = {"details": []}
	while loop:
		if comment.next_element != " ROA End ":
			warrant["details"].append(comment)
			comment = comment.next_element
		elif comment.next_element == " ROA End ":
			loop = False
			return warrant

#build cases 
print(sys.argv[1].split('/')[-1].split('.')[0].lower())

c.execute("select id from county where LOWER(name) = '"+ sys.argv[1].split('/')[-1].split('.')[0].lower()+"'")

for p in c:
	county = p[0]

for comment in soup.findAll(text=lambda text:isinstance(text, Comment)):
	print(comment)
	if comment in [' Case Detail Begin ']:
		case = {}
		case_details = build_case_details(comment)
		case["details"] = parse_case_details(case_details["details"])
	if comment in [' Disposition Begin ']:
		judgement_details = build_judgement_details(comment)
		case["judgement"] = parse_judgement_details(judgement_details["details"])
	if comment in [' ROA Begin ']:
		warrant_details = build_warrant_details(comment)
		wr = parse_warrant_details(warrant_details["details"])
		case["warrants"] = wr[0]
		case["returned"] = wr[1]
		if len(case["warrants"]) > 0:
			cases.append(case)
print("here")
for case in cases:
	print(case)
	d = {'county_id': county,
	'plaintiff_id': plaintiff_id,
	'filed': case["details"]["Filed"].encode("utf-8").strip(' '),
	'status': case["details"]["Status"].encode("utf-8").strip(' '),
	'defendant':case["details"]["Defendants"].encode("utf-8").strip(' ').replace("  ",", "),
	'case_number': case["details"]["Case"].encode("utf-8").strip(' '),
	'judge':case["details"]["Judge"].encode("utf-8").strip(' ')}

	j = {'case_number': case["details"]["Case"].encode("utf-8").strip(' '),
	'judgement_amount':  Decimal(sub(r'[^\d.]', '', case['judgement']["judgement_amount"])),
	'judgement_type': case['judgement']["judgement_type"].encode("utf-8").strip(' '),
	'judgement_date':case['judgement']["judgement_date"].encode("utf-8").strip(' ')}

	c.execute('insert into cases (county_id,plaintiff_id, filed, status, defendant, case_number,judge) values (%(county_id)s,%(plaintiff_id)s, %(filed)s, %(status)s, %(defendant)s, %(case_number)s, %(judge)s) on conflict(case_number) do nothing', d)
	c.execute('insert into judgements (case_number, judgement_amount, judgement_type, judgement_date) values (%(case_number)s, %(judgement_amount)s, %(judgement_type)s, %(judgement_date)s)', j)
		
	for warrant in case["warrants"]:
		w = {'case_number': case["details"]["Case"].encode("utf-8").strip(' '),
		"issued": warrant["issued"].encode("utf-8").strip(' '),
		"reason": warrant["reason"].encode("utf-8").strip(' '),
		"defendant": warrant["defendant"].encode("utf-8").strip(' '),
		"bond_amount": Decimal(sub(r'[^\d.]', '', warrant["bond_amount"]))}

		c.execute('insert into warrants (case_number, issued, reason, bond_amount, defendant) values (%(case_number)s, %(issued)s, %(reason)s, %(bond_amount)s, %(defendant)s)', w)
	
	for warrant_returned in case["returned"]:
		w = {'case_number': case["details"]["Case"].encode("utf-8").strip(' '),
		"reason": warrant_returned["reason"].encode("utf-8").strip(' '),
		"returned": warrant_returned["returned"].encode("utf-8").strip(' '),
		"defendant": warrant_returned["defendant"].encode("utf-8").strip(' ')}

		c.execute('insert into warrants_returned (case_number, reason, returned, defendant) values (%(case_number)s, %(reason)s, %(returned)s, %(defendant)s)', w)


	db.commit()


