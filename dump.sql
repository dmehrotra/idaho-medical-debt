--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cases; Type: TABLE; Schema: public; Owner: Mehrotra
--

CREATE TABLE cases (
    county_id smallint NOT NULL,
    filed date,
    status text,
    defendant text,
    case_number text NOT NULL,
    judge text
);


ALTER TABLE cases OWNER TO "Mehrotra";

--
-- Name: county; Type: TABLE; Schema: public; Owner: Mehrotra
--

CREATE TABLE county (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE county OWNER TO "Mehrotra";

--
-- Name: county_id_seq; Type: SEQUENCE; Schema: public; Owner: Mehrotra
--

CREATE SEQUENCE county_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE county_id_seq OWNER TO "Mehrotra";

--
-- Name: county_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Mehrotra
--

ALTER SEQUENCE county_id_seq OWNED BY county.id;


--
-- Name: judgements; Type: TABLE; Schema: public; Owner: Mehrotra
--

CREATE TABLE judgements (
    id integer NOT NULL,
    case_number text NOT NULL,
    judgement_amount numeric(12,2),
    judgement_type text,
    judgement_date date
);


ALTER TABLE judgements OWNER TO "Mehrotra";

--
-- Name: judgements_id_seq; Type: SEQUENCE; Schema: public; Owner: Mehrotra
--

CREATE SEQUENCE judgements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE judgements_id_seq OWNER TO "Mehrotra";

--
-- Name: judgements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Mehrotra
--

ALTER SEQUENCE judgements_id_seq OWNED BY judgements.id;


--
-- Name: warrants; Type: TABLE; Schema: public; Owner: Mehrotra
--

CREATE TABLE warrants (
    id integer NOT NULL,
    case_number text NOT NULL,
    issued date,
    reason text,
    bond_amount numeric(12,2),
    defendant text
);


ALTER TABLE warrants OWNER TO "Mehrotra";

--
-- Name: warrants_id_seq; Type: SEQUENCE; Schema: public; Owner: Mehrotra
--

CREATE SEQUENCE warrants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE warrants_id_seq OWNER TO "Mehrotra";

--
-- Name: warrants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Mehrotra
--

ALTER SEQUENCE warrants_id_seq OWNED BY warrants.id;


--
-- Name: warrants_returned; Type: TABLE; Schema: public; Owner: Mehrotra
--

CREATE TABLE warrants_returned (
    id integer NOT NULL,
    case_number text NOT NULL,
    defendant text,
    returned date,
    reason text
);


ALTER TABLE warrants_returned OWNER TO "Mehrotra";

--
-- Name: warrants_returned_id_seq; Type: SEQUENCE; Schema: public; Owner: Mehrotra
--

CREATE SEQUENCE warrants_returned_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE warrants_returned_id_seq OWNER TO "Mehrotra";

--
-- Name: warrants_returned_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Mehrotra
--

ALTER SEQUENCE warrants_returned_id_seq OWNED BY warrants_returned.id;


--
-- Name: county id; Type: DEFAULT; Schema: public; Owner: Mehrotra
--

ALTER TABLE ONLY county ALTER COLUMN id SET DEFAULT nextval('county_id_seq'::regclass);


--
-- Name: judgements id; Type: DEFAULT; Schema: public; Owner: Mehrotra
--

ALTER TABLE ONLY judgements ALTER COLUMN id SET DEFAULT nextval('judgements_id_seq'::regclass);


--
-- Name: warrants id; Type: DEFAULT; Schema: public; Owner: Mehrotra
--

ALTER TABLE ONLY warrants ALTER COLUMN id SET DEFAULT nextval('warrants_id_seq'::regclass);


--
-- Name: warrants_returned id; Type: DEFAULT; Schema: public; Owner: Mehrotra
--

ALTER TABLE ONLY warrants_returned ALTER COLUMN id SET DEFAULT nextval('warrants_returned_id_seq'::regclass);


--
-- Data for Name: cases; Type: TABLE DATA; Schema: public; Owner: Mehrotra
--

COPY cases (county_id, filed, status, defendant, case_number, judge) FROM stdin;
36	2016-07-13	Inactive 05/25/2017	Falconer Jo Anna	CV-2016-0002464-OC	Rick Carnaroli
36	2016-04-26	Pending 02/28/2017	Jaramillo Jose M	CV-2016-0001456-OC	Scott E. Axline
36	2016-03-03	Pending 03/30/2017	Martinez Maricela	CV-2016-0000769-OC	Scott E. Axline
36	2016-02-22	Pending 01/04/2017	Hopkins Kenneth	CV-2016-0000601-OC	Steven A Thomsen
36	2015-10-28	Closed 11/17/2016	Powell Julie Ann	CV-2015-0003701-OC	Thomas W Clark
36	2015-09-09	Pending 05/31/2017	Barlow Daryenne Lee	CV-2015-0003107-OC	Steven A Thomsen
36	2015-07-24	Pending 05/04/2016	Wilson Craig Allen	CV-2015-0002546-OC	Thomas W Clark
36	2015-06-26	Inactive 05/18/2016	Carter Bradley W, Carter Diana L	CV-2015-0002160-OC	Steven A Thomsen
36	2015-03-26	Closed pending clerk action 06/09/2017	Lacy Joseph T	CV-2015-0001070-OC	Thomas W Clark
36	2015-03-19	Closed 07/28/2016	Wiebelhaus Sky E	CV-2015-0000987-OC	Robert C Naftz
36	2015-02-05	Closed 05/01/2017	Williams Sallie Francine	CV-2015-0000412-OC	Rick Carnaroli
36	2014-12-10	Closed 05/26/2017	Myler Joshua David	CV-2014-0004864-OC	Scott E. Axline
36	2014-11-12	Pending 02/23/2016	Morrison Mistie	CV-2014-0004515-OC	Thomas W Clark
36	2014-04-29	Closed pending clerk action 04/14/2017	Arrants Harley H III	CV-2014-0001722-OC	Rick Carnaroli
36	2014-03-24	Pending 01/14/2016	Olsen Christopher M, Olsen Shasta B	CV-2014-0001248-OC	Scott E. Axline
36	2014-03-17	Closed pending clerk action 02/09/2017	Griffey Kathleen M	CV-2014-0001129-OC	Rick Carnaroli
36	2013-12-11	Closed 11/17/2016	Barrand Carrie L, Barrand Jesse	CV-2013-0004755-OC	Rick Carnaroli
36	2013-10-31	Closed 06/09/2016	Edwards Jordan R.	CV-2013-0004196-OC	Scott E. Axline
36	2013-10-08	Closed 04/27/2016	Eldridge William C	CV-2013-0003798-OC	Steven A Thomsen
36	2013-04-22	Closed 07/12/2016	Brewer Cynthia Ann, Dickman Frank Loreen	CV-2013-0001469-OC	Rick Carnaroli
36	2012-10-03	Inactive 07/22/2013	Ellertson Steven C	CV-2012-0004252-OC	Rick Carnaroli
36	2012-09-19	Inactive 09/18/2015	Neubacher Beth, Neubacher David	CV-2012-0004021-OC	Scott E. Axline
36	2012-07-31	Closed pending clerk action 06/08/2015	Bacon Anissa M, Bacon David M	CV-2012-0003180-OC	Thomas W Clark
36	2012-06-06	Closed pending clerk action 01/07/2013	Mcghee Cathy, Rowley Patrick T	CV-2012-0002384-OC	Rick Carnaroli
36	2012-03-20	Closed pending clerk action 09/15/2016	Randall Tenya Ray	CV-2012-0001209-OC	Rick Carnaroli
36	2012-02-21	Closed 01/13/2016	Price Dennis H	CV-2012-0000747-OC	Thomas W Clark
36	2012-01-30	Closed pending clerk action 12/08/2016	Bybee Laurie J	CV-2012-0000408-OC	Thomas W Clark
36	2011-12-29	Closed 05/22/2013	Cameron Bart, Cameron Kathryn	CV-2011-0005533-OC	Rick Carnaroli
36	2011-11-22	Closed 11/21/2016	Davis Renee N, Davis William M	CV-2011-0004911-OC	Steven A Thomsen
36	2011-08-23	Closed 06/21/2013	Starks Theresa Anne	CV-2011-0003472-OC	Steven A Thomsen
36	2011-08-23	Inactive 01/14/2013	Lewis Jeff, Lewis Mellisa	CV-2011-0003465-OC	Rick Carnaroli
36	2011-08-15	Closed 08/09/2016	Hazelbush Cory K, Hazelbush Misti	CV-2011-0003323-OC	Rick Carnaroli
36	2011-07-26	Closed pending clerk action 09/21/2012	Saraceno Tony	CV-2011-0002966-OC	Steven A Thomsen
36	2011-07-19	Closed 03/04/2013	Guthrie Curtis Rye, Guthrie Kasey	CV-2011-0002871-OC	Rick Carnaroli
36	2011-07-13	Pending 09/26/2012	Dueling Soibhan, Dueling Todd	CV-2011-0002819-OC	Thomas W Clark
36	2011-06-14	Pending 07/24/2017	Medrano Rosendo	CV-2011-0002374-OC	Thomas W Clark
36	2011-06-10	Closed 09/24/2015	Larsen Laurel L	CV-2011-0002320-OC	Rick Carnaroli
36	2011-05-13	Closed 09/30/2013	Ridley Darrin L, Ridley Katye A	CV-2011-0001910-OC	Thomas W Clark
36	2011-01-19	Closed 01/14/2015	Anderson Cynthia, Anderson William Reed II	CV-2011-0000225-OC	Thomas W Clark
36	2010-09-15	Closed 12/10/2015	Tibbitts Russell, Verderber Tessa Leigh	CV-2010-0003812-OC	Steven A Thomsen
36	2010-09-15	Closed 02/22/2013	Johns Darin Michael	CV-2010-0003811-OC	Rick Carnaroli
36	2010-08-19	Closed 09/11/2015	Downard Corinna	CV-2010-0003427-OC	Rick Carnaroli
36	2010-07-30	Closed 08/11/2015	Hoyt Bradley Ryan, Hoyt Michelle M	CV-2010-0003133-OC	Rick Carnaroli
36	2010-04-02	Closed 04/30/2015	Mcmahen Trent Anthony	CV-2010-0001408-OC	Rick Carnaroli
36	2010-02-26	Closed 03/05/2014	Thompson Edwin E	CV-2010-0000837-OC	Thomas W Clark
36	2010-02-23	Closed 04/04/2015	Howerton Tina M, Howerton rod	CV-2010-0000767-OC	Scott E. Axline
36	2010-02-05	Closed 12/10/2012	Rogers Adam W, Rogers Stephanie	CV-2010-0000482-OC	Thomas W Clark
36	2009-09-01	Closed 02/08/2012	Croft Kasi K.	CV-2009-0003428-OC	Steven A Thomsen
36	2009-06-26	Closed pending clerk action 06/25/2014	Leading Mark r, Scotton Susan	CV-2009-0002517-OC	Steven A Thomsen
36	2009-05-27	Pending 08/12/2016	Doe John, Mahan Nickcole D	CV-2009-0002074-OC	Steven A Thomsen
36	2009-03-18	Closed pending clerk action 12/15/2010	Casper Andrew J, Casper Kristi	CV-2009-0001076-OC	Steven A Thomsen
36	2008-11-18	Closed 06/24/2013	Reisner Darwin, Reisner Toni	CV-2008-0004674-OC	Rick Carnaroli
36	2008-09-19	Closed 08/21/2013	Rowberry Jeremy	CV-2008-0003859-OC	Steven A Thomsen
36	2008-09-18	Closed 09/17/2012	Alonso Carrie J.	CV-2008-0003809-OC	Rick Carnaroli
36	2008-08-08	Closed 02/29/2012	Stark Justin D	CV-2008-0003191-OC	Steven A Thomsen
36	2008-07-22	Closed 03/28/2011	Heath Arthur Sr, Heath Peggy	CV-2008-0002942-OC	Rick Carnaroli
36	2008-07-22	Closed 02/03/2010	Robinson Michele Lynn, Vaughan Shane J.	CV-2008-0002939-OC	Rick Carnaroli
36	2008-07-22	Pending 10/29/2010	Palmer James	CV-2008-0002938-OC	Scott E. Axline
36	2007-11-13	Closed 04/02/2009	Valai John, Valai Shirlene	CV-2007-0004797-OC	Steven A Thomsen
36	2007-10-18	Closed 08/11/2017	Lane Martin	CV-2007-0004453-OC	Steven A Thomsen
36	2007-10-05	Closed 02/01/2012	Larsen Jared Lee, Larsen Talisa	CV-2007-0004301-OC	Rick Carnaroli
36	2007-09-21	Closed 09/28/2009	Walker Rayann, Walker Willie Joe Jr	CV-2007-0004039-OC	Rick Carnaroli
36	2007-05-17	Pending 06/01/2017	McDonald Michael Raymond, McDonald Rosemarrie Jean	CV-2007-0002171-OC	Scott E. Axline
36	2006-11-16	Closed 02/11/2013	Govan Herman Jr, Govan Maria	CV-2006-0004975-OC	Rick Carnaroli
36	2006-05-25	Closed 04/21/2009	Elder Donald E	CV-2006-0002383-OC	Rick Carnaroli
36	2006-05-25	Closed 07/07/2008	Cluff Alan, May Brenda Eva	CV-2006-0002382-OC	Gaylen L. Box
7	2015-06-29	Pending 06/30/2016	Conan Jamie Dean	CV-2015-0001081	James H Barrett
7	2015-06-22	Inactive 06/07/2017	Roberts Ron	CV-2015-0001037	James H Barrett
7	2015-04-06	Closed 03/02/2017	Buck Weston	CV-2015-0000587	James H Barrett
7	2014-10-06	Closed 07/05/2017	Smith Barry, Smith Melonie Dawn	CV-2014-0001875	Scott  H. Hansen
7	2014-10-02	Closed 12/27/2016	Leonardson Charles Wayne, Leonardson Traci L	CV-2014-0001828	Scott  H. Hansen
7	2013-09-19	Inactive 06/07/2017	Doe John, Elison Desiree Sarah	CV-2013-0001820	Scott  H. Hansen
7	2012-10-26	Closed 03/09/2017	Kohler Kaydon, Kohler Vaneen G	CV-2012-0002228	Scott  H. Hansen
12	2015-07-27	Inactive 08/15/2017	Jones Duston, Jones Kimberly B	CV-2015-0000672	Blaine Cannon
15	2012-12-05	Inactive 04/23/2014	Ellis Cierra, Ellis William Robert	CV-2012-0000599	Gregory W. Moeller
17	2016-06-06	Closed 06/29/2017	Rothman Jeffrey Michael	CV-2016-0000297	Casey Robinson
17	2016-04-05	Inactive 05/23/2017	Renick Lisa	CV-2016-0000175	Casey Robinson
17	2015-09-08	Closed 08/30/2016	Romo Joseph Michael	CV-2015-0000424	Casey Robinson
17	2014-12-01	Closed 04/04/2016	Doe Jane, Mcdonald Fred T	CV-2014-0000600	Casey Robinson
19	2014-08-25	Closed 03/03/2017	Varela Judith, Varela Luis	CV-2014-0000636	Robert L. Crowley Jr.
19	2014-04-03	Closed 04/28/2015	Doe Jane, Mangan Martin A	CV-2014-0000276	Robert L. Crowley Jr.
19	2014-01-23	Inactive 04/20/2016	Sorensen Cherie, Sorensen John Doe	CV-2014-0000059	Robert L. Crowley Jr.
19	2013-08-21	Closed 07/29/2014	Hernandez John Doe, Hernandez Leticia	CV-2013-0000705	Robert L. Crowley Jr.
19	2013-07-31	Closed pending clerk action 02/03/2015	Barrientos Francesca, Barrientos J	CV-2013-0000653	Robert L. Crowley Jr.
19	2013-07-18	Closed 03/18/2014	Graham Brittney, Graham Jed Tyler	CV-2013-0000615	Robert L. Crowley Jr.
19	2013-03-26	Closed 05/02/2014	Schell Jane Doe, Schell John	CV-2013-0000272	Robert L. Crowley Jr.
19	2013-03-14	Closed 04/08/2014	Parker Brent, Parker Kristine B	CV-2013-0000239	Robert L. Crowley Jr.
19	2013-03-11	Closed 05/11/2015	Linares Brittany Jo, Linares Jacinto J	CV-2013-0000233	Robert L. Crowley Jr.
19	2013-02-05	Closed 10/03/2013	Stibal Jane Doe, Stibal Tyrel L	CV-2013-0000123	Robert L. Crowley Jr.
19	2012-12-06	Closed 06/23/2017	Robbins Jane Doe, Robbins Jeff J	CV-2012-0001026	Robert L. Crowley Jr.
19	2012-11-20	Closed 02/21/2017	Dortch Jimmy T, Dortch Monica	CV-2012-0000967	Robert L. Crowley Jr.
19	2012-10-26	Closed 04/17/2015	Lopez Jane Doe, Lopez Joe	CV-2012-0000879	Robert L. Crowley Jr.
19	2012-10-26	Closed 05/15/2015	Smith Rachel, Smith Shane Eldon	CV-2012-0000875	Robert L. Crowley Jr.
19	2012-09-07	Closed pending clerk action 06/23/2017	Fillmore Craig Lynn, Fillmore Michelle Rae	CV-2012-0000713	Robert L. Crowley Jr.
19	2012-08-23	Closed 07/06/2017	Covington Jane Doe, Covington Jory T	CV-2012-0000664	Robert L. Crowley Jr.
19	2012-08-07	Inactive 06/18/2013	Christensen Amanda N, Christensen Josh	CV-2012-0000619	Robert L. Crowley Jr.
19	2012-08-01	Closed 11/16/2015	Morton Megan Joy, Morton Skipper T	CV-2012-0000603	Robert L. Crowley Jr.
19	2012-02-24	Closed 09/29/2016	Bowcutt Jane Doe, Bowcutt Quentin K	CV-2012-0000166	Robert L. Crowley Jr.
19	2010-12-30	Closed pending clerk action 06/06/2017	Morton Megan, Morton Skipper T	CV-2010-0001301	Robert L. Crowley Jr.
19	2010-12-23	Closed 08/05/2014	Davis J. Alan, Davis Jennifer	CV-2010-0001277	Robert L. Crowley Jr.
19	2010-08-27	Closed 09/29/2015	Wilde John Doe, Wilde Shelly	CV-2010-0000845	Robert L. Crowley Jr.
19	2010-07-21	Closed 03/07/2013	Barber Dawn, Barber Lance D	CV-2010-0000703	Robert L. Crowley Jr.
19	2010-06-25	Closed 06/06/2012	Williams Audrey Ann, Williams Curtis Martin	CV-2010-0000613	Alan C. Stephens
19	2010-03-12	Inactive 07/06/2017	Coles Holly M, Coles Jeffrey Lloyd	CV-2010-0000238	Robert L. Crowley Jr.
19	2009-11-19	Closed 01/03/2013	Oler Deena Lynn, Oler John Doe	CV-2009-0001047	Robert L. Crowley Jr.
19	2009-03-17	Closed 12/12/2011	Layton Brent, Layton Shawntell	CV-2009-0000234	Robert L. Crowley Jr.
19	2009-02-24	Closed 11/18/2011	Doe John, Stowers Rebecca Ann	CV-2009-0000151	Robert L. Crowley Jr.
19	2008-12-12	Closed 04/08/2015	Doe John, Sakan Karla R	CV-2008-0001058	Robert L. Crowley Jr.
19	2008-12-05	Closed 01/07/2011	John Doe, Thompson Sheri	CV-2008-0001024	Robert L. Crowley Jr.
19	2008-11-14	Closed 09/16/2009	Graham Dennis, Graham Marcia	CV-2008-0000963	Robert L. Crowley Jr.
19	2008-10-22	Closed 02/28/2014	Baler John Doe, Baler Nikki	CV-2008-0000892	Robert L. Crowley Jr.
19	2008-09-30	Closed 06/19/2009	Wakley Charity Ann, Wakley John Doe	CV-2008-0000836	Robert L. Crowley Jr.
19	2008-09-30	Closed 07/09/2010	Acor Kevin T, Acor Tiffany	CV-2008-0000831	Robert L. Crowley Jr.
19	2008-09-03	Closed 07/21/2011	Roberts Corry, Roberts Jessica Helene	CV-2008-0000738	Robert L. Crowley Jr.
19	2008-05-02	Closed 09/29/2015	Coffey Tyanna Daylene, Wellard Matthew J	CV-2008-0000367	Robert L. Crowley Jr.
19	2007-04-11	Closed 11/18/2016	Rogers Gale Wayne, Rogers Melanie Mobley	CV-2007-0000293	Robert L. Crowley Jr.
19	2007-02-14	Closed 03/13/2008	Baker Jennie M, Baker Matthew L	CV-2007-0000152	Michael B. Kennedy
19	2007-01-09	Closed 02/04/2008	Owens Jane Doe, Owens Steven	CV-2007-0000026	Robert L. Crowley Jr.
19	2006-12-05	Closed 04/23/2010	Morgan Jennifer Lou, Morgan John Doe	CV-2006-0000984	Robert L. Crowley Jr.
19	2006-11-27	Closed 12/07/2011	Landon Jane Doe, Landon Jared Daniel	CV-2006-0000963	Robert L. Crowley Jr.
29	2014-02-12	Closed 04/09/2015	Olmos Claudia, Olmos Jose	CV-2014-0000110	Rick L Bollar
29	2013-05-20	Inactive 08/28/2014	Doe John, Moreno Olivia	CV-2013-0000450	Rick L Bollar
29	2012-08-03	Closed pending clerk action 06/19/2014	R.S. Smith Express LLC, Smith Robert S	CV-2012-0000550	Rick L Bollar
34	2016-02-24	Inactive 12/28/2016	McDaniel Richard Lynn	CV-2016-0000027	Jason D Walker
34	2014-08-25	Pending 11/23/2015	Baughman Kristi, Doe John	CV-2014-0000215	Jason D Walker
34	2014-03-28	Closed 07/22/2015	John Doe, Valdez Krista D	CV-2014-0000084	Jason D Walker
37	2016-06-30	Pending 06/29/2017	Chester Dawna Lynn	CV-2016-0003472-OC	Stephen J. Clark
37	2016-06-02	Pending 05/30/2017	Thomas Tammy	CV-2016-0002920-OC	Michelle R. Mallard
37	2016-04-27	Pending 07/05/2017	Maxey Patrick Armon	CV-2016-0002301-OC	L. Mark Riddoch
37	2016-03-01	Pending 05/26/2017	Barraza Monica	CV-2016-0001141-OC	Steven A. Gardner
37	2015-10-20	Closed 10/07/2016	Rasmussen Tyler Michael	CV-2015-0005659-OC	Michelle R. Mallard
37	2015-10-02	Pending 02/02/2017	Ephrem Kent	CV-2015-0005293-OC	Stephen J. Clark
37	2015-10-01	Inactive 07/24/2017	Perez Fabiola	CV-2015-0005294-OC	Steven A. Gardner
37	2015-09-02	Inactive 07/24/2017	Radford Sharon	CV-2015-0004793-OC	Steven A. Gardner
37	2015-08-24	Inactive 05/20/2016	Rollene Jason Lee	CV-2015-0004619-OC	Steven A. Gardner
37	2015-08-14	Closed 09/14/2016	Allison Julie K	CV-2015-0004463-OC	L. Mark Riddoch
37	2015-07-31	Closed pending clerk action 07/20/2017	Widerburg Ryan Lane	CV-2015-0004201-OC	Steven A. Gardner
37	2015-06-26	Closed 02/14/2017	Phantom Repossessions LLC and Idaho, Stoneburner Joshua	CV-2015-0003472-OC	L. Mark Riddoch
37	2015-06-15	Closed 03/20/2017	Potter Angela Dawn	CV-2015-0003256-OC	Steven A. Gardner
37	2015-05-08	Closed 10/17/2016	Moore Heather M, Terry John W	CV-2015-0002573-OC	L. Mark Riddoch
37	2015-05-06	Pending 06/16/2016	Curzon Blaine	CV-2015-0002498-OC	Michelle R. Mallard
37	2015-04-27	Closed pending clerk action 07/24/2017	Malott Demi R	CV-2015-0002314-OC	Stephen J. Clark
37	2015-04-17	Closed 03/16/2017	Rentelman Tabitha Ineez	CV-2015-0002119-OC	Stephen J. Clark
37	2015-04-16	Pending 12/13/2016	Sanchez Letesha Marie	CV-2015-0002091-OC	L. Mark Riddoch
37	2015-04-15	Inactive 12/01/2015	Costilla Ana Rosa	CV-2015-0002063-OC	Steven A. Gardner
37	2015-04-08	Pending 07/05/2017	Ramirez Gabriel	CV-2015-0001925-OC	L. Mark Riddoch
37	2015-04-03	Pending 07/17/2017	Gonzalez Luis M	CV-2015-0001808-OC	L. Mark Riddoch
37	2015-03-25	Inactive 08/04/2017	Beckstead Dustin	CV-2015-0001642-OC	Steven A. Gardner
37	2015-03-23	Closed 06/16/2017	Bird Bryan Thomas	CV-2015-0001597-OC	Steven A. Gardner
37	2015-02-02	Closed 05/18/2017	Higgins Kevin	CV-2015-0000614-OC	Stephen J. Clark
37	2014-12-15	Inactive 07/27/2017	Rydalch Bonnie, Rydalch Brandon	CV-2014-0006857-OC	L. Mark Riddoch
37	2014-12-15	Inactive 04/20/2017	Albertson Danial Burton, Albertson Sara	CV-2014-0006856-OC	L. Mark Riddoch
37	2014-12-12	Closed 02/14/2017	Andra Katie, Andra Travis	CV-2014-0006816-OC	L. Mark Riddoch
37	2014-11-10	Pending 05/05/2017	*John Doe*, Peterson Saleena	CV-2014-0006179-OC	Michelle R. Mallard
37	2014-11-04	Closed 05/09/2017	*John Doe*, Merrill Kelli	CV-2014-0006085-OC	Michelle R. Mallard
37	2014-10-20	Pending 07/28/2016	Chapin Benjamin, Chapin Crystal K	CV-2014-0005765-OC	Stephen J. Clark
37	2014-10-03	Pending 04/22/2016	*Jane Doe *, Salinas Jesus	CV-2014-0005451-OC	Steven A. Gardner
37	2014-10-01	Pending 10/21/2015	*Jane Doe *, Deblase Jamen Cory	CV-2014-0005372-OC	Stephen J. Clark
37	2014-08-21	Closed 06/15/2016	*John Doe*, Benson Lisa Dawn	CV-2014-0004592-OC	L. Mark Riddoch
37	2014-05-06	Inactive 11/17/2015	Bunch Andrew, Bunch Jessica	CV-2014-0002614-OC	L. Mark Riddoch
37	2014-03-11	Pending 03/28/2016	Kirchner Cheryl, Kirchner Standley	CV-2014-0001515-OC	L. Mark Riddoch
37	2014-03-04	Closed pending clerk action 11/02/2016	Doe John, Nunez Jacqueline Angelica	CV-2014-0001359-OC	L. Mark Riddoch
37	2014-01-29	Closed 07/18/2016	Matthews Eddie, Matthews Jami L	CV-2014-0000613-OC	Stephen J. Clark
37	2013-12-17	Closed 08/30/2016	Rodriguez Justin, Rodriguez Krystal	CV-2013-0006681-OC	Steven A. Gardner
37	2013-11-27	Closed pending clerk action 07/26/2016	Fowers Rachelle C, Fowers Richard D	CV-2013-0006369-OC	Stephen J. Clark
37	2013-11-19	Pending 12/15/2016	*Jane Doe *, Gasser Tobe	CV-2013-0006155-OC	L. Mark Riddoch
37	2013-11-13	Inactive 12/03/2015	Hunsaker Daniel J, Hunsaker Tami	CV-2013-0006041-OC	L. Mark Riddoch
37	2013-11-12	Closed pending clerk action 07/26/2016	*Jane Doe *, Whipple Duane Jr.	CV-2013-0005994-OC	Stephen J. Clark
37	2013-11-08	Pending 07/03/2017	Wood Leeanna, Wood Raymond	CV-2013-0005959-OC	Michelle R. Mallard
37	2013-10-03	Closed 06/14/2016	Francis Michael, Francis Stephanie E	CV-2013-0005277-OC	Steven A. Gardner
37	2013-08-29	Pending 03/28/2016	Brink Jeff, Brink Jennifer I.	CV-2013-0004578-OC	Steven A. Gardner
37	2013-06-19	Inactive 04/19/2017	Olson Dalena, Olson Mike	CV-2013-0003303-OC	Steven A. Gardner
37	2013-06-13	Closed 06/13/2016	Swanson Allen, Swanson Monica	CV-2013-0003192-OC	L. Mark Riddoch
37	2013-06-03	Pending 03/28/2016	*John Doe*, Trueblood Krystal F	CV-2013-0002901-OC	Steven A. Gardner
37	2013-03-28	Inactive 03/09/2015	*jane Doe*, Harrington William B	CV-2013-0001690-OC	L. Mark Riddoch
37	2013-02-20	Closed 07/11/2016	*John Doe*, Hernandez Angel Ruth	CV-2013-0000950-OC	Michelle R. Mallard
37	2012-10-19	Closed 06/07/2016	*John Doe*, Johnson Linda M	CV-2012-0006005-OC	L. Mark Riddoch
37	2012-09-21	Closed 06/01/2015	Doe John, Waid Brittney Lynn	CV-2012-0005409-OC	L. Mark Riddoch
37	2012-06-13	Pending 05/26/2017	DOE Jane, Hansen Justin	CV-2012-0003329-OC	Stephen J. Clark
37	2012-04-19	Pending 02/29/2016	Doe John, Goodson Rebecca	CV-2012-0002242-OC	L. Mark Riddoch
37	2011-10-31	Inactive 08/26/2015	Crane Brooke K., Doe John	CV-2011-0006751-OC	Stephen J. Clark
37	2011-10-21	Inactive 06/16/2017	Trejo Sheryl L, Trejo Todd	CV-2011-0006548-OC	L. Mark Riddoch
37	2011-08-17	Inactive 07/24/2017	Briggs Trisha, Doe John	CV-2011-0005102-OC	Steven A. Gardner
37	2011-03-30	Pending 03/28/2016	DOE Jane, Veldkamp Keith	CV-2011-0001941-OC	Stephen J. Clark
37	2011-02-15	Closed pending clerk action 12/08/2015	DOE Jane, Shigley Mark	CV-2011-0000984-OC	Jason D. Walker
37	2011-01-31	Closed 07/12/2011	Price Scott, Stuart Stephanie Gail	CV-2011-0000709-OC	Stephen J. Clark
37	2010-11-12	Inactive 05/19/2011	McCracken Charles, McCracken Robin Ann	CV-2010-0007011-OC	Stephen J. Clark
37	2010-11-08	Closed 11/22/2016	Doe John, Sanchez Maria	CV-2010-0006839-OC	Steven A. Gardner
37	2010-10-04	Closed 03/23/2011	Bierma Dennis, Bierma Jackielyn	CV-2010-0006109-OC	L. Mark Riddoch
37	2010-10-04	Closed 08/10/2015	Ockerman Jolee Diane, Ockerman Mark K	CV-2010-0006105-OC	L. Mark Riddoch
37	2010-09-14	Closed 08/19/2016	Jane Doe, Resendiz Shawn	CV-2010-0005619-OC	Michelle R. Mallard
37	2010-09-14	Inactive 07/07/2011	Messick Dustin, Messick Kaysha	CV-2010-0005615-OC	Stephen J. Clark
37	2010-08-04	Closed 08/14/2012	Hoffman John Doe, Hoffman Robyn	CV-2010-0004722-OC	Stephen J. Clark
37	2010-07-22	Closed 05/19/2011	Demma John Doe, Demma Shelly	CV-2010-0004449-OC	Colin W. Luke
37	2010-07-16	Closed 04/07/2011	De La Vega Eusebio, Jane Doe	CV-2010-0004265-OC	Michelle R. Mallard
37	2010-07-15	Closed 02/10/2011	Tortel Myles B., Tortel Venita	CV-2010-0004245-OC	L. Mark Riddoch
37	2010-07-06	Closed 04/12/2011	Jane Doe, Nielson Zachary Storer	CV-2010-0004046-OC	Colin W. Luke
37	2007-07-09	Closed 12/02/2009	Hawkinson Jason Torry, Jane Doe	CV-2007-0003867-OC	Jason D. Walker
37	2010-07-02	Closed pending clerk action 08/07/2015	Butchart Karen Maureen, Butchart Paul	CV-2010-0003975-OC	Stephen J. Clark
37	2010-06-11	Closed 03/22/2012	Reed Erin Rae, Reed Landen	CV-2010-0003523-OC	Colin W. Luke
37	2010-04-23	Closed 04/23/2015	Worden Adam, Worden Elizabeth	CV-2010-0002524-OC	Stephen J. Clark
37	2010-04-12	Pending 12/10/2015	Charelsworth Jane Doe, Charlesworth Glen W	CV-2010-0002172-OC	Stephen J. Clark
37	2010-03-26	Closed 07/22/2015	Cutler Jane Doe, Cutler Pat	CV-2010-0001926-OC	Stephen J. Clark
37	2010-03-24	Closed 02/24/2015	Dashnaw Corrine, Dashnaw David Allen Sr.	CV-2010-0001787-OC	Jason D. Walker
37	2010-03-24	Closed 07/17/2012	Clarke Lauri, Clarke Nathan W.	CV-2010-0001779-OC	Jason D. Walker
37	2010-03-02	Closed 01/19/2012	Jenkins Jane Doe, Jenkins Kendal Ray, Jerry Bergeman & Sons	CV-2010-0001313-OC	Colin W. Luke
37	2010-02-03	Closed 02/20/2015	Hill Amanda Marie, Hill John Doe	CV-2010-0000686-OC	Stephen J. Clark
37	2010-01-25	Closed 04/11/2011	Larsen Dale, Larsen Linda	CV-2010-0000484-OC	Stephen J. Clark
37	2010-01-12	Closed 12/17/2014	Ramirez Jane Doe, Ramirez Michael Joseph	CV-2010-0000174-OC	Michelle R. Mallard
37	2009-12-29	Closed 08/10/2011	Taylor Tosha, Taylor Travis	CV-2009-0007582-OC	Colin W. Luke
37	2009-12-21	Closed 02/01/2013	Barrett Brent, Barrett Jane Doe	CV-2009-0007469-OC	Michelle R. Mallard
37	2009-12-01	Inactive 11/29/2011	Dixon Jeanie, Rish Ronald	CV-2009-0007043-OC	Colin W. Luke
37	2009-11-04	Closed 04/06/2011	Christensen John Doe, Morgan Camile E.	CV-2009-0006463-OC	Jason D. Walker
37	2009-10-19	Closed 05/03/2010	Walker Lonnie, Walker Nancy	CV-2009-0006183-OC	Colin W. Luke
37	2009-09-23	Closed 08/25/2014	Brown Burlajean B, Doe John	CV-2009-0005631-OC	Michelle R. Mallard
37	2009-09-22	Closed 04/11/2011	Metcalf Amy, Metcalf Matthew C	CV-2009-0005611-OC	Michelle R. Mallard
37	2009-08-20	Closed 12/11/2012	Cartier Jane Doe, Cartier Todd	CV-2009-0004929-OC	Colin W. Luke
37	2009-08-11	Closed 04/17/2017	Nieves John Doe, Nieves Melissa A	CV-2009-0004728-OC	Jason D. Walker
37	2009-06-18	Closed 06/02/2010	Brown Blake, Brown Lisa M.	CV-2009-0003646-OC	L. Mark Riddoch
37	2009-05-29	Closed 07/19/2011	Hosac Gregg Leslie Jr., Hosac Jane Doe	CV-2009-0003222-OC	Stephen J. Clark
37	2009-05-26	Closed pending clerk action 12/28/2009	Westfall John Doe, Westfall Kimberly	CV-2009-0003178-OC	Stephen J. Clark
37	2009-05-20	Closed 08/19/2010	Coffman Derek, Coffman Stella Dawn	CV-2009-0003058-OC	L. Mark Riddoch
37	2009-05-13	Closed 04/07/2011	Karford Cyndi Marie, Karford John Doe	CV-2009-0002894-OC	L. Mark Riddoch
37	2009-05-12	Closed 11/07/2012	Thurnwald Amber N., Thurnwald John Doe	CV-2009-0002852-OC	L. Mark Riddoch
37	2009-04-24	Closed 02/25/2010	Seward Kimberly Jo, Smith John Doe	CV-2009-0002536-OC	Dane H Watkins Jr
37	2009-04-21	Closed pending clerk action 07/30/2014	Welch Grant, Welch Heather Lynn	CV-2009-0002444-OC	Michelle R. Mallard
37	2009-04-16	Closed 10/19/2011	Whitfield John Doe, Whitfield Michelle M.	CV-2009-0002300-OC	Stephen J. Clark
37	2009-04-08	Pending 06/03/2016	Doe John, Eckley Tiffany Rose	CV-2009-0002169-OC	Stephen J. Clark
37	2009-03-23	Closed 04/04/2014	Smith Barbara Lynn, Smith John Doe	CV-2009-0001839-OC	Jason D. Walker
37	2009-03-06	Closed 05/31/2012	Fitch Jason Spencer, Fitch Michelle Kay	CV-2009-0001491-OC	Colin W. Luke
37	2009-02-10	Closed 10/20/2011	Bird Russell L, Bird Tammy L.	CV-2009-0000887-OC	Stephen J. Clark
37	2009-01-29	Closed 01/27/2011	Watts Brian, Watts Kristle Jo	CV-2009-0000647-OC	Stephen J. Clark
37	2009-01-22	Closed pending clerk action 09/25/2009	Waggoner Alyssa, Waggoner Steve N	CV-2009-0000517-OC	Stephen J. Clark
37	2008-12-19	Closed 05/21/2009	Doe Jane, Salgado-Nava Andy	CV-2008-0007865-OC	Earl Blower
37	2008-12-19	Closed 09/01/2009	Johnson John Doe, Johnson Myrrian	CV-2008-0007859-OC	Michelle R. Mallard
37	2008-12-08	Closed pending clerk action 10/19/2009	Pierson Jane Doe, Pierson Ryan	CV-2008-0007592-OC	Stephen J. Clark
37	2008-12-02	Closed 01/13/2012	Smith John Doe, Smith Tracie	CV-2008-0007520-OC	Stephen J. Clark
37	2008-11-07	Closed 03/18/2010	Vazquez Deborah Lee, Vazquez Lues	CV-2008-0006996-OC	L. Mark Riddoch
37	2008-10-24	Inactive 01/29/2010	Lewis Jeremiah, Lewis Mary	CV-2008-0006676-OC	Earl Blower
37	2008-10-21	Closed 07/23/2009	Sorenson Kelly Wells, Sorenson Tony	CV-2008-0006482-OC	Stephen J. Clark
37	2008-10-09	Closed 08/20/2009	Barrow Jonathan, Barrow Natalie	CV-2008-0006277-OC	Earl Blower
37	2008-10-07	Closed 08/19/2015	Johnson Aimee Nicole, Johnson John Doe	CV-2008-0006232-OC	Michelle R. Mallard
37	2008-10-06	Inactive 01/26/2010	Harrison John Doe, Harrison Serena	CV-2008-0006174-OC	Penny Stanford
37	2008-09-25	Closed 05/03/2012	Archibald Eileen, Archibald John Doe	CV-2008-0005948-OC	L. Mark Riddoch
37	2008-09-15	Closed 03/04/2011	Jane Doe, Morrison Chris	CV-2008-0005653-OC	Michelle R. Mallard
37	2008-09-08	Closed 10/06/2010	Bartholomae Jenny Marie, Bartholomae John Doe	CV-2008-0005523-OC	Michelle R. Mallard
37	2008-07-25	Closed 06/22/2010	Rardin Lynn, Rardin Steven Burton	CV-2008-0004523-OC	L. Mark Riddoch
37	2008-07-25	Closed 04/11/2011	Weaver Jeff, Weaver Shannon	CV-2008-0004521-OC	Michelle R. Mallard
37	2008-07-21	Closed 06/10/2009	Rhodes Lisa, Rhodes Tom	CV-2008-0004394-OC	Stephen J. Clark
37	2008-07-21	Closed 07/24/2012	Reid Allen, Reid Carrie	CV-2008-0004389-OC	Earl Blower
37	2008-07-16	Closed 05/12/2010	Doe John, Yorgensen Julie D.	CV-2008-0004215-OC	L. Mark Riddoch
37	2008-06-23	Closed 06/04/2009	Gilbert Gwen L	CV-2008-0003743-OC	Earl Blower
37	2008-05-19	Closed 07/29/2010	Baker James, Baker Reatha F	CV-2008-0002906-OC	Earl Blower
37	2008-04-24	Closed 10/18/2012	Olson Dalena D., Olson Michael Jay	CV-2008-0002357-OC	Michelle R. Mallard
37	2008-04-14	Closed 01/27/2011	John Doe, White Christine N	CV-2008-0002143-OC	L. Mark Riddoch
37	2008-03-24	Closed 03/25/2013	Clegg Ashlee Marie, Lovelace Steve	CV-2008-0001727-OC	Michelle R. Mallard
37	2008-03-24	Closed 01/26/2012	Hanes Celeste, John Doe	CV-2008-0001723-OC	Stephen J. Clark
37	2007-11-30	Closed 12/12/2012	Curtis Laurie Lynn, Curtis Michael David	CV-2007-0006682-OC	Stephen J. Clark
37	2007-10-26	Closed 12/19/2011	Moldenhauer Benjamin D., Moldenhauer Jane Doe	CV-2007-0006052-OC	Steven A. Gardner
37	2007-10-22	Closed 09/26/2012	Cole John Anthony	CV-2007-0005905-OC	L. Mark Riddoch
37	2007-10-15	Closed pending clerk action 02/07/2017	Bell Bradley, Jane Doe	CV-2007-0005768-OC	Michelle R. Mallard
37	2007-08-02	Closed 07/01/2011	Jane Doe, Pace Larry L	CV-2007-0004368-OC	L. Mark Riddoch
37	2007-06-29	Closed 12/20/2011	Blair Marty, Blair Robert	CV-2007-0003726-OC	Jason D. Walker
37	2007-06-06	Closed pending clerk action 03/21/2017	Robinson Jane Doe, Robinson Joseph F.	CV-2007-0003236-OC	Michelle R. Mallard
37	2007-04-23	Closed 12/21/2010	Wolfe Adam, Wolfe Sadie	CV-2007-0002366-OC	Michelle R. Mallard
37	2007-03-30	Closed 06/02/2010	Kelso Curtis, Kelso Pauline	CV-2007-0001933-OC	Stephen J. Clark
37	2007-03-13	Closed 10/25/2012	Herrera Julie A., Herrera Larry G.	CV-2007-0001465-OC	Earl Blower
37	2006-12-29	Closed 09/08/2016	Eckley Tiffany Rose	CV-2006-0007333-OC	Jason D. Walker
37	2006-07-27	Inactive 02/05/2007	Carpenter Linda, Carpenter Ted Leroy	CV-2006-0004188-OC	Ralph L. Savage
37	2006-07-10	Closed 10/07/2009	Colby Gennie M., Colby Richard	CV-2006-0003791-OC	Michelle R. Mallard
37	2006-06-15	Closed pending clerk action 04/18/2008	Mills Brian, Mills Carrie	CV-2006-0003348-OC	Ralph L. Savage
37	2006-06-15	Closed 05/05/2010	Jenkins Kendal Lamont, Jenkins Shawna, Jerry Bergman & Sons	CV-2006-0003346-OC	Earl Blower
37	2006-06-07	Closed 07/25/2011	Christenot Tim	CV-2006-0003126-OC	Michelle R. Mallard
37	2006-04-07	Closed 06/25/2007	Colvin Joshua, Doe Jane	CV-2006-0001961-OC	Penny Stanford
37	2006-01-16	Closed 05/26/2009	Loftus Brandy, Loftus John Doe	CV-2006-0000288-OC	Penny Stanford
37	2005-04-13	Closed 12/19/2014	Cortez Pamela Iris, Griffin L.J.	CV-2005-0002069-OC	Jason D. Walker
37	2004-08-10	Closed 07/22/2009	Doe Jane, Thompson Mike L	CV-2004-0004754-OC	Colin W. Luke
37	2004-05-11	Closed 07/13/2004	Fox Tanya J., Fox Ted E.	CV-2004-0002678-OC	Ralph L. Savage
5	2014-02-03	\N	McStay, Michele H Mcstay, Bruce G	CV-2014-0000092	\N
9	2006-02-17	\N	Chandler Steven & Marsha	CV-2006-0000022	\N
12	2014-02-10	\N	Doe, Jane Robbins, Kenneth	CV-2014-0000134	\N
12	2013-02-25	\N	Doe, John Pace, Carol	CV-2013-0000181	\N
12	2013-02-25	\N	King, Angie King, Kollin C	CV-2013-0000180	\N
12	2012-07-25	\N	Clark, Christopher Clark, Stephanie	CV-2012-0000723	\N
19	2014-04-04	\N	Doe, Jane Mangan, Martin A	CV-2014-0000277	\N
19	2003-12-12	\N	Andrew, Mike Jane Doe	CV-2013-0001039	\N
19	2013-03-11	\N	Linares, Brittany Jo Linares, Jacinto J	CV-2013-0000033	\N
19	2010-10-18	\N	James, Jodi Dee	CV-2010-0001065	\N
19	2010-06-01	\N	Williams, Wendy Williams, Wes E	CV-2010-0000522	\N
19	2010-03-13	\N	Coles, Holly M Coles, Jeffrey Lloyd	CV-2010-0000239	\N
19	2008-12-06	\N	John, Doe Thompson, Sheri	CV-2008-0001025	\N
19	2007-05-09	\N	Estrada, Jaime A Estrade, Maria D	CV-2007-0000381	\N
19	2007-04-11	\N	Gonzalez, Juatigui Gonzalez, Reyna	CV-2007-0000294	\N
19	2007-04-12	\N	Gonzalez, Juatigui Gonzalez, Reyna	CV-2007-0000295	\N
19	2007-02-27	\N	Patterson, Brenda Jolyn Patterson, Shane Brian	CV-2007-0000181	\N
19	2006-07-20	\N	Carter, Jane Doe Carter, Jeffrey Dean	CV-2006-0000581	\N
19	2006-01-04	\N	Burns, Brent Bary Burns, Deana	CV-2006-0000006	\N
27	2013-10-17	\N	Jane Doe, Justesen, Roger	CV-2013-0000709	\N
27	2013-08-30	\N	Bryd, Douglas Byrd, Wendi	CV-2013-0000577	\N
27	2013-08-30	\N	Wilburn, Jason	CV-2013-0000576	\N
27	2012-12-13	\N	Jane Doe, Jones, Brenden	CV-2012-0000903	\N
27	2012-12-06	\N	Stark, James E Stark, Kelly	CV-2012-0000848	\N
27	2011-08-11	\N	Bell, Nicole Bell, Travis	CV-2011-0000610	\N
27	2011-05-03	\N	Bradley, Cody J Bradely, Krista	CV-2011-0000324	\N
27	2010-04-19	\N	Andra, Katie Andra, Travis	Cv-2010-0000304	\N
27	2010-04-13	\N	Callier, Josh Callier, Mistie	CV-2010-0000280	\N
27	2010-01-08	\N	Brockman, Casey J Brockman, Sharon	CV-2010-0000013	\N
27	2009-12-08	\N	Jane Doe, Luekenga, Antone	CV-2009-0000921	\N
27	2009-11-05	\N	Wheeless, Bellia Wheeless, Wesley A	CV-2009-0000828	\N
27	2009-04-09	\N	John Doe, Kelly, Adrianna R	CV-2009-0000279	\N
27	2008-03-31	\N	John Doe, Knetzger, Heather N	CV-2008-0000255	\N
27	2008-04-28	\N	Garcia, Anthony Garcia, carol A	CV-2008-0000024	\N
27	2008-04-29	\N	Garcia, Anthony Garcia, carol A	CV-2008-0000025	\N
27	2008-04-30	\N	Garcia, Anthony Garcia, carol A	CV-2008-0000026	\N
27	2007-11-13	\N	Price, David Price, Teri	CV-2007-00000884	\N
27	2007-10-18	\N	John Doe, Nelson, Brittany	CV-2007-00000821	\N
27	2007-06-06	\N	John Doe, Russon, Lisa	CV-2007-00000485	\N
27	2007-06-07	\N	John Doe, Russon, Lisa	CV-2007-00000486	\N
27	2007-06-08	\N	John Doe, Russon, Lisa	CV-2007-00000487	\N
27	2007-04-02	\N	Jane Doe, Keele, Trent R	CV-2007-00000295	\N
27	2007-03-20	\N	John Doe, Pence, Amy N	CV-2007-00000260	\N
27	2007-03-21	\N	John Doe, Pence, Amy N	CV-2007-00000261	\N
27	2005-09-13	\N	John Doe, Zufelt, Stephanie, D	CV-2005-00000658	\N
29	2014-02-10	\N	Abrams, Kristy L Doe, John	CV-2014-0000095	\N
29	2013-03-20	\N	Oliver, Derek Oliver, Penny Jeanne	CV-2013-0000250	\N
29	2013-01-23	\N	Hansen, Ann Hansen, Roger	CV-2013-0000067	\N
\.


--
-- Data for Name: county; Type: TABLE DATA; Schema: public; Owner: Mehrotra
--

COPY county (id, name) FROM stdin;
5	Blaine
6	Bear+Lake
7	Bingham
8	Boundary
9	Butte
10	Canyon
11	Caribou
12	Cassia
13	Clark
14	Custer
15	Fremont
16	Gem
17	Gooding
18	Idaho
19	Jefferson
20	Jerome
21	Kootenai
23	Latah
24	Lemhi
25	Lewis
26	Lincoln
27	Madison
29	Minidoka
30	Nez+Perce
31	Owyhee
32	Payette
33	Power
34	Teton
35	Washington
36	Bannock
37	Bonneville
\.


--
-- Name: county_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mehrotra
--

SELECT pg_catalog.setval('county_id_seq', 37, true);


--
-- Data for Name: judgements; Type: TABLE DATA; Schema: public; Owner: Mehrotra
--

COPY judgements (id, case_number, judgement_amount, judgement_type, judgement_date) FROM stdin;
65	CV-2016-0002464-OC	0.00	Money Judgment-Default	2016-09-07
66	CV-2016-0001456-OC	2404.83	Money Judgment-Default	2016-07-22
67	CV-2016-0000769-OC	0.00	Money Judgment-Default	2016-04-26
68	CV-2016-0000601-OC	0.00	Money Judgment-Default	2016-04-12
69	CV-2015-0003701-OC	0.00	Money Judgment-Default	2015-12-22
70	CV-2015-0003107-OC	0.00	Money Judgment-Default	2015-12-01
71	CV-2015-0002546-OC	0.00	Money Judgment-Default	2015-10-06
72	CV-2015-0002160-OC	0.00	Money Judgment-Default	2015-09-22
73	CV-2015-0001070-OC	1333.70	Money Judgment-Default	2015-05-22
74	CV-2015-0000987-OC	38828.78	Money Judgment-Default	2015-05-19
75	CV-2015-0000412-OC	1389.15	Money Judgment-Default	2015-03-30
76	CV-2014-0004864-OC	4597.60	Money Judgment	2017-05-26
77	CV-2014-0004515-OC	0.00	Money Judgment-Default	2015-04-10
78	CV-2014-0001722-OC	0.00	Money Judgment-Default	2014-07-02
79	CV-2014-0001248-OC	534.86	Money Judgment	2016-12-20
80	CV-2014-0001129-OC	0.00	Money Judgment-Default	2014-04-30
81	CV-2013-0004755-OC	8689.15	Money Judgment	2016-12-02
82	CV-2013-0004196-OC	499.43	Money Judgment	2016-06-09
83	CV-2013-0003798-OC	0.00	Money Judgment	2016-04-27
84	CV-2013-0001469-OC	1595.04	Money Judgment	2016-07-12
85	CV-2012-0004252-OC	723.40	Money Judgment-Default	2012-11-30
86	CV-2012-0004021-OC	2083.70	Money Judgment-Default	2012-11-08
87	CV-2012-0003180-OC	1350.56	Money Judgment-Default	2012-09-13
88	CV-2012-0002384-OC	4130.40	Money Judgment-Default	2012-09-20
89	CV-2012-0001209-OC	1188.47	Money Judgment-Default	2012-05-02
90	CV-2012-0000747-OC	1200.70	Money Judgment-Default	2012-04-11
91	CV-2012-0000408-OC	853.02	Money Judgment-Default	2017-02-10
92	CV-2011-0005533-OC	749.70	Money Judgment-Default	2012-02-09
93	CV-2011-0004911-OC	981.82	Money Judgment-Default	2012-01-06
94	CV-2011-0003472-OC	724.37	Money Judgment	2012-02-09
95	CV-2011-0003465-OC	833.91	Money Judgment-Default	2011-10-18
96	CV-2011-0003323-OC	1288.44	Money Judgment-Default	2011-10-05
97	CV-2011-0002966-OC	858.34	Money Judgment	2014-01-22
98	CV-2011-0002871-OC	532.00	Money Judgment	2012-12-13
99	CV-2011-0002819-OC	1383.85	Money Judgment-Default	2011-09-15
100	CV-2011-0002374-OC	1597.24	Money Judgment-Default	2011-08-01
101	CV-2011-0002320-OC	540.00	Money Judgment	2015-09-24
102	CV-2011-0001910-OC	1375.71	Money Judgment-Default	2011-06-27
103	CV-2011-0000225-OC	2005.46	Money Judgment-Default	2011-03-18
104	CV-2010-0003812-OC	1431.85	Money Judgment	2015-12-10
105	CV-2010-0003811-OC	6316.58	Money Judgment	2013-02-20
106	CV-2010-0003427-OC	2927.25	Money Judgment	2015-09-24
107	CV-2010-0003133-OC	2661.35	Money Judgment-Default	2010-10-15
108	CV-2010-0001408-OC	555.40	Money Judgment-Default	2010-06-16
109	CV-2010-0000837-OC	1138.28	Money Judgment-Default	2010-04-20
110	CV-2010-0000767-OC	2263.57	Money Judgment	2015-04-03
111	CV-2010-0000482-OC	1529.90	Money Judgment-Default	2010-04-05
112	CV-2009-0003428-OC	0.00	Money Judgment-Default	2010-02-12
113	CV-2009-0002517-OC	1493.54	Money Judgment	2014-08-20
114	CV-2009-0002074-OC	1179.43	Default Judgment	2009-07-15
115	CV-2009-0001076-OC	543.22	Money Judgment-Default	2009-04-29
116	CV-2008-0004674-OC	1816.46	Money Judgment-Default	2009-10-28
117	CV-2008-0003859-OC	2443.20	Money Judgment	2011-03-24
118	CV-2008-0003809-OC	2357.10	Money Judgment-Default	2008-10-31
119	CV-2008-0003191-OC	512.50	Money Judgment	2009-07-20
120	CV-2008-0002942-OC	6814.01	Money Judgment-Default	2008-09-09
121	CV-2008-0002939-OC	1695.16	Default Judgment	2008-09-23
122	CV-2008-0002938-OC	288.53	Default Judgment	2008-09-09
123	CV-2007-0004797-OC	1080.64	Money Judgment-Default	2007-12-31
124	CV-2007-0004453-OC	2716.63	Money Judgment	2017-08-11
125	CV-2007-0004301-OC	150.00	Other:	2008-08-11
126	CV-2007-0004039-OC	987.05	Money Judgment-Default	2007-11-09
127	CV-2007-0002171-OC	1917.49	Default Judgment	2007-07-05
128	CV-2006-0004975-OC	804.97	Money Judgment-Default	2007-01-16
129	CV-2006-0002383-OC	504.45	Money Judgment-Default	2006-07-27
130	CV-2006-0002382-OC	598.50	Money Judgment	2008-07-07
131	CV-2015-0001081	1098.49	Money Jdgmt Default	2015-09-09
132	CV-2015-0001037	3534.19	Money Jdgmt Default	2015-08-19
133	CV-2015-0000587	1592.08	Default Judgment	2015-05-27
134	CV-2014-0001875	2945.78	Money Jdgmt Default	2014-11-20
135	CV-2014-0001828	3439.87	Money Jdgmt Default	2014-11-24
136	CV-2013-0001820	1002.77	Money Jdgmt Default	2013-11-12
137	CV-2012-0002228	0.00	Inactivity Dismissal	2017-03-08
138	CV-2015-0000672	3519.93	Default Judgment	2015-09-22
139	CV-2012-0000599	36215.66	Default Judgment	2013-01-22
140	CV-2016-0000297	2410.84	Default Judgment	2016-07-19
141	CV-2016-0000175	0.00	Default Judgment	2016-05-27
142	CV-2015-0000424	0.00	Default Judgment	2015-11-16
143	CV-2014-0000600	1178.75	Money Judgment	2016-04-04
144	CV-2014-0000636	10507.65	Default Judgment	2014-10-27
145	CV-2014-0000276	869.00	Default Judgment	2014-07-10
146	CV-2014-0000059	845.22	Default Judgment	2014-04-16
147	CV-2013-0000705	1725.43	Default Judgment	2013-10-25
148	CV-2013-0000653	10537.88	Default Judgment	2013-09-23
149	CV-2013-0000615	3342.86	Default Judgment	2013-10-01
150	CV-2013-0000272	0.00	Default Judgment	2013-06-20
151	CV-2013-0000239	720.94	Default Judgment	2013-04-24
152	CV-2013-0000233	3068.94	Default Judgment	2013-04-29
153	CV-2013-0000123	6875.20	Default Judgment	2013-04-05
154	CV-2012-0001026	7087.67	Default Judgment	2013-01-22
155	CV-2012-0000967	0.00	Default Judgment	2013-01-22
156	CV-2012-0000879	887.51	Default Judgment	2012-12-14
157	CV-2012-0000875	1092.65	Default Judgment	2012-12-11
158	CV-2012-0000713	2432.49	Default Judgment	2012-10-25
159	CV-2012-0000664	1319.51	Other	2017-08-01
160	CV-2012-0000619	776.60	Default Judgment	2012-11-20
161	CV-2012-0000603	0.00	Default Judgment	2013-02-13
162	CV-2012-0000166	801.91	Money Judgment	2016-09-29
163	CV-2010-0001301	546.00	Money Judgment	2017-04-12
164	CV-2010-0001277	300.00	Money Judgment	2014-08-05
165	CV-2010-0000845	6885.42	Money Judgment	2015-09-29
166	CV-2010-0000703	974.89	Money Judgment	2013-03-07
167	CV-2010-0000613	0.00	Default Judgment	2010-08-31
168	CV-2010-0000238	2574.19	Other	2017-06-01
169	CV-2009-0001047	3589.18	Money Judgment	2013-01-03
170	CV-2009-0000234	5276.68	Default Judgment	2009-05-01
171	CV-2009-0000151	855.00	Money Judgment	2014-09-19
172	CV-2008-0001058	635.30	Default Judgment	2009-04-09
173	CV-2008-0001024	642.00	Other	2015-09-15
174	CV-2008-0000963	479.50	Default Judgment	2009-09-16
175	CV-2008-0000892	500.00	Money Judgment	2013-12-04
176	CV-2008-0000836	656.91	Default Judgment	2008-12-05
177	CV-2008-0000831	2876.77	Default Judgment	2008-12-03
178	CV-2008-0000738	866.74	Default Judgment	2008-10-30
179	CV-2008-0000367	3941.75	Other	2013-03-25
180	CV-2007-0000293	560.81	Money Judgment	2016-11-21
181	CV-2007-0000152	4860.21	Default Judgment	2007-04-16
182	CV-2007-0000026	505.50	Other:	2008-02-26
183	CV-2006-0000984	5695.40	Default Judgment	2007-01-23
184	CV-2006-0000963	1766.38	Money Judgment	2016-10-13
185	CV-2014-0000110	1107.83	Money Judgmt Default	2014-04-09
186	CV-2013-0000450	1711.02	Money Judgmt Default	2014-02-26
187	CV-2012-0000550	3189.80	Money Judgment	2015-07-13
188	CV-2016-0000027	1703.32	Default	2016-04-12
189	CV-2014-0000215	2003.60	Default	2014-10-27
190	CV-2014-0000084	1866.37	Default	2014-06-04
191	CV-2016-0003472-OC	3284.89	Default Judgment	2016-08-17
192	CV-2016-0002920-OC	1713.15	Default Judgment	2016-08-01
193	CV-2016-0002301-OC	2010.47	Default Judgment	2016-07-05
194	CV-2016-0001141-OC	1693.72	Default Judgment	2016-05-02
195	CV-2015-0005659-OC	3019.96	Default Judgment	2015-12-18
196	CV-2015-0005293-OC	8425.13	Default Judgment	2015-12-22
197	CV-2015-0005294-OC	11124.34	Default Judgment	2015-12-01
198	CV-2015-0004793-OC	1389.40	Default Judgment	2015-11-13
199	CV-2015-0004619-OC	3802.13	Default Judgment	2015-10-29
200	CV-2015-0004463-OC	1115.91	Default Judgment	2015-11-03
201	CV-2015-0004201-OC	1465.11	Default Judgment	2015-11-13
202	CV-2015-0003472-OC	1001.00	Default Judgment	2015-09-24
203	CV-2015-0003256-OC	7294.21	Default Judgment	2015-08-20
204	CV-2015-0002573-OC	943.12	Default Judgment	2015-07-27
205	CV-2015-0002498-OC	2903.93	Default Judgment	2015-07-20
206	CV-2015-0002314-OC	2276.09	Money Judgment	2015-08-17
207	CV-2015-0002119-OC	2212.08	Default Judgment	2015-07-07
208	CV-2015-0002091-OC	1272.16	Default Judgment	2015-07-03
209	CV-2015-0002063-OC	4206.58	Default Judgment	2015-06-08
210	CV-2015-0001925-OC	2474.35	Money Jdgmt Default	2015-06-12
211	CV-2015-0001808-OC	2139.39	Money Jdgmt Default	2015-06-11
212	CV-2015-0001642-OC	1862.74	Default Judgment	2015-05-19
213	CV-2015-0001597-OC	4593.81	Default Judgment	2015-06-02
214	CV-2015-0000614-OC	2379.84	Default Judgment	2015-04-08
215	CV-2014-0006857-OC	3766.00	Default Judgment	2015-03-06
216	CV-2014-0006856-OC	1458.62	Default Judgment	2015-03-11
217	CV-2014-0006816-OC	13565.32	Default Judgment	2015-03-06
218	CV-2014-0006179-OC	1606.28	Default Judgment	2015-03-19
219	CV-2014-0006085-OC	1194.17	Default Judgment	2014-12-23
220	CV-2014-0005765-OC	3317.19	Default Judgment	2014-12-22
221	CV-2014-0005451-OC	5119.27	Default Judgment	2014-12-12
222	CV-2014-0005372-OC	4242.54	Default Judgment	2014-12-15
223	CV-2014-0004592-OC	619.12	Money Jdgmt Default	2014-10-09
224	CV-2014-0002614-OC	696.88	Default Judgment	2014-06-25
225	CV-2014-0001515-OC	3581.83	Default Judgment	2014-04-25
226	CV-2014-0001359-OC	911.70	Default Judgment	2014-05-16
227	CV-2014-0000613-OC	3521.61	Default Judgment	2014-03-27
228	CV-2013-0006681-OC	5671.76	Money Judgment	2016-08-30
229	CV-2013-0006369-OC	3329.55	Money Judgment	2016-07-26
230	CV-2013-0006155-OC	6919.20	Money Jdgmt Default	2014-01-22
231	CV-2013-0006041-OC	5563.76	Money Jdgmt Default	2014-01-27
232	CV-2013-0005994-OC	2388.87	Money Judgment	2016-07-26
233	CV-2013-0005959-OC	644.21	Default Judgment	2014-03-06
234	CV-2013-0005277-OC	4459.43	Money Judgment	2016-06-14
235	CV-2013-0004578-OC	2621.04	Default Judgment	2013-10-18
236	CV-2013-0003303-OC	3892.40	Default Judgment	2013-09-05
237	CV-2013-0003192-OC	3757.21	Money Jdgmt Default	2013-07-29
238	CV-2013-0002901-OC	1708.15	Default Judgment	2013-07-29
239	CV-2013-0001690-OC	2861.09	Default Judgment	2013-07-16
240	CV-2013-0000950-OC	2963.72	Money Judgment	2016-07-11
241	CV-2012-0006005-OC	816.22	Money Jdgmt Default	2012-12-07
242	CV-2012-0005409-OC	1449.84	Money Jdgmt Default	2012-11-30
243	CV-2012-0003329-OC	1615.43	Default Judgment	2012-08-09
244	CV-2012-0002242-OC	2979.90	Money Judgment	2016-06-14
245	CV-2011-0006751-OC	4877.25	Default Judgment	2011-12-30
246	CV-2011-0006548-OC	2498.25	Money Jdgmt Default	2011-12-15
247	CV-2011-0005102-OC	1432.79	Default Judgment	2011-10-28
248	CV-2011-0001941-OC	901.93	Money Judgment	2014-05-22
249	CV-2011-0000984-OC	921.78	Default Judgment	2011-04-01
250	CV-2011-0000709-OC	2716.19	Default Judgment	2011-08-25
251	CV-2010-0007011-OC	1864.23	Default Judgment	2011-01-21
252	CV-2010-0006839-OC	5821.77	Default Judgment	2010-12-30
253	CV-2010-0006109-OC	3490.25	Money Jdgmt Default	2010-11-29
254	CV-2010-0006105-OC	3827.83	Money Jdgmt Default	2010-11-29
255	CV-2010-0005619-OC	716.00	Money Judgment	2011-12-08
256	CV-2010-0005615-OC	1306.19	Default Judgment	2011-03-02
257	CV-2010-0004722-OC	250.00	Money Judgment	2012-08-14
258	CV-2010-0004449-OC	2383.03	Default Judgment	2010-10-15
259	CV-2010-0004265-OC	317.55	Default Judgment	2010-09-01
260	CV-2010-0004245-OC	1927.78	Money Jdgmt Default	2010-10-14
261	CV-2010-0004046-OC	3158.37	Default Judgment	2010-08-24
262	CV-2010-0003975-OC	1647.67	Default Judgment	2010-10-13
263	CV-2010-0003523-OC	1642.26	Default Judgment	2010-10-01
264	CV-2010-0002524-OC	1137.32	Default Judgment	2010-06-21
265	CV-2010-0002172-OC	5265.91	Default Judgment	2010-06-09
266	CV-2010-0001926-OC	1764.71	Money Judgment	2015-07-22
267	CV-2010-0001787-OC	1085.07	Money Judgment	2015-02-24
268	CV-2010-0001779-OC	2095.47	Money Judgment	2017-04-03
269	CV-2010-0001313-OC	1611.93	Money Judgment	2011-09-07
270	CV-2010-0000686-OC	1538.76	Default Judgment	2010-03-19
271	CV-2010-0000484-OC	604.06	Default Judgment	2010-03-15
272	CV-2010-0000174-OC	3346.90	Money Jdgmt Default	2014-12-17
273	CV-2009-0007582-OC	3906.88	Default Judgment	2010-02-19
274	CV-2009-0007469-OC	3876.61	Money Judgment	2013-02-01
275	CV-2009-0007043-OC	1797.30	Default Judgment	2010-09-28
276	CV-2009-0006463-OC	1552.20	Money Judgment	2016-11-10
277	CV-2009-0006183-OC	1154.17	Default Judgment	2009-12-02
278	CV-2009-0005631-OC	2354.43	Money Judgment	2014-08-25
279	CV-2009-0005611-OC	485.00	Money Judgment	2011-04-11
280	CV-2009-0004929-OC	1688.13	Money Judgment	2012-12-11
281	CV-2009-0004728-OC	8437.60	Default Judgment	2009-09-25
282	CV-2009-0003646-OC	1101.59	Money Jdgmt Default	2009-08-05
283	CV-2009-0003222-OC	2529.29	Default Judgment	2011-07-19
284	CV-2009-0003178-OC	1157.95	Money Judgment	2011-06-22
285	CV-2009-0003058-OC	2708.62	Money Jdgmt Default	2009-06-29
286	CV-2009-0002894-OC	2149.06	Money Jdgmt Default	2009-06-25
287	CV-2009-0002852-OC	2817.27	Money Jdgmt Default	2009-07-02
288	CV-2009-0002536-OC	24205.11	Default Judgment-Pla	2009-06-12
289	CV-2009-0002444-OC	4206.38	Money Judgment	2014-08-04
290	CV-2009-0002300-OC	1521.31	Default Judgment	2009-06-15
291	CV-2009-0002169-OC	1168.40	Default Judgment	2009-06-03
292	CV-2009-0001839-OC	2215.92	Money Judgment	2014-04-04
293	CV-2009-0001491-OC	5603.51	Default Judgment	2009-04-21
294	CV-2009-0000887-OC	2186.64	Default Judgment	2009-04-08
295	CV-2009-0000647-OC	2664.43	Default Judgment	2009-03-25
296	CV-2009-0000517-OC	1262.22	Default Judgment	2009-03-25
297	CV-2008-0007865-OC	1306.32	Default Judgment	2009-01-28
298	CV-2008-0007859-OC	1021.07	Default Judgment	2009-02-09
299	CV-2008-0007592-OC	873.21	Default Judgment	2009-01-29
300	CV-2008-0007520-OC	664.02	Default Judgment	2009-01-29
301	CV-2008-0006996-OC	832.80	Money Jdgmt Default	2009-01-06
302	CV-2008-0006676-OC	4102.27	Default Judgment	2008-12-09
303	CV-2008-0006482-OC	844.47	Default Judgment	2008-12-22
304	CV-2008-0006277-OC	2095.32	Default Judgment	2008-12-08
305	CV-2008-0006232-OC	1805.28	Default Judgment-Pla	2008-11-26
306	CV-2008-0006174-OC	847.72	Default Judgment	2008-12-02
307	CV-2008-0005948-OC	959.00	Money Judgment	2012-05-03
308	CV-2008-0005653-OC	5067.12	Default Judgment-Pla	2008-10-24
309	CV-2008-0005523-OC	1111.44	Default Judgment-Pla	2008-10-23
310	CV-2008-0004523-OC	3776.39	Money Judgment	2010-06-22
311	CV-2008-0004521-OC	3850.46	Money Judgment	2011-04-11
312	CV-2008-0004394-OC	2929.98	Default Judgment	2008-09-29
313	CV-2008-0004389-OC	2479.56	Default Judgment	2008-09-08
314	CV-2008-0004215-OC	6177.41	Money Jdgmt Default	2008-09-17
315	CV-2008-0003743-OC	1066.37	Default Judgment-Pla	2008-08-04
316	CV-2008-0002906-OC	4373.94	Default Judgment	2008-07-15
317	CV-2008-0002357-OC	1232.50	Money Judgment	2012-10-18
318	CV-2008-0002143-OC	1250.00	Money Judgment	2011-01-27
319	CV-2008-0001727-OC	2688.84	Money Judgment	2013-03-25
320	CV-2008-0001723-OC	1961.73	Default Judgment	2008-05-13
321	CV-2007-0006682-OC	1214.32	Default Judgment	2012-12-27
322	CV-2007-0006052-OC	1000.00	Money Judgment	2011-12-19
323	CV-2007-0005905-OC	2069.18	Money Jdgmt Default	2007-12-10
324	CV-2007-0005768-OC	959.00	Default Judgment	2011-06-15
325	CV-2007-0004368-OC	4346.67	Money Judgment	2011-07-01
326	CV-2007-0003867-OC	811.00	Money Judgment	2017-04-16
327	CV-2007-0003726-OC	644.50	Money Judgment	2010-07-07
328	CV-2007-0003236-OC	1903.63	Money Judgment	2012-04-04
329	CV-2007-0002366-OC	985.50	Money Judgment	2010-08-31
330	CV-2007-0001933-OC	1878.70	Default Judgment	2010-06-02
331	CV-2007-0001465-OC	2572.58	Order	2010-06-18
332	CV-2006-0007333-OC	1303.02	Money Judgment	2016-09-29
333	CV-2006-0004188-OC	332.54	Money Jdgmt Default	2006-10-16
334	CV-2006-0003791-OC	645.59	Order	2009-03-06
335	CV-2006-0003348-OC	509.50	Money Judgment	2008-04-18
336	CV-2006-0003346-OC	6640.18	Default Judgment	2009-03-12
337	CV-2006-0003126-OC	479.00	Money Judgment	2008-12-03
338	CV-2006-0001961-OC	1378.13	Money Judgment	2012-06-06
339	CV-2006-0000288-OC	789.61	Default Judgment	2006-03-23
340	CV-2005-0002069-OC	2050.59	Money Judgment	2014-12-19
341	CV-2004-0004754-OC	0.00	Default Judgment-Pla	2004-09-15
342	CV-2004-0002678-OC	0.00	Money Judgment	2004-07-13
852	CV-2014-0000092	3591.70	Money	2014-03-26
853	CV-2006-0000022	4555.32	X	2006-04-24
854	CV-2014-0000134	720.06	X	2014-04-04
855	CV-2013-0000181	4357.35	X	2013-04-15
856	CV-2013-0000180	1670.95	X	2013-04-15
857	CV-2013-0000181	1671.95	X	2013-04-16
858	CV-2012-0000723	1778.25	X	2012-09-06
859	CV-2014-0000276	869.00	X	2014-07-10
860	CV-2014-0000277	870.00	X	2014-07-11
861	CV-2013-0001039	16114.21	X	2014-01-28
862	CV-2013-0000272	1124.38	X	2013-06-20
863	CV-2013-0000239	720.94	X	2013-04-24
864	CV-2013-0000033	3068.94	X	2013-04-29
865	CV-2012-0000875	1092.65	X	2012-12-11
866	CV-2012-0000713	2432.49	X	2012-10-25
867	CV-2012-0000664	2805.54	X	2017-08-01
868	CV-2012-0000619	776.00	X	2012-11-20
869	CV-2012-0000166	874.28	X	2012-09-10
870	CV-2010-0001277	6858.64	X	2011-02-11
871	CV-2010-0001065	906.14	X	20110-12-14
872	CV-2010-0000845	4983.76	X	2010-12-07
873	CV-2010-0000703	3234.15	X	2010-09-14
874	CV-2010-0000522	1788.79	X	2010-07-29
875	CV-2010-0000238	2433.11	X	2010-04-23
876	CV-2010-0000239	2434.11	X	2010-04-24
877	CV-2009-0001047	2073.21	X	2010-01-06
878	CV-2009-0000234	5276.68	X	2009-05-01
879	CV-2009-0000151	929.49	X	2009-04-09
880	CV-2008-0001058	635.00	X	2009-04-09
881	CV-2008-0001024	734.55	X	2009-02-11
882	CV-2008-0001025	735.55	X	2009-02-12
883	CV-2008-0000963	415.40	X	2009-03-16
884	CV-2008-0000892	1491.81	X	2008-12-18
885	CV-2008-0000836	656.91	X	2008-12-05
886	CV-2008-0000831	2876.77	X	2008-12-03
887	CV-2008-0000738	866.74	X	2008-10-30
888	CV-2008-0000367	3747.75	X	2008-06-13
889	CV-2007-0000381	704.67	X	2007-06-20
890	CV-2007-0000294	919.30	X	2007-05-30
891	CV-2007-0000295	920.30	X	2007-05-31
892	CV-2007-0000293	4535.76	X	2007-06-05
893	CV-2007-0000181	687.40	X	2007-05-03
894	CV-2007-0000152	4810.21	X	2007-03-28
895	CV-2007-0000152	4810.21	X	2007-03-28
896	CV-2007-0000026	966.37	X	2007-03-01
897	CV-2006-0000984	5695.40	X	2007-01-23
898	CV-2006-0000963	657.91	X	2007-01-10
899	CV-2006-0000581	371.59	X	2006-10-17
900	CV-2006-0000006	5914.64	X	2006-04-28
901	CV-2013-0000709	385.54	X	2014-01-16
902	CV-2013-0000577	741.49	X	2013-11-13
903	CV-2013-0000576	3369.06	X	2013-12-05
904	CV-2012-0000903	4938.33	X	2013-02-20
905	CV-2012-0000848	5564.91	X	2013-02-07
906	CV-2011-0000610	6667.05	X	2011-10-05
907	CV-2011-0000324	13281.55	X	2011-06-20
908	Cv-2010-0000304	6153.57	X	2010-06-23
909	CV-2010-0000280	5525.74	X	2010-06-23
910	CV-2010-0000013	9300.22	X	2010-02-24
911	CV-2009-0000921	1389.19	X	2010-02-04
912	CV-2009-0000828	4452.34	X	2009-12-30
913	CV-2009-0000279	4623.88	X	2009-06-17
914	CV-2008-0000255	8221.54	X	2008-06-04
915	CV-2008-0000024	9639.69	X	2008-04-28
916	CV-2008-0000025	9640.69	X	2008-04-29
917	CV-2008-0000026	9641.69	X	2008-04-30
918	CV-2007-00000884	755.38	X	2008-01-18
919	CV-2007-00000821	1589.44	X	2007-12-14
920	CV-2007-00000485	736.34	X	2007-07-31
921	CV-2007-00000486	737.34	X	2007-08-01
922	CV-2007-00000487	738.34	X	2007-08-02
923	CV-2007-00000295	3410.10	X	2007-05-22
924	CV-2007-00000260	1818.33	X	2007-05-03
925	CV-2007-00000261	1819.33	X	2007-05-04
926	CV-2005-00000658	5028.08	X	2005-12-09
927	CV-2014-0000110	1107.83	Money	2014-04-09
928	CV-2014-0000095	3771.99	Money	2015-10-27
929	CV-2013-0000250	714.95	X	2013-05-09
930	CV-2013-0000067	7765.87	X	2013-03-28
931	CV-2014-0000084	1866.37	X	2014-06-04
\.


--
-- Name: judgements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mehrotra
--

SELECT pg_catalog.setval('judgements_id_seq', 931, true);


--
-- Data for Name: warrants; Type: TABLE DATA; Schema: public; Owner: Mehrotra
--

COPY warrants (id, case_number, issued, reason, bond_amount, defendant) FROM stdin;
138	CV-2016-0002464-OC	2017-05-25		500.00	Falconer Jo Anna
143	CV-2016-0001456-OC	2016-04-26		0.00	cr (Bannock County Sheriff office searched for original warrant but could not find the original/warrant was cancelled on 2-28-17; they made exhaustive search but could not find);
144	CV-2016-0001456-OC	2017-02-22		500.00	Jaramillo Jose M
153	CV-2016-0000769-OC	2017-02-10		500.00	Martinez Maricela
158	CV-2016-0000601-OC	2016-12-28		500.00	Hopkins Kenneth
159	CV-2016-0000601-OC	2017-01-04		500.00	Bond Posted - Surety (Amount 500.00 ): Warrant: Bonded by Debbie's Bail Bonds
168	CV-2015-0003701-OC	2016-07-25		0.00	Minute Entry and Order s/ J. Clark 7-25-16; hearing held 7-25-16; motion for contempt granted; Plaintiff to submit bench warrant for court's signature
169	CV-2015-0003701-OC	2016-08-05		500.00	Powell Julie Ann
170	CV-2015-0003701-OC	2016-11-09		750.00	Powell Julie Ann
2120	CV-2014-0000092	2014-09-17	\N	40000.00	McStay, Michele H Mcstay, Bruce G
2121	CV-2006-0000022	2010-10-06	\N	0.00	Chandler Steven & Marsha
2122	CV-2014-0000134	2014-10-14	\N	0.00	Doe, Jane Robbins, Kenneth
2123	CV-2013-0000181	2013-10-03	\N	0.00	Doe, John Pace, Carol
2124	CV-2013-0000180	2013-10-03	\N	0.00	King, Angie King, Kollin C
2125	CV-2012-0000723	2013-03-13	\N	0.00	Clark, Christopher Clark, Stephanie
2126	CV-2014-0000276	2014-11-13	\N	500.00	Doe, Jane Mangan, Martin A
2127	CV-2013-0001039	2014-06-17	\N	0.00	Andrew, Mike Jane Doe
2128	CV-2013-0000272	2013-11-19	\N	0.00	Schell, Jane Doe Schell, John
2129	CV-2013-0000239	2014-03-17	\N	0.00	Parker, Brent Parker, Kristine B
2130	CV-2013-0000033	2015-04-14	\N	0.00	Linares, Brittany Jo Linares, Jacinto J
183	CV-2015-0003107-OC	2016-12-28		500.00	Barlow Daryenne
2131	CV-2012-0000875	2014-11-13	\N	0.00	Smith, Rachel Smith, Shane Eldon
2132	CV-2012-0000713	2014-03-17	\N	0.00	Fillmore, Craig Lynn
2133	CV-2012-0000664	2014-07-22	\N	0.00	Convington, Jane Doe Covington, Jory T
2134	CV-2012-0000619	2013-06-18	\N	0.00	Christensen, Amanda N Christensen, Josh
188	CV-2015-0002546-OC	2016-04-26		1000.00	Wilson Craig Allen
2135	CV-2012-0000166	2013-05-01	\N	0.00	Bowcutt, Jane Doe Bowcutt, Quentin K
2136	CV-2010-0001277	2012-02-24	\N	0.00	Davis, J Alan Davis, Jennifer
2137	CV-2010-0001065	2011-07-26	\N	0.00	James, Jodi Dee
2138	CV-2010-0000845	2012-01-31	\N	0.00	Wilde, John Doe Wilde, Shelly
193	CV-2015-0002160-OC	2016-05-18		500.00	Carter Diana L
2139	CV-2010-0000703	2011-01-14	\N	0.00	Barber, Dawn Barber, Lance D
2140	CV-2010-0000522	2012-12-21	\N	0.00	Williams, Wendy Williams, Wes E
2141	CV-2010-0000238	2010-09-15	\N	0.00	Coles, Holly M Coles, Jeffrey Lloyd
2142	CV-2009-0001047	2011-06-30	\N	0.00	Oler, Deena Lynn Oler, John Doe
198	CV-2015-0001070-OC	2016-07-25		0.00	Minute Entry and Order; hearing held 7-25-16; motion for contempt granted; Plaintiff to submit bench warrant for court's signature; s/ J. Clark 7-25-16
199	CV-2015-0001070-OC	2016-08-05		500.00	Lacy Joseph T
2143	CV-2009-0000234	2011-01-14	\N	0.00	Layton, Brent Layton, Shawntell
2144	CV-2009-0000151	2010-11-10	\N	0.00	Doe, John Stowers, Rebecca Ann
2145	CV-2008-0001058	2015-04-30	\N	0.00	Doe, John Sakan, Karla R
2146	CV-2008-0001024	2009-05-19	\N	0.00	John, Doe Thompson, Sheri
2147	CV-2008-0000963	2009-07-23	\N	0.00	Graham, Dennis Graham, Marcia
2148	CV-2008-0000892	2010-05-05	\N	0.00	Baler, John Doe Baler, Nikki
2149	CV-2008-0000836	2009-04-16	\N	0.00	Wakley, Charity Ann Waley, John Doe
2150	CV-2008-0000831	2009-04-16	\N	0.00	Acor, Kevin T Acor, Tiffany
208	CV-2015-0000987-OC	2016-02-10		300.00	Wiebelhaus Sky E
209	CV-2015-0000987-OC	2016-03-01		300.00	Bond Posted - Surety (Amount 300.00 ): Bench Warrant: Bonded by Debbie's Bail Bonds
2151	CV-2008-0000738	2010-05-05	\N	0.00	Roberts, Corry Roberts, Jessica Helene
2152	CV-2008-0000367	2011-05-10	\N	0.00	Coffey, Tyanna Daylene Wellard, Matthew J
2153	CV-2007-0000381	2008-07-03	\N	0.00	Estrada, Jaime A Estrade, Maria D
2154	CV-2007-0000294	2008-02-14	\N	0.00	Gonzalez, Juatigui Gonzalez, Reyna
2155	CV-2007-0000293	2010-03-24	\N	0.00	Rogers, Gale Wayne Rogers, Melanie Mobley
2156	CV-2007-0000181	2007-08-28	\N	0.00	Patterson, Brenda Jolyn Patterson, Shane Brian
2157	CV-2007-0000152	2008-02-28	\N	0.00	Baker, Jennie M Baker, Matthew L
2158	CV-2007-0000026	2007-11-06	\N	0.00	Owens, Jane Doe Owens, Steven
218	CV-2015-0000412-OC	2017-02-01		500.00	Williams Sallie Francine
2159	CV-2006-0000984	2008-11-26	\N	0.00	Morgan, Jennifer Lou Morgan, John Doe
2160	CV-2006-0000963	2008-02-29	\N	0.00	Landon, Jane Doe Landon, Jared Daniel
2161	CV-2006-0000581	2007-04-10	\N	0.00	Carter, Jane Doe Carter, Jeffrey Dean
2162	CV-2006-0000006	2007-04-19	\N	0.00	Burns, Brent Bary Burns, Deana
223	CV-2014-0004864-OC	2015-12-04		500.00	Myler Joshua David
2163	CV-2013-0000709	2014-10-14	\N	0.00	Jane Doe, Justesen, Roger
2164	CV-2013-0000577	2014-06-03	\N	0.00	Bryd, Douglas Byrd, Wendi
2165	CV-2013-0000576	2014-05-15	\N	0.00	Wilburn, Jason
2166	CV-2012-0000903	2013-08-15	\N	500.00	Jane Doe, Jones, Brenden
228	CV-2014-0004515-OC	2015-10-13		0.00	Minute Entry and Order: hearing held; defenant failed to appear; request for warrant is granted: s/ Clark 10/13/2015
229	CV-2014-0004515-OC	2015-10-21		1642.10	Morrison Mistie
2167	CV-2012-0000848	2014-06-25	\N	0.00	Stark, James E Stark, Kelly
2168	CV-2011-0000610	2014-02-03	\N	0.00	Bell, Nicole Bell, Travis
2169	CV-2011-0000324	2012-08-22	\N	0.00	Bradley, Cody J Bradely, Krista
2170	Cv-2010-0000304	2010-09-14	\N	0.00	Andra, Katie Andra, Travis
2171	CV-2010-0000280	2012-06-11	\N	0.00	Callier, Josh Callier, Mistie
2172	CV-2010-0000013	2010-11-18	\N	0.00	Brockman, Casey J Brockman, Sharon
2173	CV-2009-0000921	2010-10-07	\N	0.00	Jane Doe, Luekenga, Antone
2174	CV-2009-0000828	2010-09-07	\N	0.00	Wheeless, Bellia Wheeless, Wesley A
238	CV-2014-0001722-OC	2015-04-28	or a warrant will be issued for hisM; s/ Carnaroli 4/28/2015	0.00	or a warrant will be issued for hisM; s/ Carnaroli 4/28/2015
239	CV-2014-0001722-OC	2015-08-20		300.00	Arrants Harley H III
240	CV-2014-0001722-OC	2017-04-04		500.00	Arrants Harley H III
2175	CV-2009-0000279	2011-06-08	\N	0.00	John Doe, Kelly, Adrianna R
2176	CV-2008-0000255	2011-04-14	\N	0.00	John Doe, Knetzger, Heather N
2177	CV-2008-0000024	2009-05-11	\N	0.00	Garcia, Anthony Garcia, carol A
2178	CV-2007-00000884	2008-07-18	\N	0.00	Price, David Price, Teri
2179	CV-2007-00000821	2009-09-03	\N	0.00	John Doe, Nelson, Brittany
2180	CV-2007-00000485	2009-04-14	\N	0.00	John Doe, Russon, Lisa
2181	CV-2007-00000295	2008-08-21	\N	0.00	Jane Doe, Keele, Trent R
2182	CV-2007-00000260	2008-01-25	\N	0.00	John Doe, Pence, Amy N
2183	CV-2005-00000658	2008-01-10	\N	0.00	John Doe, Zufelt, Stephanie, D
2184	CV-2014-0000110	2014-09-02	\N	0.00	Olmos, Claudia Olmos, Jose
2185	CV-2014-0000095	2014-10-28	\N	0.00	Abrams, Kristy L Doe, John
2186	CV-2013-0000250	2013-11-04	\N	500.00	Oliver, Derek Oliver, Penny Jeanne
2187	CV-2013-0000067	2015-01-22	\N	0.00	Hansen, Ann Hansen, Roger
2188	CV-2014-0000084	2015-05-28	\N	0.00	John Doe, Valdez, Krista D
253	CV-2014-0001248-OC	2015-11-06		500.00	Olsen Christopher M
258	CV-2014-0001129-OC	2015-04-28		0.00	Order defendant to appear at on or before 8/10/2015 at the plaintiff office for examaintion or a warrant will be issued: s/ Carnaroli 4/28/2015
259	CV-2014-0001129-OC	2015-08-20		300.00	Griffey Kathleen M
260	CV-2014-0001129-OC	2017-07-17	on 07/17/2017 10:00 AM:	0.00	Failure To Appear For Hearing Or Trial- pa shall send warrant
273	CV-2013-0004755-OC	2015-04-28		0.00	Order Carrie to appear for examination at the plainff's office on or before 10 August or a Warrant will be issued: s/ Carnaroli 4/28/2015
278	CV-2013-0004196-OC	2015-07-31		782.14	Edwards Jordan R.
283	CV-2013-0003798-OC	2015-06-09		0.00	Order William Eldridge is found in contempt of this court; defendant to appear on or before 7/20/2015 or a warrant will be issued: s/ Thomsen 6/09/2015
288	CV-2013-0001469-OC	2015-04-27		0.00	Order: Frank Dickman to appear on or before 8/10/2015 or a warrant will be issued for his arrested: s/ Carnaroli 4/20/2015
289	CV-2013-0001469-OC	2015-09-24		1489.42	Dickman Frank Loreen
298	CV-2012-0004252-OC	2013-07-22		500.00	Ellertson Steven C
303	CV-2012-0004021-OC	2013-07-31		500.00	Neubacher Beth
304	CV-2012-0004021-OC	2015-09-18		2589.27	Neubacher Beth
313	CV-2012-0003180-OC	2013-04-08		500.00	Bacon Anissa M
318	CV-2012-0002384-OC	2013-03-04	on 03/04/2013 02:00 PM:	0.00	Failure To Appear For Hearing Or Trial-att shall prepare request for warrant
323	CV-2012-0001209-OC	2013-02-11	on 02/11/2013 03:00 PM:	0.00	Failure To Appear For Hearing Or Trial- pa shall prepare warrant
328	CV-2012-0000747-OC	2013-01-04		500.00	Price Dennis H
333	CV-2012-0000408-OC	2012-09-12		500.00	Bybee Laurie J
338	CV-2011-0005533-OC	2012-10-11		500.00	Cameron Kathryn
339	CV-2011-0005533-OC	2013-05-14		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
348	CV-2011-0004911-OC	2012-06-22		500.00	Davis Renee N
349	CV-2011-0004911-OC	2015-07-24		1000.00	Davis Renee N
358	CV-2011-0003472-OC	2013-04-01	for Warrant of Attachament: pa Zollinger	0.00	for Warrant of Attachament: pa Zollinger
359	CV-2011-0003472-OC	2013-04-08		500.00	Starks Theresa Anne
368	CV-2011-0003465-OC	2013-01-14		500.00	Lewis Mellisa
373	CV-2011-0003323-OC	2012-01-23		500.00	Hazelbush Cory K
378	CV-2011-0002966-OC	2012-02-03		500.00	Saraceno Tony
383	CV-2011-0002871-OC	2012-06-08		500.00	Guthrie Kasey
384	CV-2011-0002871-OC	2012-07-17		0.00	Order of Release: release the Warrant of Attachmnent for Kasey Guthrie
393	CV-2011-0002819-OC	2012-06-06		500.00	Dueling Todd
398	CV-2011-0002374-OC	2017-02-10		500.00	Medrano Rosen
399	CV-2011-0002374-OC	2017-06-26		2500.00	Medrano Rosen
408	CV-2011-0002320-OC	2011-12-23		500.00	Belew Laurel
409	CV-2011-0002320-OC	2014-12-03		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
418	CV-2011-0001910-OC	2011-12-30		500.00	Ridley Darrin L
419	CV-2011-0001910-OC	2013-02-20		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
428	CV-2011-0000225-OC	2011-08-22		500.00	Anderson Cynthia
429	CV-2011-0000225-OC	2014-09-24		500.00	Bond Posted - Cash (Receipt 31131 Dated 9/24/2014 for 500.00) Warrant
438	CV-2010-0003812-OC	2011-07-08		500.00	Verderber Tessa Leigh
443	CV-2010-0003811-OC	2011-06-17		500.00	Johns Darin Michael
448	CV-2010-0003427-OC	2012-01-31		500.00	Downard Corrinna
453	CV-2010-0003133-OC	2012-03-20		500.00	Hoyt Michelle M
458	CV-2010-0001408-OC	2010-12-20		500.00	McMahen Trent A
459	CV-2010-0001408-OC	2011-02-23		500.00	Bond Posted - Surety (Amount 500.00 ): FTA WARRANT
460	CV-2010-0001408-OC	2011-12-23		500.00	McMahen Trent A
461	CV-2010-0001408-OC	2012-01-26		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
478	CV-2010-0000837-OC	2011-04-07		500.00	Thompson Edwin E
483	CV-2010-0000767-OC	2010-12-23		500.00	Howerton Tina M
488	CV-2010-0000482-OC	2011-01-11		500.00	Rogers Adam
489	CV-2010-0000482-OC	2011-02-22		500.00	Bond Posted - Surety (Amount 500.00 ): FTA WARRANT
498	CV-2009-0003428-OC	2010-10-27		500.00	Croft Kasi K.
503	CV-2009-0002517-OC	2010-01-29		500.00	Leading Mark
508	CV-2009-0002074-OC	2012-10-18		500.00	Mahan Nickcole D
513	CV-2009-0001076-OC	2010-10-27		500.00	Casper Andrew J
518	CV-2008-0004674-OC	2009-10-08		500.00	Reisner Darwin
523	CV-2008-0003859-OC	2012-09-06		0.00	Affidavit of BryanN Zollinger in Supporr of Warrant of Attachemtn: pa Zollinger
524	CV-2008-0003859-OC	2012-10-18		500.00	Rowberry Jeremy
533	CV-2008-0003809-OC	2010-08-02		500.00	Alonso Carrie J.
538	CV-2008-0003191-OC	2011-02-09		500.00	Stark Justin D
539	CV-2008-0003191-OC	2011-05-23		500.00	Bond Posted - Surety (Amount 500.00 ): FTA Warrant
548	CV-2008-0002942-OC	2009-02-18		7137.32	Heath Arthur Sr (no dfdt identifiers provided on warrant prepared by pltf atty)
558	CV-2008-0002939-OC	2009-07-07		300.00	Vaughan Shane J.; /s/ J Carnaroli 07-02-09
563	CV-2008-0002938-OC	2009-03-05		940.48	Palmer James; /s/ J Box 03-05-09
564	CV-2008-0002938-OC	2010-10-29		940.48	Bond Posted - Surety (Amount 940.48 ) FTA WARRANT
573	CV-2007-0004797-OC	2009-04-01		500.00	Valai Shirlene; /s/ J Thomsen 04-01-09
578	CV-2007-0004453-OC	2008-11-12	Failure To Appear For Hearing Or Trial - Defnt FTA'd; Atty to provide warrant	0.00	Failure To Appear For Hearing Or Trial - Defnt FTA'd; Atty to provide warrant
579	CV-2007-0004453-OC	2008-11-28		2047.76	Lane Martin P; warrant /s/ J Thomsen 11-21-08
580	CV-2007-0004453-OC	2010-04-28		500.00	Lane Martin P
593	CV-2007-0004301-OC	2010-08-31		500.00	Larsen Jared L
594	CV-2007-0004301-OC	2012-01-26		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
603	CV-2007-0004039-OC	2008-07-15		0.00	Affidavit of Bryan D Smith in Support of Warrant of Attachemtn; PA Smith
608	CV-2007-0002171-OC	2008-06-17		1991.96	McDonald Rosemarrie; /s/ J Box 05-27-08
610	CV-2007-0002171-OC	2010-04-13		500.00	McDonald Rosemarrie
623	CV-2006-0004975-OC	2008-08-07		804.20	Govan Herman Jr; /s/ J Carnaroli 07-25-08
624	CV-2006-0004975-OC	2012-03-29		500.00	Govan Maria
633	CV-2006-0002383-OC	2007-02-05	Bond amount: 617.06	617.06	Failed to Appear Defendant: Elder Donald E - sent to Bannock County to send to Bingham County (as per CH)
634	CV-2006-0002383-OC	2007-05-18		617.06	Elder Donald E
643	CV-2006-0002382-OC	2007-02-06	for Warrant of Attachement; PA Smith	0.00	for Warrant of Attachement; PA Smith
644	CV-2006-0002382-OC	2007-03-22	Bond amount: 1548.83	1548.83	Failed to Appear Debtor exam Defendant: Cluff Alan
658	CV-2015-0001081	2016-06-08		0.00	Conan Jamie Dean
659	CV-2015-0001037	2017-06-07		300.00	Roberts Ron
660	CV-2015-0000587	2016-02-18		500.00	Buck Weston
661	CV-2014-0001875	2016-11-09		300.00	Smith Melonie D
662	CV-2014-0001828	2015-09-09		3742.35	Leonardson Traci L
663	CV-2013-0001820	2017-06-07		300.00	Elison Desiree Sarah
664	CV-2012-0002228	2016-06-08		0.00	Kohler Kaydon
665	CV-2012-0002228	2016-06-10	By Bingham County Sheriff\\r\\nServed To Kaydon Kohler Fail To Appear	0.00	By Bingham County Sheriff\\r\\nServed To Kaydon Kohler Fail To Appear
666	CV-2015-0000672	2016-06-01		500.00	Jones Kimberly B
667	CV-2012-0000599	2014-04-23		0.00	Medical Recovery Services LLC
668	CV-2016-0000297	2017-05-22		500.00	Rothman Jeffrey Michael
669	CV-2016-0000175	2017-05-23		500.00	Renick Lisa
670	CV-2015-0000424	2016-08-29		3200.27	Romo Joseph Michael
671	CV-2015-0000424	2016-08-30	(Arraignment	0.00	on a warrant
672	CV-2015-0000424	2016-08-30	on 08/30/2016 11:00 AM:	0.00	on a warrant
673	CV-2014-0000600	2015-12-07		500.00	Mcdonald Fred T
674	CV-2014-0000636	2015-08-03		0.00	Warrant Issued - Warrant of Attatchment for Luis Varela
676	CV-2014-0000636	2015-09-28		0.00	Application for Another Warrant of Attatchment
678	CV-2014-0000636	2015-10-02		500.00	Varela Luis
680	CV-2014-0000276	2014-11-13		500.00	Mangan Martin A
681	CV-2014-0000276	2014-12-23		0.00	Warrant of Body Attatchment Issued for MArtin MAngan
683	CV-2014-0000059	2015-10-23		0.00	Warrant of Attatchment Issued for Charie Sorensen
685	CV-2014-0000059	2016-04-20		500.00	Sorensen Cherie
686	CV-2013-0000705	2014-06-20		500.00	Hernandez Leticia
687	CV-2013-0000653	2014-02-21		500.00	Barrientos Francesca
689	CV-2013-0000615	2014-02-18		500.00	Graham Brittney
691	CV-2013-0000272	2013-11-19		500.00	Schell John
692	CV-2013-0000239	2014-03-20		500.00	Parker Kristine B
693	CV-2013-0000233	2015-04-14		500.00	Linares Brittany Jo
694	CV-2013-0000123	2013-09-13		500.00	Stibal Tyrel L
695	CV-2012-0001026	2014-12-24		500.00	Robbins Jeff J
696	CV-2012-0000967	2017-01-13		500.00	Dortch Jimmy T
697	CV-2012-0000879	2013-07-19		500.00	Lopez Joe
698	CV-2012-0000875	2014-11-13		500.00	Smith Rachel
699	CV-2012-0000713	2014-03-20		500.00	Fillmore Michelle Rae
700	CV-2012-0000664	2014-07-22		500.00	Covington Jory T
701	CV-2012-0000619	2013-06-18		500.00	Christensen Josh
702	CV-2012-0000603	2015-10-23		0.00	Warrant of Attatachment Issued for Skipper T Morton
704	CV-2012-0000166	2013-05-01		0.00	Warrant Issued - Bench
705	CV-2012-0000166	2014-05-12		0.00	Warrant Recalled - Bonneville County
706	CV-2010-0001301	2013-09-30		500.00	Morton Megan
707	CV-2010-0001301	2013-10-21		0.00	Warrant Recalled by Bryan Zollinger
708	CV-2010-0001277	2012-02-24		500.00	Davis Alan
709	CV-2010-0000845	2012-01-31		500.00	Wilde Shelly
710	CV-2010-0000703	2011-01-14		500.00	Defendant: Lance Barber
711	CV-2010-0000613	2011-01-10		500.00	Williams Curtis Martin
712	CV-2010-0000613	2011-02-14		500.00	Williams Curtis Martin
713	CV-2010-0000238	2010-09-15		0.00	Coles Holly M
714	CV-2009-0001047	2011-06-30		500.00	Oler Deena Lynn
715	CV-2009-0000234	2011-01-14		500.00	Defendant: Brent Layton
716	CV-2009-0000151	2010-11-10		500.00	Stowers Rebecca
717	CV-2008-0001058	2014-04-30		500.00	Sakan Karla R
718	CV-2008-0001024	2009-05-20		819.45	Thompson Sheri
719	CV-2008-0001024	2009-06-03		819.45	Medical Recovery Services Inc
721	CV-2008-0000963	2009-07-23		319.48	Medical Recovery Services Inc
723	CV-2008-0000892	2010-05-05		500.00	Baler Nikki
724	CV-2008-0000836	2009-04-16		817.97	Wakley Charity
725	CV-2008-0000831	2009-04-16		3152.25	Acor Kevin T
726	CV-2008-0000738	2010-05-05		500.00	Roberts Corry
727	CV-2008-0000738	2010-06-09		0.00	Warrant on Corry Roberts Recalled
728	CV-2008-0000367	2011-05-10		500.00	Wellard Matthew J
729	CV-2007-0000293	2010-03-24		500.00	Rogers Gale Wayne
730	CV-2007-0000152	2008-02-28		701.98	Baker Jennie
732	CV-2007-0000026	2007-11-06		0.00	Owens Steven
733	CV-2006-0000984	2008-11-26		6192.20	Morgan Jennifer Lou
734	CV-2006-0000963	2008-02-29		717.32	Landon Jared Daniel
735	CV-2014-0000110	2014-11-07		500.00	Olmos Claudia
736	CV-2013-0000450	2014-08-28		500.00	Moreno Olivia
737	CV-2012-0000550	2013-05-20		500.00	Smith Robert S
738	CV-2016-0000027	2016-12-28		300.00	McDaniel Richard Lynn
739	CV-2014-0000215	2015-11-20		500.00	Medical Recovery Services LLC
740	CV-2014-0000084	2015-01-07		2039.12	Valdez Krista D
741	CV-2016-0003472-OC	2017-04-25		300.00	Chester Dawna Lynn
746	CV-2016-0002920-OC	2017-03-17		300.00	Thomas Tammy
751	CV-2016-0002301-OC	2017-05-22		300.00	Maxey Patrick Armon
756	CV-2016-0001141-OC	2016-11-22		500.00	Barraza Monica
761	CV-2015-0005659-OC	2016-05-20		300.00	Rasmussen Tyler Michael
762	CV-2015-0005659-OC	2016-07-25		300.00	Rasmussen Tyler Michael
763	CV-2015-0005659-OC	2016-10-06	(Hearing	0.00	Warrant of Attatchment
764	CV-2015-0005659-OC	2016-10-07	on 10/07/2016 01:00 PM:	0.00	Warrant of Attatchment
781	CV-2015-0005293-OC	2016-10-18		300.00	Ephrem Kent
782	CV-2015-0005293-OC	2017-02-02	Warrant	0.00	Warrant
791	CV-2015-0005294-OC	2017-07-24		300.00	Perez Fabiola
796	CV-2015-0004793-OC	2017-07-24		300.00	Radford Sharon
801	CV-2015-0004619-OC	2016-05-20		300.00	Rollene Jason Lee
806	CV-2015-0004463-OC	2016-05-05		300.00	Allison Julie K
811	CV-2015-0004201-OC	2016-05-02		300.00	Widerburg Ryan Lane
816	CV-2015-0003472-OC	2016-05-20		300.00	Stoneburner Joshua
821	CV-2015-0003256-OC	2016-03-17		300.00	Potter Angela Dawn
826	CV-2015-0002573-OC	2015-12-18		300.00	Terry John W
831	CV-2015-0002498-OC	2016-03-17		300.00	Curzon Blaine
836	CV-2015-0002314-OC	2016-04-29		300.00	Malott Demi R
841	CV-2015-0002119-OC	2016-08-22		300.00	Rentelman Tabitha Ineez
846	CV-2015-0002091-OC	2016-05-05		300.00	Sanchez Letesha Marie
847	CV-2015-0002091-OC	2016-12-13		0.00	***NOT FOUND WARRANT****
856	CV-2015-0002063-OC	2015-12-01		300.00	(Original Warrant to Sheriff's Office)
861	CV-2015-0001925-OC	2017-06-16		300.00	Ramirez Gabriel
866	CV-2015-0001808-OC	2017-05-22		300.00	Gonzalez Luis M
871	CV-2015-0001642-OC	2016-03-17		300.00	Beckstead Dustin
872	CV-2015-0001642-OC	2017-08-04		300.00	Beckstead Dustin
881	CV-2015-0001597-OC	2016-11-22		500.00	Bird Bryan
886	CV-2015-0000614-OC	2015-11-03		500.00	Higgins Kevin
887	CV-2015-0000614-OC	2016-12-19		300.00	Higgins Kevin
888	CV-2015-0000614-OC	2017-02-02	Warrant	0.00	Warrant
901	CV-2014-0006857-OC	2017-07-27		300.00	Rydalch Bonnie
906	CV-2014-0006856-OC	2016-06-01		300.00	Albertson Danial Burton
907	CV-2014-0006856-OC	2017-03-21		300.00	Albertson Sara
908	CV-2014-0006856-OC	2017-04-20		300.00	Albertson Sara - ORIGINAL WARRANT SENT TO BRYAN ZOLLINGER'S OFFICE
921	CV-2014-0006816-OC	2015-12-18		300.00	Andra Travis
926	CV-2014-0006179-OC	2017-03-20		300.00	Peterson Saleena
931	CV-2014-0006085-OC	2016-03-21		300.00	Merrill Kelli
936	CV-2014-0005765-OC	2016-04-29		300.00	Chapin Benjamin
941	CV-2014-0005451-OC	2015-12-18		300.00	Salinas Jesus
942	CV-2014-0005451-OC	2016-02-09		300.00	Salinas Jesus
951	CV-2014-0005372-OC	2015-10-05		4518.70	Deblase Jamen Cory
956	CV-2014-0004592-OC	2015-12-03		300.00	Benson Lisa Dawn
961	CV-2014-0002614-OC	2015-11-17		500.00	Bunch Andrew
966	CV-2014-0001515-OC	2015-11-03		500.00	Kirchner Standley
971	CV-2014-0001359-OC	2015-12-03		300.00	Nunez Jacqueline Angelica
976	CV-2014-0000613-OC	2015-12-18		300.00	Matthews Jami L
981	CV-2013-0006681-OC	2016-03-17		300.00	Rodriguez Krystal
986	CV-2013-0006369-OC	2015-11-25		300.00	Fowers Richard D
991	CV-2013-0006155-OC	2015-12-03		300.00	Gasser Tobe
992	CV-2013-0006155-OC	2016-04-11		500.00	Gasser Tobe
993	CV-2013-0006155-OC	2016-08-31		300.00	Gasser Tobe
1006	CV-2013-0006041-OC	2015-12-03		300.00	Hunsaker Tami
1011	CV-2013-0005994-OC	2015-10-09		903.71	Whipple Duane Jr.
1012	CV-2013-0005994-OC	2015-11-03		910.28	Whipple Duane Jr.
1013	CV-2013-0005994-OC	2015-11-25		903.71	Whipple Duane Jr.
1026	CV-2013-0005959-OC	2017-06-12	Fail to Obey Court Order and appear for Debtor Hearing	300.00	Wood Raymond
1031	CV-2013-0005277-OC	2016-03-17		300.00	Francis Stephanie E
1036	CV-2013-0004578-OC	2015-12-18		300.00	Brink Jeffrey
1041	CV-2013-0003303-OC	2017-04-19		300.00	Olson Dalena D.
1046	CV-2013-0003192-OC	2015-09-22		500.00	Swanson Monica
1047	CV-2013-0003192-OC	2015-11-18	(Hearing	0.00	Re Request for Warrant
1048	CV-2013-0003192-OC	2015-12-15	on 12/15/2015 01:30 PM:	0.00	Re Request for Warrant
1061	CV-2013-0002901-OC	2015-12-18		300.00	Trueblood Krystal F
1066	CV-2013-0001690-OC	2015-03-09		500.00	Harrington William B
1071	CV-2013-0000950-OC	2016-02-18		300.00	Hernandez Angel
1076	CV-2012-0006005-OC	2015-01-20		0.00	Johnson Linda M
1081	CV-2012-0005409-OC	2015-02-05		0.00	Waid Brittney Lynn
1086	CV-2012-0003329-OC	2017-02-21		300.00	Hansen Justin
1087	CV-2012-0003329-OC	2017-05-22		300.00	Hansen Justin
1088	CV-2012-0003329-OC	2017-05-26		0.00	Recalled Return of Service - Warrant
1101	CV-2012-0002242-OC	2016-01-05		300.00	Goodson Rebecca
1106	CV-2011-0006751-OC	2015-08-26		1348.07	Crane Brooke K.
1107	CV-2011-0006751-OC	2015-10-05		1348.07	Crane Brooke K.
1116	CV-2011-0006548-OC	2017-06-16		300.00	Trejo Todd
1121	CV-2011-0005102-OC	2017-07-24		300.00	Briggs Trisha
1126	CV-2011-0001941-OC	2015-11-30		300.00	Veldkamp Keith
1131	CV-2011-0000984-OC	2011-10-27		500.00	Shigley Mark
1136	CV-2011-0000709-OC	2011-07-06		500.00	Medical Recovery Services LLC
1146	CV-2010-0007011-OC	2011-05-19		500.00	McCracken Charles
1151	CV-2010-0006839-OC	2016-05-02		300.00	Sanchez Maria
1156	CV-2010-0006109-OC	2011-03-21		500.00	Bierma Jackielyn
1161	CV-2010-0006105-OC	2015-02-05		0.00	Ockerman Mark K
1166	CV-2010-0005619-OC	2011-03-24		500.00	Resendiz Shawn
1171	CV-2010-0005615-OC	2011-07-07		500.00	Messick Dustin
1176	CV-2010-0004722-OC	2011-01-19		500.00	Medical Recovery Services LLC
1186	CV-2010-0004449-OC	2011-05-17		500.00	Demma Shelly
1191	CV-2010-0004265-OC	2011-03-24		500.00	De La Vega Eusebio
1196	CV-2010-0004245-OC	2011-02-08		500.00	Tortel Myles B.
1201	CV-2010-0004046-OC	2011-03-17		500.00	Nielson Zachary Storer
1206	CV-2010-0003975-OC	2011-02-07		500.00	Butchart Karen M
1211	CV-2010-0003523-OC	2011-03-08		500.00	Reed Landen
1216	CV-2010-0002524-OC	2010-10-18		500.00	Worden Elizabeth
1221	CV-2010-0002172-OC	2015-10-05		0.00	Charlesworth Glen W
1222	CV-2010-0002172-OC	2015-11-05		7088.13	Charlesworth Glen W
1231	CV-2010-0001926-OC	2011-05-19		500.00	Cutler Pat
1236	CV-2010-0001787-OC	2011-01-26		500.00	Dashnaw David Sr.
1241	CV-2010-0001779-OC	2011-05-27		500.00	Clarke Nathan W.
1246	CV-2010-0001313-OC	2012-01-03		500.00	Jerry Bergeman & Sons
1251	CV-2010-0000686-OC	2010-06-28		500.00	Hill Amanda
1256	CV-2010-0000484-OC	2011-03-11		0.00	Larsen Linda
1261	CV-2010-0000174-OC	2011-04-11		500.00	Ramirez Michael Joseph
1266	CV-2009-0007582-OC	2011-07-19		500.00	Taylor Tosha
1271	CV-2009-0007469-OC	2010-12-20		500.00	Barrett Brent
1276	CV-2009-0007043-OC	2011-11-29		356.57	Dixon Jeanie
1281	CV-2009-0006463-OC	2010-07-07		500.00	Christensen Camile E.
1282	CV-2009-0006463-OC	2010-12-14		500.00	Christensen Camile E.
1291	CV-2009-0006183-OC	2010-02-19		500.00	Walker Lonnie
1296	CV-2009-0005631-OC	2010-08-05		500.00	Brown BurlaJean Baggs
1301	CV-2009-0005611-OC	2010-11-16		500.00	Metcalf Matthew C
1306	CV-2009-0004929-OC	2010-07-21		500.00	Cartier Todd
1311	CV-2009-0004728-OC	2010-06-23		500.00	Nieves Melissa A
1312	CV-2009-0004728-OC	2017-04-17		0.00	Warrant Recall
1321	CV-2009-0003646-OC	2010-01-15		500.00	Brown Lisa M.
1326	CV-2009-0003222-OC	2009-12-18		500.00	Hosac Gregg Leslie Jr.
1327	CV-2009-0003222-OC	2010-02-02		0.00	Return Of Service - warrant recalled
1328	CV-2009-0003222-OC	2010-09-23		500.00	Hosac Gregg Leslie Jr.
1341	CV-2009-0003178-OC	2009-12-28		500.00	Westfall Kimberly
1346	CV-2009-0003058-OC	2010-01-15		500.00	Coffman Stella Dawn
1351	CV-2009-0002894-OC	2011-03-21		500.00	Karford Cyndi M
1356	CV-2009-0002852-OC	2012-09-10		500.00	Thurnwald Amber N.
1361	CV-2009-0002536-OC	2010-02-25		0.00	Return Of Service - Recalled Warrant - Defendant in Jail - Plaintiff met with her at jail and recalled warrant
1366	CV-2009-0002444-OC	2009-12-14		500.00	Welch Heather Lynn
1371	CV-2009-0002300-OC	2009-09-08		500.00	Whitfield Michelle M.
1376	CV-2009-0002169-OC	2016-05-24		300.00	Eckley Tiffany Rose
1381	CV-2009-0001839-OC	2010-11-09		500.00	Smith Barbara
1386	CV-2009-0001491-OC	2009-07-28		500.00	Fitch Jason
1391	CV-2009-0000887-OC	2009-06-23		500.00	Bird Russell L
1396	CV-2009-0000647-OC	2010-12-03		500.00	Watts Kristle Jo
1397	CV-2009-0000647-OC	2011-01-21		0.00	Warrant recalled due to def. being in jail at time of hearing.
1406	CV-2009-0000517-OC	2009-09-25		500.00	Waggoner Alyssa
1411	CV-2008-0007865-OC	2009-05-21		0.00	Return Of Service - Recalled Warrant
1416	CV-2008-0007859-OC	2009-06-12		100.00	Johnson Myrrian
1421	CV-2008-0007592-OC	2009-10-19		500.00	Pierson Ryan
1426	CV-2008-0007520-OC	2009-12-18		500.00	Medical Recovery Services LLC
1428	CV-2008-0007520-OC	2010-10-20		500.00	Smith Tracie
1441	CV-2008-0006996-OC	2009-07-13		500.00	Vazquez Deborah L
1446	CV-2008-0006676-OC	2010-01-29		500.00	Lewis Jeremiah
1451	CV-2008-0006482-OC	2009-05-19		500.00	Sorenson Tony
1456	CV-2008-0006277-OC	2009-08-19		500.00	Barrow Natalie
1461	CV-2008-0006232-OC	2009-04-01		1949.48	Johnson Aimee Nicole
1462	CV-2008-0006232-OC	2009-04-17		0.00	Return Of Service - warrant - 4/13/09
1471	CV-2008-0006174-OC	2010-01-26		611.66	Harrison Serena
1476	CV-2008-0005948-OC	2010-02-26		500.00	Medical Recovery Services LLC
1486	CV-2008-0005653-OC	2011-03-02		0.00	Records indicated they (Sheriff of Bannock County) do not have original warrant
1491	CV-2008-0005523-OC	2010-01-04		500.00	Bartholomaw Jenny
1492	CV-2008-0005523-OC	2010-09-27	Fail to Appear for Supplemental Hearing 9/10/10 @ 9:00 a.m.	500.00	Bartholomae Jenny
1501	CV-2008-0004523-OC	2010-01-04		500.00	Rardin Steven Burton
1506	CV-2008-0004521-OC	2010-08-13		500.00	Weaver Shannon
1511	CV-2008-0004394-OC	2009-05-12		3104.73	Rhodes Tom
1516	CV-2008-0004389-OC	2009-07-13		500.00	Reid Allen
1521	CV-2008-0004215-OC	2010-04-22		500.00	Yorgensen Julie D.
1526	CV-2008-0003743-OC	2009-05-18		500.00	Gilbert Gwen L
1531	CV-2008-0002906-OC	2010-07-01		500.00	Baker James
1536	CV-2008-0002357-OC	2010-11-16		500.00	Olson Mike J
1541	CV-2008-0002143-OC	2010-02-26		500.00	White Christine N
1546	CV-2008-0001727-OC	2009-08-31		500.00	Lovelace Ashlee Marie
1551	CV-2008-0001723-OC	2009-05-05		1870.30	Hanes Celeste
1556	CV-2007-0006682-OC	2009-07-14		0.00	Curtis Michael David
1561	CV-2007-0006052-OC	2009-12-31		500.00	Moldenhauer Benjamin D.
1566	CV-2007-0005905-OC	2008-05-08		0.00	***Defendant brought in on warrant - attorney Brian Smith talked to him informally****
1571	CV-2007-0005768-OC	2011-11-08		500.00	Bell Bradley
1576	CV-2007-0004368-OC	2010-03-19		500.00	Pace Larry L
1581	CV-2007-0003867-OC	2009-11-04		500.00	Hawkinson Jason
1586	CV-2007-0003726-OC	2011-11-29		390.11	Blair Robert
1591	CV-2007-0003236-OC	2011-02-18		500.00	Robinson Joseph F.
1596	CV-2007-0002366-OC	2010-12-03		500.00	Wolfe Sadie
1601	CV-2007-0001933-OC	2010-02-16		500.00	Kelso Curtis
1606	CV-2007-0001465-OC	2009-07-28		500.00	Herrera Larry G.
1611	CV-2006-0007333-OC	2009-07-28		500.00	James Tiffany Rose
1616	CV-2006-0004188-OC	2007-02-05	Bond amount: 425.41	425.41	Fail to Appear for Hearing - Debtors Examine Defendant: Carpenter Ted Leroy
1621	CV-2006-0003791-OC	2009-07-28		500.00	Colby Gennie M.
1626	CV-2006-0003348-OC	2007-01-17	Bond amount: 1283.98	1283.98	debtors examin on 10/26/06 Defendant: Mills Brian and Carrie
1631	CV-2006-0003346-OC	2010-02-08		500.00	Jerry Bergman
1636	CV-2006-0003126-OC	2010-11-09		500.00	Christenot Tim
1641	CV-2006-0001961-OC	2007-06-14		1243.67	Colvin Joshua
1646	CV-2006-0000288-OC	2007-06-25		62.72	Loftus Brandy
1651	CV-2005-0002069-OC	2010-11-08		500.00	Cortez Pamela Iris
1656	CV-2004-0004754-OC	2009-07-07		500.00	Thompson Mike L
1661	CV-2004-0002678-OC	2004-11-15		0.00	Application for Civil Arrest Warrant
\.


--
-- Name: warrants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mehrotra
--

SELECT pg_catalog.setval('warrants_id_seq', 2188, true);


--
-- Data for Name: warrants_returned; Type: TABLE DATA; Schema: public; Owner: Mehrotra
--

COPY warrants_returned (id, case_number, defendant, returned, reason) FROM stdin;
38	CV-2016-0000601-OC	Original warrant returned.	2017-01-04	Failed to Appear
43	CV-2015-0003701-OC	Powell Julie Ann. served upon dfdt on 10-14-16 by BCSO. original warrant returned to file	2016-10-14	Failed to Appear
44	CV-2015-0003701-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO AMANDA	2016-11-10	
53	CV-2015-0003107-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQUESTED BY; ROSIE.	2017-06-01	
58	CV-2015-0002546-OC	Wilson Craig Allen: ORIGINAL WARRANT RETURNED REQUESTED BY; Amanda	2016-05-04	Failed to Appear
63	CV-2015-0001070-OC	Lacy Joseph T; ORIGINAL WARRANT RETURNED SERVED BY PPD 9-23-16; TO AMANDA	2016-09-26	Failed to Appear
68	CV-2015-0000987-OC	Wiebelhaus Sky E; ORIGINAL WARRANT RETURNED SERVED BY; ISP on 2-29-16. To: Nicole	2016-03-01	Violation of Court Order
73	CV-2015-0000412-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO CARNAROLI- DEBTORS EXAM CONDUCTED VIA TELEPHONE	2017-05-01	
78	CV-2014-0004864-OC	Myler Joshua David	2016-01-25	Failed to Appear
83	CV-2014-0004515-OC	Morrison Mistie; ORIGINAL WARRANT RETURNED SERVED BY BCSO 2-22-16; TO AMANDA	2016-02-23	Failed to Appear
88	CV-2014-0001722-OC	Arrants Harley H III: ORIGINAL WARRANT RETURNED SERVED BY; BCSO on 3-10-16. To: Nichole	2016-03-10	Failed to Appear
93	CV-2014-0001248-OC	Olsen Christopher M: ORIGINAL WARRANT RETURNED REQUESTED BY; BRYAN N. ZOLLINGER ATTORNEY FOR PLNTFS.	2016-01-20	Failed to Appear
98	CV-2014-0001129-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQESTED BY; Nichole	2016-08-10	
103	CV-2013-0004196-OC	Warrant Returned; ORIGNAL WARRANT RETURNED BY REQUEST; TO PAULA	2015-11-06	
108	CV-2013-0001469-OC	Dickman Frank Loreen; ORIGINAL WARRANT RETURNED SERVED BY BCSO 1-24-16; TO NICHOLE	2016-01-25	Failed to Appear
113	CV-2012-0004021-OC	Neubacher Beth; ORIGINAL WARRANT RETURNED BY REQUEST; TO PAULA	2014-09-25	Failed to Appear
118	CV-2012-0003180-OC	Bacon Anissa M: ORIGINAL WARRANT RETURNED SERVED BY; PPD ON 5-18-15. TO; Amanda	2015-05-19	Failed to Appear
123	CV-2012-0000747-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQUESTED by: Chantelle	2015-10-20	
128	CV-2012-0000408-OC	Bybee Laurie J; ORIGINAL WARRANT RETURNED BY REQUEST; TO AMANDA	2014-05-01	Failed to Appear
133	CV-2011-0005533-OC	Served by PPD on 5/9/13	2013-05-09	Failed to Appear
138	CV-2011-0004911-OC	Davis Renee N; ORIGINAL WARRANT RETURNED SERVED BY PPD 11-19-12; TO ROSIE	2012-11-20	Failed to Appear
139	CV-2011-0004911-OC	Warrant Returned; Original warrant returned requested by; Rosie	2016-11-22	
148	CV-2011-0003472-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO ROSIE	2013-05-06	
153	CV-2011-0003323-OC	Warrant Returned; ORIGINAL WARRNAT RETURNED BY REQUEST; TO NICHOLE	2013-08-13	
158	CV-2011-0002966-OC	Warrant Returned; ORIGINALWARRANT RETURNED BY REQUEST; TO CRT REC	2012-09-21	
163	CV-2011-0002871-OC	Guthrie Kasey- spokw with deputy Holt; original warrant shall be returned- original warrant returned 7-3-12.	2012-07-02	Failed to Appear
168	CV-2011-0002819-OC	Dueling Todd; ORIGINAL WARRANT RETURNED SERVED BY ISP 9-25-12; TO AMANDA	2012-09-26	Failed to Appear
173	CV-2011-0002374-OC	on 6-10-17. To: Amanda	2017-06-12	Failed to Appear
178	CV-2011-0002320-OC	Belew Laurel	2014-12-02	Failed to Appear
183	CV-2011-0001910-OC	Ridley Darrin L- original warrant returned served 2-17-13.	2013-02-19	Failed to Appear
188	CV-2011-0000225-OC	Warrant Returned- original warrant returned served in Bingham County	2014-09-11	
193	CV-2010-0003812-OC	Original warrant in file	2012-07-26	Failed to Appear
198	CV-2010-0003811-OC	Johns Darin Michael; original warrant returned served by BCSO 10-6-11; to nichole	2011-10-07	Failed to Appear
203	CV-2010-0003427-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO NICHOLE	2012-10-24	
208	CV-2010-0003133-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO NICHOLE	2012-05-02	
213	CV-2010-0001408-OC	McMahen Trent A; ORIGINAL WARRANT RETURNED SERVED BY PPD 2-22-11; TO NICHOLE	2011-02-23	Failed to Appear
214	CV-2010-0001408-OC	McMahen Trent A; ORIGINAL WARRANT RETURNED SERVED BY PPD 1-25-12; TO NICHOLE	2012-01-26	Failed to Appear
223	CV-2010-0000837-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST ; TO AMANDA	2014-03-06	
228	CV-2010-0000767-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO PAULA	2011-02-14	
233	CV-2010-0000482-OC	Rogers Adam; served by CHPD by 02-20-11 original warrant returned to court	2011-02-22	Failed to Appear
238	CV-2009-0003428-OC	Warrant Returned; ORIGINAL WARRNAT RETURNED BY REQUEST; TO ROSIE	2011-01-05	
355	CV-2013-0000615	Graham Brittney	2014-03-14	Failure to Appear-Contempt
243	CV-2009-0002517-OC	Leading Mark	2010-02-16	Failed to Appear
248	CV-2009-0002074-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQUESTE BY; ROSIE	2016-08-15	
253	CV-2008-0004674-OC	CH	2009-10-28	Failed to Appear
258	CV-2008-0003859-OC	Rowberry Jeremy- original warrant returned served 11-21-12.	2012-11-23	Failed to Appear
263	CV-2008-0003809-OC	Alonso Carrie J.; ORIGINAL WARRANT RETURNED SERVED BY CPD 8-6-10; TO NICHOLE	2010-08-09	Failed to Appear
268	CV-2008-0003191-OC	Stark Justin D- original warrant returned served 5-20-11.	2011-05-23	Failed to Appear
273	CV-2008-0002942-OC	Heath Arthur Sr; ORIGINAL WARRANT RETURNED SERVED BY BCSO 4-12-09; TO NICHOLE	2009-04-13	Failed to Appear to Exam of Debtor hearing
274	CV-2008-0002942-OC	Heath Peggy; ORIGINAL WARRANT RETURNED SERVED BY BCSO 4-12-09; TO NICHOLE	2009-04-13	Failed to Appear to Exam of Debtor hearing
283	CV-2008-0002939-OC	Warrant Returned; original civil warrant returned to court	2009-07-17	
288	CV-2008-0002938-OC	Palmer James- original warrant returned served 10-28-10.	2010-10-29	Failed to Appear for Order to Show Cause 02-09-09
293	CV-2007-0004453-OC	Lane Martin P; served by PPD original warrant returned to court	2009-05-18	Failed to Appear at Debtor's Exam
294	CV-2007-0004453-OC	Lane Martin P. SV'd 9/21/10. Faxed copy of warrant in file for arraignment purposes	2010-09-21	Failed to Appear
1267	CV-2006-0000022	Chandler Steven & Marsha	2011-02-07	\N
1268	CV-2013-0000180	King, Angie King, Kollin C	2013-10-21	\N
1269	CV-2012-0000723	Clark, Christopher Clark, Stephanie	2013-05-13	\N
1270	CV-2013-0001039	Andrew, Mike Jane Doe	2014-09-16	\N
1271	CV-2012-0000875	Smith, Rachel Smith, Shane Eldon	2014-12-10	\N
303	CV-2007-0004301-OC	Warrant Returned; ORIGINAL WARRATN RETURNED SERVED BY CPD 1-25-12; TO NICHOLE	2012-01-26	
1272	CV-2012-0000713	Fillmore, Craig Lynn	2014-04-09	\N
1273	CV-2010-0001277	Davis, J Alan Davis, Jennifer	2012-06-29	\N
1274	CV-2010-0001065	James, Jodi Dee	2011-09-23	\N
1275	CV-2010-0000845	Wilde, John Doe Wilde, Shelly	2012-02-28	\N
308	CV-2007-0002171-OC	Warrant Returned; original warrant of attachment returned to court (Rosemarie McDonald)	2009-06-23	
309	CV-2007-0002171-OC	Warrant Returned; original warrant of attachment returned to court (Michael McDonald)	2009-06-23	
310	CV-2007-0002171-OC	Urquhart Rosemarrie Jean: ORIGINAL WARRANT RETURNED SERVED BY; PPD on 5-31-17. To: Paula	2017-06-01	Failed to Appear for Examination of Judgment/Debtor Hearing on February 22 2010 at 2:30 pm
1276	CV-2010-0000522	Williams, Wendy Williams, Wes E	2012-01-09	\N
1277	CV-2009-0000151	Doe, John Stowers, Rebecca Ann	2011-01-13	\N
1278	CV-2008-0001058	Doe, John Sakan, Karla R	2015-12-12	\N
1279	CV-2008-0000892	Baler, John Doe Baler, Nikki	2010-05-19	\N
1280	CV-2008-0000836	Wakley, Charity Ann Waley, John Doe	2009-06-19	\N
1281	CV-2008-0000831	Acor, Kevin T Acor, Tiffany	2008-12-03	\N
1282	CV-2008-0000367	Coffey, Tyanna Daylene Wellard, Matthew J	2011-07-21	\N
1283	CV-2007-0000381	Estrada, Jaime A Estrade, Maria D	2008-07-31	\N
1284	CV-2013-0000709	Jane Doe, Justesen, Roger	2014-10-29	\N
1285	CV-2013-0000577	Bryd, Douglas Byrd, Wendi	2014-06-12	\N
1286	CV-2013-0000576	Wilburn, Jason	2014-05-27	\N
1287	CV-2012-0000903	Jane Doe, Jones, Brenden	2013-09-03	\N
323	CV-2006-0004975-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO NICHOLE	2012-05-02	
1288	CV-2010-0000280	Callier, Josh Callier, Mistie	2013-01-28	\N
1289	CV-2010-0000013	Brockman, Casey J Brockman, Sharon	2010-01-25	\N
1290	CV-2009-0000828	Wheeless, Bellia Wheeless, Wesley A	2010-10-04	\N
1291	CV-2009-0000279	John Doe, Kelly, Adrianna R	2012-01-30	\N
328	CV-2006-0002383-OC	Elder Donald E - retured by BCSO - warrant expired	2007-05-17	Failed to Appear
329	CV-2006-0002383-OC	Elder Donald E	2009-04-21	Failed to Appear
1292	CV-2008-0000255	John Doe, Knetzger, Heather N	2011-05-10	\N
1293	CV-2008-0000024	Garcia, Anthony Garcia, carol A	2009-05-27	\N
1294	CV-2007-00000884	Price, David Price, Teri	2008-08-04	\N
1295	CV-2007-00000821	John Doe, Nelson, Brittany	2009-09-23	\N
1296	CV-2007-00000260	John Doe, Pence, Amy N	2008-04-02	\N
1297	CV-2013-0000067	Hansen, Ann Hansen, Roger	2015-02-09	\N
338	CV-2006-0002382-OC	Cluff Alan- original warrant returned 10-18-07.	2007-10-15	Failed to Appear Debtor exam
343	CV-2015-0001081	Conan Jamie Dean	2016-06-30	Failure to Appear
344	CV-2015-0000587	Buck Weston	2016-03-18	Failure to Appear - for Debtor's Exam
345	CV-2014-0001875	Smith Melonie D	2017-01-03	Failure to Appear - at Debtor's Exam
346	CV-2015-0000672	Jones Kimberly B	2016-06-12	Fail to Appear
347	CV-2016-0000297	Rothman Jeffrey Michael	2017-06-05	Failed to Appear
348	CV-2015-0000424	Romo Joseph Michael	2016-08-30	Failed to Appear for Examination of Judgment Debtor Hearing
350	CV-2014-0000636	Varela Luis	2015-11-05	Failure to Appear for Debtor's Exam on 04/17/2015 @ 1:30 PM and Motion for Contempt on 07/08/2015 @ 2:45 PM
351	CV-2014-0000276	Mangan Martin A	2015-01-20	Failure to Appear for Debtors Exam on 10/24/2014 @ 1:30 PM
352	CV-2014-0000059	Sorensen Cherie	2016-01-25	Failure to Appear for Debtors Examination of 08/14/2015 @ 1:30 PM
353	CV-2013-0000705	Hernandez Leticia	2014-07-29	Failure to Appear on May 2 2014 at 1:30pm for Order of Examination
354	CV-2013-0000653	Barrientos Francesca	2014-05-12	Failure to Appear-Contempt Nov 6 2013
356	CV-2013-0000272	Schell John	2014-05-02	Failure to Appear Complaint per I.C. 19-3901
357	CV-2013-0000239	Parker Kristine B	2014-04-08	Failure to Appear at the 12/20/2013 hearing at 9:30 AM
358	CV-2013-0000233	Linares Brittany Jo	2015-05-11	Failure to Appear on March 27 2015 for Debtor's Exam
360	CV-2012-0001026	Robbins Jeff J	2015-01-13	Failure to Appear for Debtors Exam on 10/24/2014 @ 1:30 PM
361	CV-2012-0000967	Warrant Returned No Service	2017-02-21	
362	CV-2012-0000967	Dortch Jimmy T	2017-02-21	Failure to Appear on October 26 2016 at 9:00 am for Examination of Judgment Debtor Hearing
363	CV-2012-0000879	Lopez Joe	2013-08-19	Failure to Appear-Contempt
364	CV-2012-0000875	Smith Rachel	2014-12-10	Failure to Appear on October 24 2014 at 1:30pm for Debtor's Exam
365	CV-2012-0000713	Fillmore Michelle Rae	2014-04-09	Failure to Appearfor a Hearing on 12/20/2013 @ 9:30
366	CV-2012-0000664	Covington Jory T	2014-07-31	Failure to Appear for Debtors Examine on 05/30/2014 @ 9:30 AM
367	CV-2012-0000603	Morton Skipper T	2015-11-16	Failure to Appear for Debtor Exam on 08/14/2015 @ 1:30 PM
368	CV-2010-0001277	Davis Alan	2012-06-25	Failure to Appear for Debtor's exam on November 18 2011 @ 9:00am in Bonneville County Courthouse
369	CV-2010-0000703	Barber Lance	2011-02-02	Failure to Appear for Debtor Exam on 1/7/2011 at 9:30am
370	CV-2010-0000613	Williams Curtis Martin	2011-02-03	Failure to Appear for Debters Exam on 12/17/2010 9:30am
371	CV-2010-0000613	Williams Curtis Martin	2011-04-21	Failure to Appear for Debtors Examination on 12/17/2010
372	CV-2010-0000238	Coles Holly M	2010-10-15	Failure to Appear for Debtors Exam on 08/27/2010 @ 9:30 AM
373	CV-2009-0001047	Oler Deena Lynn	2011-07-12	Failure to Appear for Debtors Examine on 06/03/2011 @ 9:30 AM
374	CV-2009-0000234	Layton Brent	2011-02-03	Failure to Appear for Debtors Exam on 1/7/11 at 9:30am
375	CV-2009-0000151	Stowers Rebecca	2011-01-05	Failure to Appear for Debtors Exam on 11/05/2010 @ 9:30 AM
376	CV-2008-0001058	Sakan Karla R	2015-02-12	Failure to Appear on March 21 2014 at 9:00am for Debtor's Exam
377	CV-2008-0001024	Thompson Sheri	2009-06-09	Failure to Appear at Debtors Exam on March 6. 2009 in Bonneville County
378	CV-2008-0000963	Graham Marcia	2009-08-03	Failure to Appeqr for Debtr's Exam on 07/10/09 at 9:30 am
379	CV-2008-0000836	Wakley Charity	2009-06-19	Failure to Appear at Debtor's Exam on 2/26/09
380	CV-2008-0000367	Wellard Matthew J	2011-07-21	Failure to Appear for Debtor Examination on April 29 2011 at 9:30
381	CV-2007-0000293	Rogers Gale Wayne	2010-04-28	Failure to Appear for Debtors Examine on 03/12/2010 @ 9:00 AM
382	CV-2007-0000026	Owens Steven	2008-02-04	Failure to Appear for Debotrs Exam on 10/31/2007 @ 9:00 AM
383	CV-2006-0000963	Landon Jared Daniel	2008-03-19	Failure to Appear for Debtors Exam on 02/25/2008 @ 2:00 PM
385	CV-2014-0000215	Medical Recovery Services LLC	2015-11-23	Failed to Appear at the time and place ordered by this court.
386	CV-2016-0003472-OC	Chester Dawna Lynn	2017-06-29	Fail to Obey Court Order
391	CV-2016-0002920-OC	Thomas Tammy	2017-05-30	Fail to Appear for Hearing
396	CV-2016-0002301-OC	Maxey Patrick Armon	2017-07-05	Fail to Apper For Debtor Examine
401	CV-2016-0001141-OC	Barraza Monica	2017-05-26	Fail to Appear for Hearing (supplemental hearing 8-5-16 @ 9:00 AM)
406	CV-2015-0005659-OC	Rasmussen Tyler Michael	2016-06-28	Fail to Appear for Debtor's Exam 3.18.16 @ 1:30 p.m.
407	CV-2015-0005659-OC	Rasmussen Tyler Michael	2016-09-29	Fail to Appear for Examination Of Judgment Debtor Hearing on March 18 2016 @ 1:30 PM
416	CV-2015-0005293-OC	Ephrem Kent	2017-02-02	Fail to Appear for Examination
421	CV-2015-0004463-OC	Allison Julie K	2016-05-24	Fail to Obey Court Order
426	CV-2015-0004201-OC	Widerburg Ryan Lane	2016-06-22	Fail to Appear for Hearing 2/19/16 @ 9:00 AM
431	CV-2015-0003256-OC	Potter Angela Dawn	2016-03-24	Fail to Appear for Debtor's Exam Hearing 12/4/15
436	CV-2015-0002573-OC	Terry John W	2016-02-29	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
441	CV-2015-0002498-OC	Curzon Blaine	2016-06-16	Fail to Appear for Debtor's Exam Hearing 1/20/16
446	CV-2015-0002314-OC	Malott Demi R	2016-05-19	Fail to Appear for Hearing (Examination of Judgment Debtor Hearing)
451	CV-2015-0002119-OC	Rentelman Tabitha Ineez	2016-10-06	Fail to Appear for Hearing for Examination of Judgment
456	CV-2015-0002091-OC	Sanchez Letesha Marie	2016-12-13	Fail to Obey Court Order
462	CV-2015-0001925-OC	Ramirez Gabriel	2017-07-05	Fail to Appear for Debtor Examination
466	CV-2015-0001808-OC	Gonzalez Luis M	2017-07-17	Fail to Appear for Debtor Examine
471	CV-2015-0001597-OC	Bird Bryan	2017-03-30	Fail to Appear for Hearing (Supplemental hearing 9-2-16 @ 9:00 AM)
476	CV-2015-0000614-OC	Higgins Kevin	2015-12-03	Fail to Appear for Examination of Judgment of Debtor August 5 2015 at 9:00 a.m.
477	CV-2015-0000614-OC	Higgins Kevin	2017-02-02	Fail to Appear for Examination Of Judgment Debtor
486	CV-2014-0006856-OC	Albertson Danial Burton	2016-06-16	Fail to Appear for Hearing- Examination Of Judgment Debtor Hearing 2/10/2016 @ 9:45 AM
487	CV-2014-0006856-OC	Albertson Sara	2017-04-17	Fail to Appear for Debtor Examination
496	CV-2014-0006816-OC	Andra Travis	2016-03-24	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
501	CV-2014-0006179-OC	Peterson Saleena	2017-05-05	Fail to Appear for Hearing
506	CV-2014-0006085-OC	Merrill Kelli	2016-03-28	Fail to Obey Court Order by failing to appear for examination of judgment debtor-
511	CV-2014-0005765-OC	Chapin Benjamin	2016-07-22	Fail to Appear for Hearing (Examination of Judgment Debtor Hearing)\\n***Warrant Recalled***
516	CV-2014-0005451-OC	Salinas Jesus	2016-01-29	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
517	CV-2014-0005451-OC	Salinas Jesus	2016-04-22	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
526	CV-2014-0005372-OC	Deblase Jamen Cory	2015-10-21	Fail to Appear for Hearing- debtors examination
531	CV-2014-0004592-OC	Benson Lisa Dawn	2016-03-25	Fail to Appear for Hearing-Examination of Judgment Debtor Hearing 7/10/2015 @ 9:00 AM
536	CV-2014-0001515-OC	Kirchner Standley	2016-03-28	Fail to Appear for Hearing - Examination of Judgment Debtor Hearing August 7 2015 at 9:00 a.m.
541	CV-2014-0000613-OC	Matthews Jami L	2016-04-29	Fail to Appear for Debtor's Exam Hearing 9/25/15 @ 9:00 a.m.
546	CV-2013-0006681-OC	Rodriguez Krystal	2016-04-27	Fail to Appear for Debtor's Exam Hearing 1/27/16
551	CV-2013-0006155-OC	Gasser Tobe	2016-03-28	Fail to Appear for Hearing-Examination of Judgment Debtor Hearing 9/11/2015 @ 9:00 AM
552	CV-2013-0006155-OC	Gasser Tobe	2016-07-28	Fail to Appear for Hearing- Examination Of Judgment Debtor Hearing-September 11 2015 @ 9:00 AM\\n***Warrant Returned Not Found****
553	CV-2013-0006155-OC	Gasser Tobe	2016-12-15	Fail to Appear for Examination of Judgment Debtor Hearing 9-11-15 at 9:00 a.m.
566	CV-2013-0005994-OC	Whipple Duane Jr.	2016-02-29	Fail to Appear for Examination of Judgment of Debtor May 14 2015 at 9:00 a.m. (Original warrant went back to Bryan Zollinger's office)
571	CV-2013-0005959-OC	Wood Raymond	2017-07-03	Fail to Obey Court Order and appear for Debtor Hearing
576	CV-2013-0005277-OC	Francis Stephanie E	2016-03-31	Fail to Appear for Debtor's Exam Hearing 12/28/15 (LEMHI COUNTY)
581	CV-2013-0004578-OC	Brink Jeff	2016-03-28	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
586	CV-2013-0003192-OC	Swanson Monica	2015-10-27	Fail to Appear for Hearing- Examination of Judgment Debtor Hearing 5/18/2015 @ 9:00 AM
591	CV-2013-0002901-OC	Trueblood Krystal F	2016-03-28	Fail to Appear for Debtor's Exam Hearing 9/18/15 @ 9:00 a.m.
596	CV-2013-0000950-OC	Hernandez Angel Ruth	2016-04-29	Fail to Appear for Hearing- Examination of Debtor
601	CV-2012-0006005-OC	Johnson Linda M	2015-01-29	Fail to Appear for Hearing- Supplemental Examination 6/27/2014 @ 9:00 AM
606	CV-2012-0005409-OC	Waid Brittney Lynn	2015-06-01	Fail to Appear for Hearing-Debtor's Exam 11/20/2014
611	CV-2012-0003329-OC	Hansen Justin	2017-05-22	Fail to Appear for Hearing
612	CV-2012-0003329-OC	Hansen Justin	2017-05-26	Fail to Appear for Hearing/ Examination of Judgment Debtor Hearing
621	CV-2012-0002242-OC	Goodson Rebecca	2016-02-29	Fail to Appear for Hearing- Examination of Judgment Debtor Hearing 5/13/15 @ 9:00 AM
626	CV-2011-0001941-OC	Veldkamp Keith	2013-05-09	Fail to Appear for Hearing - Supplemental proceeding - 9/28/11 - BODY ATTACHMENT
627	CV-2011-0001941-OC	Veldkamp Keith	2016-03-28	Fail to Obey Court Order-Failed to Appear for Examination of Judgment Debtor Hearing 8/26/2015 at 9:00
636	CV-2011-0000984-OC	Shigley Mark	2012-02-09	Fail to Appear for Supplemental Hearing 10/7/11 @ 9:00 a.m.
641	CV-2011-0000709-OC	Stuart Stephanie Gail	2011-07-12	Fail to Appear for Hearing - Failure to appear to examination
646	CV-2010-0006839-OC	Sanchez Maria	2016-06-16	Fail to Appear for Hearing- 2-12-16 @ 9:00 AM
651	CV-2010-0006109-OC	Bierma Jackielyn	2011-03-22	Fail to Appear for Hearing
656	CV-2010-0006105-OC	Ockerman Mark K - Writ Of Body Attachment Returned	2015-02-18	Fail to Appear for Hearing- Debtor's Exam 11/11/2014
661	CV-2010-0005619-OC	Resendiz Shawn	2011-04-06	Fail to Appear for Supplementary Hearing 3/11/11 @ 9:00 a.m.
666	CV-2010-0004722-OC	Hoffman Robyn	2011-03-01	Fail to Appear for Hearing
673	CV-2010-0004449-OC	Returned by Attorney	2011-05-19	Fail to Appear for Supplemental Hearing 5/11/11 @ 9:00 a.m.
677	CV-2010-0004265-OC	De La Vega Eusebio	2011-04-07	Fail to Appear for Supplementary Hearing 3/11/11 @ 9:00 a.m.
682	CV-2010-0004245-OC	NOT SERVED	2011-02-10	Fail to Obey Court Order - Order of Examination
686	CV-2010-0004046-OC	Nielson Zachary Storer	2011-04-12	Fail to Appear for Hearing
691	CV-2010-0003523-OC	Reed Landen	2011-03-11	Fail to Appear for Supplemental Hearing 3/4/11 @ 9:00 a.m.
696	CV-2010-0002524-OC	Worden Elizabeth	2011-02-07	Fail to Appear 8-19-10 -$500.00 cash bond
701	CV-2010-0002172-OC	Warrant Returned	2015-12-10	
702	CV-2010-0002172-OC	Charlesworth Glen W	2015-12-10	Fail to Appear for Examination of Judgment Debtor Hearing May 15 2015 (Orig. warrant sent back to Bryan Zollinger's office)
711	CV-2010-0001926-OC	Cutler Pat	2011-06-08	Fail to Obey Court Order - Attend Order of Examination on 5/4/11 @ 1:30 pm in Custer Co.
716	CV-2010-0001787-OC	Dashnaw David Sr.	2011-04-13	Fail to Appear for Supplemental Hearing 1/21/11 @ 9:00 a.m.
721	CV-2010-0001779-OC	***NOT FOUND***	2011-10-27	Fail to Appear for Supplemental Hearing 5/13/11 @ 9:00 a.m.
726	CV-2010-0001313-OC	Jerry Bergeman & Sons	2012-01-19	Fail to Appear for Supplemental Hearing
731	CV-2010-0000686-OC	Hill Amanda	2010-07-30	Fail to Appear on or about April 30 2010
736	CV-2010-0000484-OC	4-4-11	2011-04-11	Fail to Obey Court Order
741	CV-2010-0000174-OC	Ramirez Michael Joseph	2011-07-11	Fail to Appear for Supplemental Hearing 3/3/11 @ 9:00 a.m.
746	CV-2009-0007582-OC	Taylor Tosha	2011-08-10	Fail to Appear for Hearing
751	CV-2009-0007469-OC	Barrett Brent	2011-02-24	Fail to Appear for Supplemental Hearing 12/3/10 @ 9:00 a.m.
756	CV-2009-0006463-OC	Christensen Camile E.	2010-09-08	Fail to Appear for Supplemental
757	CV-2009-0006463-OC	Christensen Camile E.	2011-01-07	Fail to Appear for Supplemental
766	CV-2009-0006183-OC	Walker Lonnie	2010-05-03	Fail to Appear for Supplemental Hearing 2/5/10 @ 9:00 a.m.
771	CV-2009-0005631-OC	Brown Burlajean B	2011-05-25	Fail to Appear for Supplemental Hearing on 7/23/10 @ 9:00 a.m.
776	CV-2009-0005611-OC	Metcalf Matthew C	2010-12-06	Fail to Appear for Supplemental Hearing 11/3/10 @ 9:00 a.m.
841	CV-2009-0000887-OC	SERVED	2009-08-14	Fail to Appear on 4-30-09 $500.00 Bond (Cash or Surety)
781	CV-2009-0004929-OC	Cartier Todd	2011-06-21	Fail to Appear for Supplemental Hearing 7/14/10 @ 9:00 a.m.
786	CV-2009-0003646-OC	Brown Lisa M.	2010-06-01	Fail to Appear for Hearing - Supplemental Hearing on 11/30/2009
791	CV-2009-0003222-OC	Hosac Gregg Leslie Jr.	2010-01-29	Fail to Appear 8-27-09
792	CV-2009-0003222-OC	Hosac Gregg Leslie Jr.	2010-09-24	Fail to Appear 7-21-10
801	CV-2009-0003058-OC	(NOT FOUND)	2010-01-29	Fail to Appear for Hearing -Supplemental Hearing 11/30/2009
806	CV-2009-0002894-OC	Karford Cyndi M	2011-04-07	Fail to Appear for Hearing
811	CV-2009-0002852-OC	Thurnwald Amber N.	2012-09-18	Fail to Appear for Hearing - Examination of a Judgment Debtor 7/23/12 @ 3:00 p.m.
816	CV-2009-0002536-OC	Smith Kimberly Jo	2010-02-25	Fail to Appear for Hearing - Body Attachment
821	CV-2009-0002300-OC	Whitfield Michelle M.	2010-03-19	Fail to Obey Court Order 7-15-09
826	CV-2009-0002169-OC	Eckley Tiffany Rose	2016-06-03	Fail to Appear for Debtor's Exam
831	CV-2009-0001839-OC	Smith Barbara	2010-12-30	Failed to Appear for Supplemental Hearing 10/27/10 @ 9:00 a.m.
836	CV-2009-0001491-OC	Fitch Jason Spencer	2009-08-27	Fail to Appear for Supplemental Hearing 7/17/09 @ 9:00 a.m.
846	CV-2009-0000517-OC	SERVED	2009-12-01	Fail to Appear 7-29-09
851	CV-2008-0007865-OC	Salgado Andy	2009-05-21	Fail to Appear for Hearing
856	CV-2008-0007859-OC	Johnson Myrrian	2009-06-17	Fail to Appear for Supplemental Hearing
857	CV-2008-0007859-OC	SERVED	2009-08-31	Fail to Appear for Supplemental Hearing
866	CV-2008-0007592-OC	Pierson Ryan	2009-11-16	Fail to Appear 8-24-09 (Cash Bond)
871	CV-2008-0007520-OC	(Not Served)	2010-02-09	Fail to Appear 10-29-09
874	CV-2008-0007520-OC	Smith Tracie	2012-01-13	Fail to Appear 8-20-10 (500 cash or surety bond)
881	CV-2008-0006996-OC	RETURN OF SERVICE WAS SENT TO SMITH DRISCOLL RATHER THAN THE COURT; ATTY OFFICE WILL SEND ORIGINAL TO THE COURT.	2009-08-07	Fail to Appear for Hearing - Supplemental Proceeding on June 19 2009
886	CV-2008-0006482-OC	SERVED	2009-07-23	Fail to Appear
891	CV-2008-0006277-OC	RETURNED NOT SERVED	2009-08-20	Fail to Appear for Supplemental Hearing 8/5/09 @ 9:00 a.m.
896	CV-2008-0006232-OC	Johnson Aimee Nicole	2009-04-17	Fail to Appear for Hearing
901	CV-2008-0005948-OC	Archibald Eileen	2010-04-09	Fail to Appear for Hearing - February 24 2010 @ 9:00 a.m.
906	CV-2008-0005653-OC	Morrison Chris	2009-07-27	Fail to Appear for Supplemental Hearing
911	CV-2008-0005523-OC	(Not Served)	2010-02-09	Fail to Appear for Supplemental Hearing 12/18/09 @ 9:00 a.m.
912	CV-2008-0005523-OC	Bartholomae Jenny	2010-10-06	Fail to Appear for Supplemental Hearing 9/10/10 @ 9:00 a.m.
921	CV-2008-0004523-OC	Rardin Steven Burton/Not Served	2010-01-04	Fail to Appear for Hearing - Supplemental Exam 11/25/2009
926	CV-2008-0004521-OC	Weaver Shannon	2010-09-09	Fail to Appear for Supplemental Hearing
927	CV-2008-0004521-OC	Served	2010-09-09	
936	CV-2008-0004394-OC	Rhodes Tom	2009-06-10	Fail to Obey Court Order cash or surety bond $3104.73
941	CV-2008-0004389-OC	Reid Allen	2012-07-24	Fail to Appear for Supplemental Hearing 07/08/09 @ 9:45 a.m.
946	CV-2008-0004215-OC	Yorgensen Julie D.	2010-05-12	Fail to Appear for Hearing - 04/14/2010 @ 9:00 a.m.
951	CV-2008-0003743-OC	Gilbert Gwen L	2009-06-04	Fail to Appear for Debtor's Exam 3/30/09
956	CV-2008-0002906-OC	Baker James	2010-07-29	Fail to Appear for Hearing
961	CV-2008-0002357-OC	Olson Mike J	2010-12-21	Fail to Appear for Supplemental Hearing 10/27/10 @ 9:00 a.m.
966	CV-2008-0002143-OC	White Christine N	2010-03-02	Fail to Appear for Hearing - February 24 2010 @ 9:00 a.m.
971	CV-2008-0001727-OC	Lovelace Ashlee Marie	2009-09-28	Fail to Appear for Supplemental Hearing 8/19/09 at 9:45 a.m.
972	CV-2008-0001727-OC	(Body Attachment)	2009-09-28	(Body Attachment)
981	CV-2007-0006682-OC	SERVED	2009-07-23	Fail to Appear on or about 4-8-09
986	CV-2007-0006052-OC	Unable to Locate	2010-01-13	Fail to Obey Court Order-
991	CV-2007-0005905-OC	***NOT FOUND***	2014-03-12	
996	CV-2007-0003867-OC	***UNABLE TO LOCATE PARTY***	2009-12-01	Fail to Appear for Supplmental Hearing 10/21/09 @ 9:00 a.m.
1001	CV-2007-0003726-OC	Blair Robert	2011-12-20	Fail to Appear for Supplemental Hearing 10/26/11 @ 9:00 a.m.
1006	CV-2007-0003236-OC	Robinson Joseph F.	2012-02-22	Fail to Appear for Supplemental Hearing 2/9/11 @ 9:00 a.m.
1011	CV-2007-0002366-OC	Wolfe Sadie	2010-12-21	Fail to Appear for Supplemental Hearing 11/17/10 @ 9:00 a.m.
1016	CV-2007-0001933-OC	Kelso Curtis	2010-03-24	Fail to Appear pursuant to Certain Order Dated 12-25-09
1021	CV-2007-0001465-OC	Herrera Larry G.	2009-10-07	Fail to Appear for Supplemental Hearing 7/22/09 @ 9:00 a.m
1026	CV-2006-0007333-OC	SERVED	2009-08-31	Fail to Appear for Supplemenal Hearing 7/22/09 @ 9:00 a.m.
1031	CV-2006-0003791-OC	Colby Gennie M.	2009-10-07	Fail to Appear for Supplemental Hearing 7/17/09 @ 9:00 a.m.
1036	CV-2006-0003346-OC	Jerry Bergman & Sons	2010-05-05	Fail to Appear for Supplemental Hearing 1/27/10 @ 9:00 a.m.
1041	CV-2006-0003126-OC	Christenot Tim	2011-07-25	Fail to Appear for Supplemental Hearing 10/26/10 @ 3:00 p.m. in Lemhi County
1046	CV-2006-0001961-OC	Colvin Joshua	2007-06-25	Fail to Appear for Hearing - April 2 2007
1051	CV-2006-0000288-OC	Loftus Brandy	2009-05-26	Fail to Appear for Hearing - April 2 2007
1056	CV-2005-0002069-OC	Cortez Pamela Iris	2010-12-13	Fail to Appear for Hearing -
1061	CV-2004-0004754-OC	SERVED	2009-07-22	Fail to Appear for Supplemental Hearing 7/1/09 @ 9:00 a.m.
\.


--
-- Name: warrants_returned_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mehrotra
--

SELECT pg_catalog.setval('warrants_returned_id_seq', 1297, true);


--
-- Name: cases cases_pkey; Type: CONSTRAINT; Schema: public; Owner: Mehrotra
--

ALTER TABLE ONLY cases
    ADD CONSTRAINT cases_pkey PRIMARY KEY (case_number);


--
-- Name: county county_name_key; Type: CONSTRAINT; Schema: public; Owner: Mehrotra
--

ALTER TABLE ONLY county
    ADD CONSTRAINT county_name_key UNIQUE (name);


--
-- Name: county county_pkey; Type: CONSTRAINT; Schema: public; Owner: Mehrotra
--

ALTER TABLE ONLY county
    ADD CONSTRAINT county_pkey PRIMARY KEY (id);


--
-- Name: judgements judgements_pkey; Type: CONSTRAINT; Schema: public; Owner: Mehrotra
--

ALTER TABLE ONLY judgements
    ADD CONSTRAINT judgements_pkey PRIMARY KEY (id);


--
-- Name: warrants warrants_pkey; Type: CONSTRAINT; Schema: public; Owner: Mehrotra
--

ALTER TABLE ONLY warrants
    ADD CONSTRAINT warrants_pkey PRIMARY KEY (id);


--
-- Name: warrants_returned warrants_returned_pkey; Type: CONSTRAINT; Schema: public; Owner: Mehrotra
--

ALTER TABLE ONLY warrants_returned
    ADD CONSTRAINT warrants_returned_pkey PRIMARY KEY (id);


--
-- Name: cases cases_county_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mehrotra
--

ALTER TABLE ONLY cases
    ADD CONSTRAINT cases_county_id_fkey FOREIGN KEY (county_id) REFERENCES county(id);


--
-- Name: judgements judgements_case_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mehrotra
--

ALTER TABLE ONLY judgements
    ADD CONSTRAINT judgements_case_number_fkey FOREIGN KEY (case_number) REFERENCES cases(case_number);


--
-- Name: warrants warrants_case_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mehrotra
--

ALTER TABLE ONLY warrants
    ADD CONSTRAINT warrants_case_number_fkey FOREIGN KEY (case_number) REFERENCES cases(case_number);


--
-- Name: warrants_returned warrants_returned_case_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mehrotra
--

ALTER TABLE ONLY warrants_returned
    ADD CONSTRAINT warrants_returned_case_number_fkey FOREIGN KEY (case_number) REFERENCES cases(case_number);


--
-- PostgreSQL database dump complete
--

