import requests
from bs4 import BeautifulSoup
import sys
import psycopg2
import random

db = psycopg2.connect("dbname=idaho_supreme_court_records")
c = db.cursor()

cookie = {'JSESSIONID': sys.argv[1]}


def get_county(link):
    return link.split("&")[1].split("=")[1]


def get_raw(link,county_name):
    r = requests.get(link, cookies=cookie)
    soup = BeautifulSoup(r.text, 'html.parser')
    print("got a response for: "+ county_name)
    f = open("./data/"+sys.argv[2]+"/raw/"+county_name+"."+str(random.randint(1,11))+".html","w+")
    f.write(str(soup))
    f.close() 

with open ("data/"+sys.argv[2]+"/links", "rw") as links:
    todo = links.readlines()
    for link in todo:
        l=link.strip()
        county_name = get_county(l)
        print("trying: "+ county_name)
        c.execute("INSERT INTO county (name) VALUES ('"+county_name+"') ON CONFLICT (NAME) DO NOTHING")
        get_raw(l,county_name)


db.commit()

