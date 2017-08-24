
import sys
import psycopg2
from decimal import Decimal
from re import sub
import csv
db = psycopg2.connect("dbname=idaho_supreme_court_records")
c = db.cursor()


county = 0
defendant = 2
case_number = 3
filed = 4
judgement_amount = 5
judgement_date = 6
judgement_type = 7
issued = 9
returned = 10
bond_amount=14


def build_case(r):
	county_id = 0
	c.execute("select id from county where LOWER(name) = '"+ r[county].lower() +"'")
	for p in c:
		county_id = p[0]

	if county_id != 0:
		
		d = {'county_id': county_id,
		'plaintiff_id': str(1),
		'filed': r[filed].encode("utf-8").strip(' '),
		'defendant':r[defendant].encode("utf-8").strip(' ').replace("  ",", "),
		'case_number': r[case_number].encode("utf-8").strip(' ')}

		if r[judgement_amount]:
			j = {'case_number': r[case_number].encode("utf-8").strip(' '),
			'judgement_amount':  Decimal(sub(r'[^\d.]', '', r[judgement_amount])),
			'judgement_type': r[judgement_type].encode("utf-8").strip(' '),
			'judgement_date':r[judgement_date].encode("utf-8").strip(' ')}

			c.execute('insert into cases (county_id, plaintiff_id, filed, defendant, case_number) values (%(county_id)s,%(plaintiff_id)s, %(filed)s, %(defendant)s, %(case_number)s) on conflict do nothing', d)
			c.execute('insert into judgements (case_number, judgement_amount, judgement_type, judgement_date) values (%(case_number)s, %(judgement_amount)s, %(judgement_type)s, %(judgement_date)s)', j)
			if r[issued]:
				w = {'case_number': r[case_number].encode("utf-8").strip(' '),
				"issued": r[issued].encode("utf-8").strip(' '),
				"defendant": r[defendant].encode("utf-8").strip(' '),
				"bond_amount": Decimal(sub(r'[^\d.]', '', '0.00'))
				}
				
				if r[bond_amount]:
					w["bond_amount"] = Decimal(sub(r'[^\d.]', '', r[bond_amount]))

				
				c.execute('insert into warrants (case_number, issued, defendant, bond_amount) values (%(case_number)s, %(issued)s, %(defendant)s,%(bond_amount)s)', w)
				if r[returned]:
					print r
					w = {'case_number': r[case_number].encode("utf-8").strip(' '),
					"returned": r[returned].encode("utf-8").strip(' '),
					"defendant": r[defendant].encode("utf-8").strip(' ')
					}	

					c.execute('insert into warrants_returned (case_number, returned, defendant) values (%(case_number)s, %(returned)s, %(defendant)s)', w)


with open('BOA.csv', 'rb') as csvfile:
	boa = csv.reader(csvfile)
	for row in boa:
		if row[0] != "County":
			build_case(row)

			db.commit()


