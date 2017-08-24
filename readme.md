Medical Reocvery Fuckers
=========


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

Visualization
=============



TODO
====

 * split paths at the "dateline" LINESTRING(-179.9 85, -179.9 -85,
   179.9 -85, 179.9 85) before emitting them, to avoid weird wrap in
   flat projections -- but st_difference() only takes geom, and not
   geog.
 
 * think more clearly about how to associate TTL and lag with
   plausibility in the traceroute story

 * understand why there's such a big gap between sent/recvd on the
   scapy packets

 * consider proximity matches between plausible hops and cable joints

 * look for "tromboning" routes that leave the US and then return to it

 * enhance maxmind geoip db with custom knowledge about WM infrastructure
   puppet:manifests/network.pp has a list of info.

 * if a peer never got any responses at all from some traceback
   attempt, should we try it again?  should we record how many tries
   we've done?
 
 * get airport and other location codes with geographic info, build table:
   http://www.unece.org/cefact/codesfortrade/codes_index.html
   http://www.unece.org/fileadmin/DAM/cefact/locode/loc142cvs.zip

 * visualize cables some other way -- e.g. by choosing their centroid
   and connecting it to all landing points

 * visualize all us/canada and us/mexico links.


