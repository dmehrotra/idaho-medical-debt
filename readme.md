Medical Recovery Services
=========

Medical Recovery Services are a debt recovery company in Idaho that has been seeking to jail people for medical debt. These are some scripts to collect and parse Idaho court records for Body of Attachments ( arrest warrants ) 

requirements for collection:

 python2.7
 requests
 bs4
 psycopg2


database setup:
---------------

* createdb idaho_supreme_court_records
* psql idaho_supreme_court_records < idaho_supreme_court_records.sql

teardown:
---------

dropdb $DBNAME



basic strategy
--------------

 * Use the scraper.py to download the raw html of all links in the links file for a specific company.  You will need a valid session cookie.  This is more art than science based on network connectivity and how much the idaho court site hates you. 

 * ( I'd suggest doing Bannock and Bonneville in a separate Scrape )
 
 * Use Parse.py to find cases with warrants. 

 * Use BOA injest with the BOA.CSV to manually add missing Attachments.

 * Use cleanup.sql to delete duplicates and mistakes

Notes
-----

* for x in ./data/raw/*; do python parse.py "$x" ; done \ns;




