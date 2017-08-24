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
    plaintiff_id smallint NOT NULL,
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
-- Name: plaintiffs; Type: TABLE; Schema: public; Owner: Mehrotra
--

CREATE TABLE plaintiffs (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE plaintiffs OWNER TO "Mehrotra";

--
-- Name: plaintiffs_id_seq; Type: SEQUENCE; Schema: public; Owner: Mehrotra
--

CREATE SEQUENCE plaintiffs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plaintiffs_id_seq OWNER TO "Mehrotra";

--
-- Name: plaintiffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Mehrotra
--

ALTER SEQUENCE plaintiffs_id_seq OWNED BY plaintiffs.id;


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
-- Name: plaintiffs id; Type: DEFAULT; Schema: public; Owner: Mehrotra
--

ALTER TABLE ONLY plaintiffs ALTER COLUMN id SET DEFAULT nextval('plaintiffs_id_seq'::regclass);


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

COPY cases (county_id, plaintiff_id, filed, status, defendant, case_number, judge) FROM stdin;
254	1	2016-07-13	Inactive 05/25/2017	Falconer Jo Anna	CV-2016-0002464-OC	Rick Carnaroli
254	1	2016-04-26	Pending 02/28/2017	Jaramillo Jose M	CV-2016-0001456-OC	Scott E. Axline
254	1	2016-03-03	Pending 03/30/2017	Martinez Maricela	CV-2016-0000769-OC	Scott E. Axline
254	1	2016-02-22	Pending 01/04/2017	Hopkins Kenneth	CV-2016-0000601-OC	Steven A Thomsen
254	1	2015-10-28	Closed 11/17/2016	Powell Julie Ann	CV-2015-0003701-OC	Thomas W Clark
254	1	2015-09-09	Pending 05/31/2017	Barlow Daryenne Lee	CV-2015-0003107-OC	Steven A Thomsen
254	1	2015-07-24	Pending 05/04/2016	Wilson Craig Allen	CV-2015-0002546-OC	Thomas W Clark
254	1	2015-06-26	Inactive 05/18/2016	Carter Bradley W, Carter Diana L	CV-2015-0002160-OC	Steven A Thomsen
254	1	2015-03-26	Closed pending clerk action 06/09/2017	Lacy Joseph T	CV-2015-0001070-OC	Thomas W Clark
254	1	2015-03-19	Closed 07/28/2016	Wiebelhaus Sky E	CV-2015-0000987-OC	Robert C Naftz
254	1	2015-02-05	Closed 05/01/2017	Williams Sallie Francine	CV-2015-0000412-OC	Rick Carnaroli
254	1	2014-12-10	Closed 05/26/2017	Myler Joshua David	CV-2014-0004864-OC	Scott E. Axline
254	1	2014-11-12	Pending 02/23/2016	Morrison Mistie	CV-2014-0004515-OC	Thomas W Clark
254	1	2014-04-29	Closed pending clerk action 04/14/2017	Arrants Harley H III	CV-2014-0001722-OC	Rick Carnaroli
254	1	2014-03-24	Pending 01/14/2016	Olsen Christopher M, Olsen Shasta B	CV-2014-0001248-OC	Scott E. Axline
254	1	2014-03-17	Closed pending clerk action 02/09/2017	Griffey Kathleen M	CV-2014-0001129-OC	Rick Carnaroli
254	1	2013-12-11	Closed 11/17/2016	Barrand Carrie L, Barrand Jesse	CV-2013-0004755-OC	Rick Carnaroli
254	1	2013-10-31	Closed 06/09/2016	Edwards Jordan R.	CV-2013-0004196-OC	Scott E. Axline
254	1	2013-10-08	Closed 04/27/2016	Eldridge William C	CV-2013-0003798-OC	Steven A Thomsen
254	1	2013-04-22	Closed 07/12/2016	Brewer Cynthia Ann, Dickman Frank Loreen	CV-2013-0001469-OC	Rick Carnaroli
254	1	2012-10-03	Inactive 07/22/2013	Ellertson Steven C	CV-2012-0004252-OC	Rick Carnaroli
254	1	2012-09-19	Inactive 09/18/2015	Neubacher Beth, Neubacher David	CV-2012-0004021-OC	Scott E. Axline
254	1	2012-07-31	Closed pending clerk action 06/08/2015	Bacon Anissa M, Bacon David M	CV-2012-0003180-OC	Thomas W Clark
254	1	2012-06-06	Closed pending clerk action 01/07/2013	Mcghee Cathy, Rowley Patrick T	CV-2012-0002384-OC	Rick Carnaroli
254	1	2012-03-20	Closed pending clerk action 09/15/2016	Randall Tenya Ray	CV-2012-0001209-OC	Rick Carnaroli
254	1	2012-02-21	Closed 01/13/2016	Price Dennis H	CV-2012-0000747-OC	Thomas W Clark
254	1	2012-01-30	Closed pending clerk action 12/08/2016	Bybee Laurie J	CV-2012-0000408-OC	Thomas W Clark
254	1	2011-12-29	Closed 05/22/2013	Cameron Bart, Cameron Kathryn	CV-2011-0005533-OC	Rick Carnaroli
254	1	2011-11-22	Closed 11/21/2016	Davis Renee N, Davis William M	CV-2011-0004911-OC	Steven A Thomsen
254	1	2011-08-23	Closed 06/21/2013	Starks Theresa Anne	CV-2011-0003472-OC	Steven A Thomsen
254	1	2011-08-23	Inactive 01/14/2013	Lewis Jeff, Lewis Mellisa	CV-2011-0003465-OC	Rick Carnaroli
254	1	2011-08-15	Closed 08/09/2016	Hazelbush Cory K, Hazelbush Misti	CV-2011-0003323-OC	Rick Carnaroli
254	1	2011-07-26	Closed pending clerk action 09/21/2012	Saraceno Tony	CV-2011-0002966-OC	Steven A Thomsen
254	1	2011-07-19	Closed 03/04/2013	Guthrie Curtis Rye, Guthrie Kasey	CV-2011-0002871-OC	Rick Carnaroli
254	1	2011-07-13	Pending 09/26/2012	Dueling Soibhan, Dueling Todd	CV-2011-0002819-OC	Thomas W Clark
254	1	2011-06-14	Pending 07/24/2017	Medrano Rosendo	CV-2011-0002374-OC	Thomas W Clark
254	1	2011-06-10	Closed 09/24/2015	Larsen Laurel L	CV-2011-0002320-OC	Rick Carnaroli
254	1	2011-05-13	Closed 09/30/2013	Ridley Darrin L, Ridley Katye A	CV-2011-0001910-OC	Thomas W Clark
254	1	2011-01-19	Closed 01/14/2015	Anderson Cynthia, Anderson William Reed II	CV-2011-0000225-OC	Thomas W Clark
254	1	2010-09-15	Closed 12/10/2015	Tibbitts Russell, Verderber Tessa Leigh	CV-2010-0003812-OC	Steven A Thomsen
254	1	2010-09-15	Closed 02/22/2013	Johns Darin Michael	CV-2010-0003811-OC	Rick Carnaroli
254	1	2010-08-19	Closed 09/11/2015	Downard Corinna	CV-2010-0003427-OC	Rick Carnaroli
254	1	2010-07-30	Closed 08/11/2015	Hoyt Bradley Ryan, Hoyt Michelle M	CV-2010-0003133-OC	Rick Carnaroli
254	1	2010-04-02	Closed 04/30/2015	Mcmahen Trent Anthony	CV-2010-0001408-OC	Rick Carnaroli
254	1	2010-02-26	Closed 03/05/2014	Thompson Edwin E	CV-2010-0000837-OC	Thomas W Clark
254	1	2010-02-23	Closed 04/04/2015	Howerton Tina M, Howerton rod	CV-2010-0000767-OC	Scott E. Axline
254	1	2010-02-05	Closed 12/10/2012	Rogers Adam W, Rogers Stephanie	CV-2010-0000482-OC	Thomas W Clark
254	1	2009-09-01	Closed 02/08/2012	Croft Kasi K.	CV-2009-0003428-OC	Steven A Thomsen
254	1	2009-06-26	Closed pending clerk action 06/25/2014	Leading Mark r, Scotton Susan	CV-2009-0002517-OC	Steven A Thomsen
254	1	2009-05-27	Pending 08/12/2016	Doe John, Mahan Nickcole D	CV-2009-0002074-OC	Steven A Thomsen
254	1	2009-03-18	Closed pending clerk action 12/15/2010	Casper Andrew J, Casper Kristi	CV-2009-0001076-OC	Steven A Thomsen
254	1	2008-11-18	Closed 06/24/2013	Reisner Darwin, Reisner Toni	CV-2008-0004674-OC	Rick Carnaroli
254	1	2008-09-19	Closed 08/21/2013	Rowberry Jeremy	CV-2008-0003859-OC	Steven A Thomsen
254	1	2008-09-18	Closed 09/17/2012	Alonso Carrie J.	CV-2008-0003809-OC	Rick Carnaroli
254	1	2008-08-08	Closed 02/29/2012	Stark Justin D	CV-2008-0003191-OC	Steven A Thomsen
254	1	2008-07-22	Closed 03/28/2011	Heath Arthur Sr, Heath Peggy	CV-2008-0002942-OC	Rick Carnaroli
254	1	2008-07-22	Closed 02/03/2010	Robinson Michele Lynn, Vaughan Shane J.	CV-2008-0002939-OC	Rick Carnaroli
254	1	2008-07-22	Pending 10/29/2010	Palmer James	CV-2008-0002938-OC	Scott E. Axline
254	1	2007-11-13	Closed 04/02/2009	Valai John, Valai Shirlene	CV-2007-0004797-OC	Steven A Thomsen
254	1	2007-10-18	Closed 08/11/2017	Lane Martin	CV-2007-0004453-OC	Steven A Thomsen
254	1	2007-10-05	Closed 02/01/2012	Larsen Jared Lee, Larsen Talisa	CV-2007-0004301-OC	Rick Carnaroli
254	1	2007-09-21	Closed 09/28/2009	Walker Rayann, Walker Willie Joe Jr	CV-2007-0004039-OC	Rick Carnaroli
254	1	2007-05-17	Pending 06/01/2017	McDonald Michael Raymond, McDonald Rosemarrie Jean	CV-2007-0002171-OC	Scott E. Axline
254	1	2006-11-16	Closed 02/11/2013	Govan Herman Jr, Govan Maria	CV-2006-0004975-OC	Rick Carnaroli
254	1	2006-05-25	Closed 04/21/2009	Elder Donald E	CV-2006-0002383-OC	Rick Carnaroli
254	1	2006-05-25	Closed 07/07/2008	Cluff Alan, May Brenda Eva	CV-2006-0002382-OC	Gaylen L. Box
252	1	2015-06-29	Pending 06/30/2016	Conan Jamie Dean	CV-2015-0001081	James H Barrett
252	1	2015-06-22	Inactive 06/07/2017	Roberts Ron	CV-2015-0001037	James H Barrett
252	1	2015-04-06	Closed 03/02/2017	Buck Weston	CV-2015-0000587	James H Barrett
252	1	2014-10-06	Closed 07/05/2017	Smith Barry, Smith Melonie Dawn	CV-2014-0001875	Scott  H. Hansen
252	1	2014-10-02	Closed 12/27/2016	Leonardson Charles Wayne, Leonardson Traci L	CV-2014-0001828	Scott  H. Hansen
252	1	2013-09-19	Inactive 06/07/2017	Doe John, Elison Desiree Sarah	CV-2013-0001820	Scott  H. Hansen
252	1	2012-10-26	Closed 03/09/2017	Kohler Kaydon, Kohler Vaneen G	CV-2012-0002228	Scott  H. Hansen
53	1	2015-07-27	Pending 08/21/2017	Jones Duston, Jones Kimberly B	CV-2015-0000672	Blaine Cannon
85	1	2012-12-05	Inactive 04/23/2014	Ellis Cierra, Ellis William Robert	CV-2012-0000599	Gregory W. Moeller
105	1	2016-06-06	Closed 06/29/2017	Rothman Jeffrey Michael	CV-2016-0000297	Casey Robinson
105	1	2016-04-05	Inactive 05/23/2017	Renick Lisa	CV-2016-0000175	Casey Robinson
105	1	2015-09-08	Closed 08/30/2016	Romo Joseph Michael	CV-2015-0000424	Casey Robinson
105	1	2014-12-01	Closed 04/04/2016	Doe Jane, Mcdonald Fred T	CV-2014-0000600	Casey Robinson
111	1	2014-08-25	Closed 03/03/2017	Varela Judith, Varela Luis	CV-2014-0000636	Robert L. Crowley Jr.
111	1	2014-04-03	Closed 04/28/2015	Doe Jane, Mangan Martin A	CV-2014-0000276	Robert L. Crowley Jr.
111	1	2014-01-23	Inactive 04/20/2016	Sorensen Cherie, Sorensen John Doe	CV-2014-0000059	Robert L. Crowley Jr.
111	1	2013-08-21	Closed 07/29/2014	Hernandez John Doe, Hernandez Leticia	CV-2013-0000705	Robert L. Crowley Jr.
111	1	2013-07-31	Closed pending clerk action 02/03/2015	Barrientos Francesca, Barrientos J	CV-2013-0000653	Robert L. Crowley Jr.
111	1	2013-07-18	Closed 03/18/2014	Graham Brittney, Graham Jed Tyler	CV-2013-0000615	Robert L. Crowley Jr.
111	1	2013-03-26	Closed 05/02/2014	Schell Jane Doe, Schell John	CV-2013-0000272	Robert L. Crowley Jr.
111	1	2013-03-14	Closed 04/08/2014	Parker Brent, Parker Kristine B	CV-2013-0000239	Robert L. Crowley Jr.
111	1	2013-03-11	Closed 05/11/2015	Linares Brittany Jo, Linares Jacinto J	CV-2013-0000233	Robert L. Crowley Jr.
111	1	2013-02-05	Closed 10/03/2013	Stibal Jane Doe, Stibal Tyrel L	CV-2013-0000123	Robert L. Crowley Jr.
111	1	2012-12-06	Closed 06/23/2017	Robbins Jane Doe, Robbins Jeff J	CV-2012-0001026	Robert L. Crowley Jr.
111	1	2012-11-20	Closed 02/21/2017	Dortch Jimmy T, Dortch Monica	CV-2012-0000967	Robert L. Crowley Jr.
111	1	2012-10-26	Closed 04/17/2015	Lopez Jane Doe, Lopez Joe	CV-2012-0000879	Robert L. Crowley Jr.
111	1	2012-10-26	Closed 05/15/2015	Smith Rachel, Smith Shane Eldon	CV-2012-0000875	Robert L. Crowley Jr.
111	1	2012-09-07	Closed pending clerk action 06/23/2017	Fillmore Craig Lynn, Fillmore Michelle Rae	CV-2012-0000713	Robert L. Crowley Jr.
111	1	2012-08-23	Closed 07/06/2017	Covington Jane Doe, Covington Jory T	CV-2012-0000664	Robert L. Crowley Jr.
111	1	2012-08-07	Inactive 06/18/2013	Christensen Amanda N, Christensen Josh	CV-2012-0000619	Robert L. Crowley Jr.
111	1	2012-08-01	Closed 11/16/2015	Morton Megan Joy, Morton Skipper T	CV-2012-0000603	Robert L. Crowley Jr.
111	1	2012-02-24	Closed 09/29/2016	Bowcutt Jane Doe, Bowcutt Quentin K	CV-2012-0000166	Robert L. Crowley Jr.
111	1	2010-12-30	Closed pending clerk action 06/06/2017	Morton Megan, Morton Skipper T	CV-2010-0001301	Robert L. Crowley Jr.
111	1	2010-12-23	Closed 08/05/2014	Davis J. Alan, Davis Jennifer	CV-2010-0001277	Robert L. Crowley Jr.
111	1	2010-08-27	Closed 09/29/2015	Wilde John Doe, Wilde Shelly	CV-2010-0000845	Robert L. Crowley Jr.
111	1	2010-07-21	Closed 03/07/2013	Barber Dawn, Barber Lance D	CV-2010-0000703	Robert L. Crowley Jr.
111	1	2010-06-25	Closed 06/06/2012	Williams Audrey Ann, Williams Curtis Martin	CV-2010-0000613	Alan C. Stephens
111	1	2010-03-12	Inactive 07/06/2017	Coles Holly M, Coles Jeffrey Lloyd	CV-2010-0000238	Robert L. Crowley Jr.
111	1	2009-11-19	Closed 01/03/2013	Oler Deena Lynn, Oler John Doe	CV-2009-0001047	Robert L. Crowley Jr.
111	1	2009-03-17	Closed 12/12/2011	Layton Brent, Layton Shawntell	CV-2009-0000234	Robert L. Crowley Jr.
111	1	2009-02-24	Closed 11/18/2011	Doe John, Stowers Rebecca Ann	CV-2009-0000151	Robert L. Crowley Jr.
111	1	2008-12-12	Closed 04/08/2015	Doe John, Sakan Karla R	CV-2008-0001058	Robert L. Crowley Jr.
111	1	2008-12-05	Closed 01/07/2011	John Doe, Thompson Sheri	CV-2008-0001024	Robert L. Crowley Jr.
111	1	2008-11-14	Closed 09/16/2009	Graham Dennis, Graham Marcia	CV-2008-0000963	Robert L. Crowley Jr.
111	1	2008-10-22	Closed 02/28/2014	Baler John Doe, Baler Nikki	CV-2008-0000892	Robert L. Crowley Jr.
111	1	2008-09-30	Closed 06/19/2009	Wakley Charity Ann, Wakley John Doe	CV-2008-0000836	Robert L. Crowley Jr.
111	1	2008-09-30	Closed 07/09/2010	Acor Kevin T, Acor Tiffany	CV-2008-0000831	Robert L. Crowley Jr.
111	1	2008-09-03	Closed 07/21/2011	Roberts Corry, Roberts Jessica Helene	CV-2008-0000738	Robert L. Crowley Jr.
111	1	2008-05-02	Closed 09/29/2015	Coffey Tyanna Daylene, Wellard Matthew J	CV-2008-0000367	Robert L. Crowley Jr.
111	1	2007-04-11	Closed 11/18/2016	Rogers Gale Wayne, Rogers Melanie Mobley	CV-2007-0000293	Robert L. Crowley Jr.
111	1	2007-02-14	Closed 03/13/2008	Baker Jennie M, Baker Matthew L	CV-2007-0000152	Michael B. Kennedy
111	1	2007-01-09	Closed 02/04/2008	Owens Jane Doe, Owens Steven	CV-2007-0000026	Robert L. Crowley Jr.
111	1	2006-12-05	Closed 04/23/2010	Morgan Jennifer Lou, Morgan John Doe	CV-2006-0000984	Robert L. Crowley Jr.
111	1	2006-11-27	Closed 12/07/2011	Landon Jane Doe, Landon Jared Daniel	CV-2006-0000963	Robert L. Crowley Jr.
169	1	2014-02-12	Closed 04/09/2015	Olmos Claudia, Olmos Jose	CV-2014-0000110	Rick L Bollar
169	1	2013-05-20	Inactive 08/28/2014	Doe John, Moreno Olivia	CV-2013-0000450	Rick L Bollar
169	1	2012-08-03	Closed pending clerk action 06/19/2014	R.S. Smith Express LLC, Smith Robert S	CV-2012-0000550	Rick L Bollar
219	1	2016-02-24	Inactive 12/28/2016	McDaniel Richard Lynn	CV-2016-0000027	Jason D Walker
219	1	2014-08-25	Pending 11/23/2015	Baughman Kristi, Doe John	CV-2014-0000215	Jason D Walker
219	1	2014-03-28	Closed 07/22/2015	John Doe, Valdez Krista D	CV-2014-0000084	Jason D Walker
254	5	2014-07-08	Closed pending clerk action 08/09/2016	Tharpe Marcus Vaughan	CV-2014-0002795-OC	Thomas W Clark
252	5	2016-07-21	Inactive 06/28/2017	Murray Tyson D	CV-2016-0001209	Scott  H. Hansen
252	5	2016-06-17	Inactive 06/28/2017	Jensen Jason	CV-2016-0000992	Scott  H. Hansen
252	5	2012-12-06	Inactive 07/14/2014	Bingo Leonard	CV-2012-0002547	Darren B. Simpson
53	5	2014-03-12	Closed 03/28/2017	Dickson Dorothy G	CV-2014-0000263	Mick Hodges
117	5	2014-04-11	Closed pending clerk action 01/30/2017	Jenkins Megan S, Jenkins Rachael	CV-2014-0003144	James Combo
169	5	2014-11-05	Closed 02/08/2017	Bell Dustin J	CV-2014-0000818	Rick L Bollar
257	2	2008-08-25	Closed 10/10/2013	Varner Michael Joseph Jr, Varner Tiffany M	CV-2008-0000183	Mitchell W Brown
253	1	2016-06-30	Pending 06/29/2017	Chester Dawna Lynn	CV-2016-0003472-OC	Stephen J. Clark
253	1	2016-06-02	Pending 05/30/2017	Thomas Tammy	CV-2016-0002920-OC	Michelle R. Mallard
253	1	2016-04-27	Pending 07/05/2017	Maxey Patrick Armon	CV-2016-0002301-OC	L. Mark Riddoch
253	1	2016-03-01	Pending 05/26/2017	Barraza Monica	CV-2016-0001141-OC	Steven A. Gardner
253	1	2015-10-20	Closed 10/07/2016	Rasmussen Tyler Michael	CV-2015-0005659-OC	Michelle R. Mallard
253	1	2015-10-02	Pending 02/02/2017	Ephrem Kent	CV-2015-0005293-OC	Stephen J. Clark
253	1	2015-10-01	Inactive 07/24/2017	Perez Fabiola	CV-2015-0005294-OC	Steven A. Gardner
253	1	2015-09-02	Inactive 07/24/2017	Radford Sharon	CV-2015-0004793-OC	Steven A. Gardner
253	1	2015-08-24	Inactive 05/20/2016	Rollene Jason Lee	CV-2015-0004619-OC	Steven A. Gardner
253	1	2015-08-14	Closed 09/14/2016	Allison Julie K	CV-2015-0004463-OC	L. Mark Riddoch
253	1	2015-07-31	Closed pending clerk action 07/20/2017	Widerburg Ryan Lane	CV-2015-0004201-OC	Steven A. Gardner
253	1	2015-07-02	Inactive 08/22/2017	Rodriguez Jorge, Rodriguez Natasha Lynn	CV-2015-0003556-OC	Stephen J. Clark
253	1	2015-06-26	Closed 02/14/2017	Phantom Repossessions LLC and Idaho, Stoneburner Joshua	CV-2015-0003472-OC	L. Mark Riddoch
253	1	2015-06-15	Closed 03/20/2017	Potter Angela Dawn	CV-2015-0003256-OC	Steven A. Gardner
253	1	2015-05-08	Closed 10/17/2016	Moore Heather M, Terry John W	CV-2015-0002573-OC	L. Mark Riddoch
253	1	2015-05-06	Pending 06/16/2016	Curzon Blaine	CV-2015-0002498-OC	Michelle R. Mallard
253	1	2015-04-27	Closed pending clerk action 07/24/2017	Malott Demi R	CV-2015-0002314-OC	Stephen J. Clark
253	1	2015-04-17	Closed 03/16/2017	Rentelman Tabitha Ineez	CV-2015-0002119-OC	Stephen J. Clark
253	1	2015-04-16	Pending 12/13/2016	Sanchez Letesha Marie	CV-2015-0002091-OC	L. Mark Riddoch
253	1	2015-04-15	Inactive 12/01/2015	Costilla Ana Rosa	CV-2015-0002063-OC	Steven A. Gardner
253	1	2015-04-08	Pending 07/05/2017	Ramirez Gabriel	CV-2015-0001925-OC	L. Mark Riddoch
253	1	2015-04-03	Pending 07/17/2017	Gonzalez Luis M	CV-2015-0001808-OC	L. Mark Riddoch
253	1	2015-03-25	Inactive 08/04/2017	Beckstead Dustin	CV-2015-0001642-OC	Steven A. Gardner
253	1	2015-03-23	Closed 06/16/2017	Bird Bryan Thomas	CV-2015-0001597-OC	Steven A. Gardner
253	1	2015-02-02	Closed 05/18/2017	Higgins Kevin	CV-2015-0000614-OC	Stephen J. Clark
253	1	2014-12-15	Inactive 07/27/2017	Rydalch Bonnie, Rydalch Brandon	CV-2014-0006857-OC	L. Mark Riddoch
253	1	2014-12-15	Inactive 04/20/2017	Albertson Danial Burton, Albertson Sara	CV-2014-0006856-OC	L. Mark Riddoch
253	1	2014-12-12	Closed 02/14/2017	Andra Katie, Andra Travis	CV-2014-0006816-OC	L. Mark Riddoch
253	1	2014-11-10	Pending 05/05/2017	*John Doe*, Peterson Saleena	CV-2014-0006179-OC	Michelle R. Mallard
253	1	2014-11-04	Closed 05/09/2017	*John Doe*, Merrill Kelli	CV-2014-0006085-OC	Michelle R. Mallard
253	1	2014-10-20	Pending 07/28/2016	Chapin Benjamin, Chapin Crystal K	CV-2014-0005765-OC	Stephen J. Clark
253	1	2014-10-03	Pending 04/22/2016	*Jane Doe *, Salinas Jesus	CV-2014-0005451-OC	Steven A. Gardner
253	1	2014-10-01	Pending 10/21/2015	*Jane Doe *, Deblase Jamen Cory	CV-2014-0005372-OC	Stephen J. Clark
253	1	2014-08-21	Closed 06/15/2016	*John Doe*, Benson Lisa Dawn	CV-2014-0004592-OC	L. Mark Riddoch
253	1	2014-05-06	Inactive 11/17/2015	Bunch Andrew, Bunch Jessica	CV-2014-0002614-OC	L. Mark Riddoch
253	1	2014-03-11	Pending 03/28/2016	Kirchner Cheryl, Kirchner Standley	CV-2014-0001515-OC	L. Mark Riddoch
253	1	2014-03-04	Closed pending clerk action 11/02/2016	Doe John, Nunez Jacqueline Angelica	CV-2014-0001359-OC	L. Mark Riddoch
253	1	2014-01-29	Closed 07/18/2016	Matthews Eddie, Matthews Jami L	CV-2014-0000613-OC	Stephen J. Clark
253	1	2013-12-17	Closed 08/30/2016	Rodriguez Justin, Rodriguez Krystal	CV-2013-0006681-OC	Steven A. Gardner
253	1	2013-11-27	Closed pending clerk action 07/26/2016	Fowers Rachelle C, Fowers Richard D	CV-2013-0006369-OC	Stephen J. Clark
253	1	2013-11-19	Pending 12/15/2016	*Jane Doe *, Gasser Tobe	CV-2013-0006155-OC	L. Mark Riddoch
253	1	2013-11-13	Inactive 12/03/2015	Hunsaker Daniel J, Hunsaker Tami	CV-2013-0006041-OC	L. Mark Riddoch
253	1	2013-11-12	Closed pending clerk action 07/26/2016	*Jane Doe *, Whipple Duane Jr.	CV-2013-0005994-OC	Stephen J. Clark
253	1	2013-11-08	Pending 07/03/2017	Wood Leeanna, Wood Raymond	CV-2013-0005959-OC	Michelle R. Mallard
253	1	2013-10-03	Closed 06/14/2016	Francis Michael, Francis Stephanie E	CV-2013-0005277-OC	Steven A. Gardner
253	1	2013-08-29	Pending 03/28/2016	Brink Jeff, Brink Jennifer I.	CV-2013-0004578-OC	Steven A. Gardner
253	1	2013-06-19	Inactive 04/19/2017	Olson Dalena, Olson Mike	CV-2013-0003303-OC	Steven A. Gardner
253	1	2013-06-13	Closed 06/13/2016	Swanson Allen, Swanson Monica	CV-2013-0003192-OC	L. Mark Riddoch
253	1	2013-06-03	Pending 03/28/2016	*John Doe*, Trueblood Krystal F	CV-2013-0002901-OC	Steven A. Gardner
253	1	2013-03-28	Inactive 03/09/2015	*jane Doe*, Harrington William B	CV-2013-0001690-OC	L. Mark Riddoch
253	1	2013-02-20	Closed 07/11/2016	*John Doe*, Hernandez Angel Ruth	CV-2013-0000950-OC	Michelle R. Mallard
253	1	2012-10-19	Closed 06/07/2016	*John Doe*, Johnson Linda M	CV-2012-0006005-OC	L. Mark Riddoch
253	1	2012-09-21	Closed 06/01/2015	Doe John, Waid Brittney Lynn	CV-2012-0005409-OC	L. Mark Riddoch
253	1	2012-06-13	Pending 05/26/2017	DOE Jane, Hansen Justin	CV-2012-0003329-OC	Stephen J. Clark
253	1	2012-04-19	Pending 02/29/2016	Doe John, Goodson Rebecca	CV-2012-0002242-OC	L. Mark Riddoch
253	1	2011-10-31	Inactive 08/26/2015	Crane Brooke K., Doe John	CV-2011-0006751-OC	Stephen J. Clark
253	1	2011-10-21	Inactive 06/16/2017	Trejo Sheryl L, Trejo Todd	CV-2011-0006548-OC	L. Mark Riddoch
253	1	2011-08-17	Inactive 07/24/2017	Briggs Trisha, Doe John	CV-2011-0005102-OC	Steven A. Gardner
253	1	2011-03-30	Pending 03/28/2016	DOE Jane, Veldkamp Keith	CV-2011-0001941-OC	Stephen J. Clark
253	1	2011-02-15	Closed pending clerk action 12/08/2015	DOE Jane, Shigley Mark	CV-2011-0000984-OC	Jason D. Walker
253	1	2011-01-31	Closed 07/12/2011	Price Scott, Stuart Stephanie Gail	CV-2011-0000709-OC	Stephen J. Clark
253	1	2010-11-12	Inactive 05/19/2011	McCracken Charles, McCracken Robin Ann	CV-2010-0007011-OC	Stephen J. Clark
253	1	2010-11-08	Closed 11/22/2016	Doe John, Sanchez Maria	CV-2010-0006839-OC	Steven A. Gardner
253	1	2010-10-04	Closed 03/23/2011	Bierma Dennis, Bierma Jackielyn	CV-2010-0006109-OC	L. Mark Riddoch
253	1	2010-10-04	Closed 08/10/2015	Ockerman Jolee Diane, Ockerman Mark K	CV-2010-0006105-OC	L. Mark Riddoch
253	1	2010-09-14	Closed 08/19/2016	Jane Doe, Resendiz Shawn	CV-2010-0005619-OC	Michelle R. Mallard
253	1	2010-09-14	Inactive 07/07/2011	Messick Dustin, Messick Kaysha	CV-2010-0005615-OC	Stephen J. Clark
253	1	2010-08-04	Closed 08/14/2012	Hoffman John Doe, Hoffman Robyn	CV-2010-0004722-OC	Stephen J. Clark
253	1	2010-07-22	Closed 05/19/2011	Demma John Doe, Demma Shelly	CV-2010-0004449-OC	Colin W. Luke
253	1	2010-07-16	Closed 04/07/2011	De La Vega Eusebio, Jane Doe	CV-2010-0004265-OC	Michelle R. Mallard
253	1	2010-07-15	Closed 02/10/2011	Tortel Myles B., Tortel Venita	CV-2010-0004245-OC	L. Mark Riddoch
253	1	2010-07-06	Closed 04/12/2011	Jane Doe, Nielson Zachary Storer	CV-2010-0004046-OC	Colin W. Luke
253	1	2010-07-02	Closed pending clerk action 08/07/2015	Butchart Karen Maureen, Butchart Paul	CV-2010-0003975-OC	Stephen J. Clark
253	1	2010-06-11	Closed 03/22/2012	Reed Erin Rae, Reed Landen	CV-2010-0003523-OC	Colin W. Luke
253	1	2010-04-23	Closed 04/23/2015	Worden Adam, Worden Elizabeth	CV-2010-0002524-OC	Stephen J. Clark
253	1	2010-04-12	Pending 12/10/2015	Charelsworth Jane Doe, Charlesworth Glen W	CV-2010-0002172-OC	Stephen J. Clark
253	1	2010-03-26	Closed 07/22/2015	Cutler Jane Doe, Cutler Pat	CV-2010-0001926-OC	Stephen J. Clark
253	1	2010-03-24	Closed 02/24/2015	Dashnaw Corrine, Dashnaw David Allen Sr.	CV-2010-0001787-OC	Jason D. Walker
253	1	2010-03-24	Closed 07/17/2012	Clarke Lauri, Clarke Nathan W.	CV-2010-0001779-OC	Jason D. Walker
253	1	2010-03-02	Closed 01/19/2012	Jenkins Jane Doe, Jenkins Kendal Ray, Jerry Bergeman & Sons	CV-2010-0001313-OC	Colin W. Luke
253	1	2010-02-03	Closed 02/20/2015	Hill Amanda Marie, Hill John Doe	CV-2010-0000686-OC	Stephen J. Clark
253	1	2010-01-25	Closed 04/11/2011	Larsen Dale, Larsen Linda	CV-2010-0000484-OC	Stephen J. Clark
253	1	2010-01-12	Closed 12/17/2014	Ramirez Jane Doe, Ramirez Michael Joseph	CV-2010-0000174-OC	Michelle R. Mallard
253	1	2009-12-29	Closed 08/10/2011	Taylor Tosha, Taylor Travis	CV-2009-0007582-OC	Colin W. Luke
253	1	2009-12-21	Closed 02/01/2013	Barrett Brent, Barrett Jane Doe	CV-2009-0007469-OC	Michelle R. Mallard
253	1	2009-12-01	Inactive 11/29/2011	Dixon Jeanie, Rish Ronald	CV-2009-0007043-OC	Colin W. Luke
253	1	2009-11-04	Closed 04/06/2011	Christensen John Doe, Morgan Camile E.	CV-2009-0006463-OC	Jason D. Walker
253	1	2009-10-19	Closed 05/03/2010	Walker Lonnie, Walker Nancy	CV-2009-0006183-OC	Colin W. Luke
253	1	2009-09-23	Closed 08/25/2014	Brown Burlajean B, Doe John	CV-2009-0005631-OC	Michelle R. Mallard
253	1	2009-09-22	Closed 04/11/2011	Metcalf Amy, Metcalf Matthew C	CV-2009-0005611-OC	Michelle R. Mallard
253	1	2009-08-20	Closed 12/11/2012	Cartier Jane Doe, Cartier Todd	CV-2009-0004929-OC	Steven A. Gardner
253	1	2009-08-11	Closed 04/17/2017	Nieves John Doe, Nieves Melissa A	CV-2009-0004728-OC	Jason D. Walker
253	1	2009-06-18	Closed 06/02/2010	Brown Blake, Brown Lisa M.	CV-2009-0003646-OC	L. Mark Riddoch
253	1	2009-05-29	Closed 07/19/2011	Hosac Gregg Leslie Jr., Hosac Jane Doe	CV-2009-0003222-OC	Stephen J. Clark
253	1	2009-05-26	Closed pending clerk action 12/28/2009	Westfall John Doe, Westfall Kimberly	CV-2009-0003178-OC	Stephen J. Clark
253	1	2009-05-20	Closed 08/19/2010	Coffman Derek, Coffman Stella Dawn	CV-2009-0003058-OC	L. Mark Riddoch
253	1	2009-05-13	Closed 04/07/2011	Karford Cyndi Marie, Karford John Doe	CV-2009-0002894-OC	L. Mark Riddoch
253	1	2009-05-12	Closed 11/07/2012	Thurnwald Amber N., Thurnwald John Doe	CV-2009-0002852-OC	L. Mark Riddoch
253	1	2009-04-24	Closed 02/25/2010	Seward Kimberly Jo, Smith John Doe	CV-2009-0002536-OC	Dane H Watkins Jr
253	1	2009-04-21	Closed pending clerk action 07/30/2014	Welch Grant, Welch Heather Lynn	CV-2009-0002444-OC	Michelle R. Mallard
253	1	2009-04-16	Closed 10/19/2011	Whitfield John Doe, Whitfield Michelle M.	CV-2009-0002300-OC	Stephen J. Clark
253	1	2009-04-08	Pending 06/03/2016	Doe John, Eckley Tiffany Rose	CV-2009-0002169-OC	Stephen J. Clark
253	1	2009-03-23	Closed 04/04/2014	Smith Barbara Lynn, Smith John Doe	CV-2009-0001839-OC	Jason D. Walker
253	1	2009-03-06	Closed 05/31/2012	Fitch Jason Spencer, Fitch Michelle Kay	CV-2009-0001491-OC	Colin W. Luke
253	1	2009-02-10	Closed 10/20/2011	Bird Russell L, Bird Tammy L.	CV-2009-0000887-OC	Stephen J. Clark
253	1	2009-01-29	Closed 01/27/2011	Watts Brian, Watts Kristle Jo	CV-2009-0000647-OC	Stephen J. Clark
253	1	2009-01-22	Closed pending clerk action 09/25/2009	Waggoner Alyssa, Waggoner Steve N	CV-2009-0000517-OC	Stephen J. Clark
253	1	2008-12-19	Closed 05/21/2009	Doe Jane, Salgado-Nava Andy	CV-2008-0007865-OC	Earl Blower
253	1	2008-12-19	Closed 09/01/2009	Johnson John Doe, Johnson Myrrian	CV-2008-0007859-OC	Michelle R. Mallard
253	1	2008-12-08	Closed pending clerk action 10/19/2009	Pierson Jane Doe, Pierson Ryan	CV-2008-0007592-OC	Stephen J. Clark
253	1	2008-12-02	Closed 01/13/2012	Smith John Doe, Smith Tracie	CV-2008-0007520-OC	Stephen J. Clark
253	1	2008-11-07	Closed 03/18/2010	Vazquez Deborah Lee, Vazquez Lues	CV-2008-0006996-OC	L. Mark Riddoch
253	1	2008-10-24	Inactive 01/29/2010	Lewis Jeremiah, Lewis Mary	CV-2008-0006676-OC	Earl Blower
253	1	2008-10-21	Closed 07/23/2009	Sorenson Kelly Wells, Sorenson Tony	CV-2008-0006482-OC	Stephen J. Clark
253	1	2008-10-09	Closed 08/20/2009	Barrow Jonathan, Barrow Natalie	CV-2008-0006277-OC	Earl Blower
253	1	2008-10-07	Closed 08/19/2015	Johnson Aimee Nicole, Johnson John Doe	CV-2008-0006232-OC	Michelle R. Mallard
253	1	2008-10-06	Inactive 01/26/2010	Harrison John Doe, Harrison Serena	CV-2008-0006174-OC	Penny Stanford
253	1	2008-09-25	Closed 05/03/2012	Archibald Eileen, Archibald John Doe	CV-2008-0005948-OC	L. Mark Riddoch
253	1	2008-09-15	Closed 03/04/2011	Jane Doe, Morrison Chris	CV-2008-0005653-OC	Michelle R. Mallard
253	1	2008-09-08	Closed 10/06/2010	Bartholomae Jenny Marie, Bartholomae John Doe	CV-2008-0005523-OC	Michelle R. Mallard
253	1	2008-07-25	Closed 06/22/2010	Rardin Lynn, Rardin Steven Burton	CV-2008-0004523-OC	L. Mark Riddoch
253	1	2008-07-25	Closed 04/11/2011	Weaver Jeff, Weaver Shannon	CV-2008-0004521-OC	Michelle R. Mallard
253	1	2008-07-21	Closed 06/10/2009	Rhodes Lisa, Rhodes Tom	CV-2008-0004394-OC	Stephen J. Clark
253	1	2008-07-21	Closed 07/24/2012	Reid Allen, Reid Carrie	CV-2008-0004389-OC	Earl Blower
253	1	2008-07-16	Closed 05/12/2010	Doe John, Yorgensen Julie D.	CV-2008-0004215-OC	L. Mark Riddoch
253	1	2008-06-23	Closed 06/04/2009	Gilbert Gwen L	CV-2008-0003743-OC	Earl Blower
253	1	2008-05-19	Closed 07/29/2010	Baker James, Baker Reatha F	CV-2008-0002906-OC	Earl Blower
253	1	2008-04-24	Closed 10/18/2012	Olson Dalena D., Olson Michael Jay	CV-2008-0002357-OC	Michelle R. Mallard
253	1	2008-04-14	Closed 01/27/2011	John Doe, White Christine N	CV-2008-0002143-OC	L. Mark Riddoch
253	1	2008-03-24	Closed 03/25/2013	Clegg Ashlee Marie, Lovelace Steve	CV-2008-0001727-OC	Michelle R. Mallard
253	1	2008-03-24	Closed 01/26/2012	Hanes Celeste, John Doe	CV-2008-0001723-OC	Stephen J. Clark
253	1	2007-11-30	Closed 12/12/2012	Curtis Laurie Lynn, Curtis Michael David	CV-2007-0006682-OC	Stephen J. Clark
253	1	2007-10-26	Closed 12/19/2011	Moldenhauer Benjamin D., Moldenhauer Jane Doe	CV-2007-0006052-OC	Steven A. Gardner
253	1	2007-10-22	Closed 09/26/2012	Cole John Anthony	CV-2007-0005905-OC	L. Mark Riddoch
253	1	2007-10-15	Closed pending clerk action 02/07/2017	Bell Bradley, Jane Doe	CV-2007-0005768-OC	Michelle R. Mallard
253	1	2007-08-02	Closed 07/01/2011	Jane Doe, Pace Larry L	CV-2007-0004368-OC	L. Mark Riddoch
253	1	2007-07-09	Closed 12/02/2009	Hawkinson Jason Torry, Jane Doe	CV-2007-0003867-OC	Jason D. Walker
253	1	2007-06-29	Closed 12/20/2011	Blair Marty, Blair Robert	CV-2007-0003726-OC	Jason D. Walker
253	1	2007-06-06	Closed pending clerk action 03/21/2017	Robinson Jane Doe, Robinson Joseph F.	CV-2007-0003236-OC	Michelle R. Mallard
253	1	2007-04-23	Closed 12/21/2010	Wolfe Adam, Wolfe Sadie	CV-2007-0002366-OC	Michelle R. Mallard
253	1	2007-03-30	Closed 06/02/2010	Kelso Curtis, Kelso Pauline	CV-2007-0001933-OC	Stephen J. Clark
253	1	2007-03-13	Closed 10/25/2012	Herrera Julie A., Herrera Larry G.	CV-2007-0001465-OC	Earl Blower
253	1	2006-12-29	Closed 09/08/2016	Eckley Tiffany Rose	CV-2006-0007333-OC	Jason D. Walker
253	1	2006-08-30	Inactive 08/17/2017	Gilson Jane Doe, Gilson Joshua	CV-2006-0004889-OC	Jason D. Walker
253	1	2006-07-27	Inactive 02/05/2007	Carpenter Linda, Carpenter Ted Leroy	CV-2006-0004188-OC	Ralph L. Savage
253	1	2006-07-10	Closed 10/07/2009	Colby Gennie M., Colby Richard	CV-2006-0003791-OC	Michelle R. Mallard
253	1	2006-06-15	Closed pending clerk action 04/18/2008	Mills Brian, Mills Carrie	CV-2006-0003348-OC	Ralph L. Savage
253	1	2006-06-15	Closed 05/05/2010	Jenkins Kendal Lamont, Jenkins Shawna, Jerry Bergman & Sons	CV-2006-0003346-OC	Earl Blower
253	1	2006-06-07	Closed 07/25/2011	Christenot Tim	CV-2006-0003126-OC	Michelle R. Mallard
253	1	2006-04-07	Closed 06/25/2007	Colvin Joshua, Doe Jane	CV-2006-0001961-OC	Penny Stanford
253	1	2006-01-16	Closed 05/26/2009	Loftus Brandy, Loftus John Doe	CV-2006-0000288-OC	Penny Stanford
253	1	2005-04-13	Closed 12/19/2014	Cortez Pamela Iris, Griffin L.J.	CV-2005-0002069-OC	Jason D. Walker
253	1	2004-08-10	Closed 07/22/2009	Doe Jane, Thompson Mike L	CV-2004-0004754-OC	Colin W. Luke
253	1	2004-05-11	Closed 07/13/2004	Fox Tanya J., Fox Ted E.	CV-2004-0002678-OC	Ralph L. Savage
251	2	2005-12-12	Closed pending clerk action 03/22/2007	A+Concrete Construction, Bonneville Billing & Collections INC., Harris Brian, Mcdowell George Stacy, Mcdowell Melissa, Outdoors Unlimited Inc, White Bob	CV-2005-0012696-C	Renae J. Hoff
251	2	2003-03-14	Closed pending clerk action 05/23/2003	Cox Amber Lynn	CV-2003-0002189-C	A. Lynne Krogh
259	1	2014-02-03	\N	McStay, Michele H Mcstay, Bruce G	CV-2014-0000092	\N
263	1	2006-02-17	\N	Chandler Steven & Marsha	CV-2006-0000022	\N
53	1	2014-02-10	\N	Doe, Jane Robbins, Kenneth	CV-2014-0000134	\N
53	1	2013-02-25	\N	Doe, John Pace, Carol	CV-2013-0000181	\N
53	1	2013-02-25	\N	King, Angie King, Kollin C	CV-2013-0000180	\N
53	1	2012-07-25	\N	Clark, Christopher Clark, Stephanie	CV-2012-0000723	\N
111	1	2014-04-04	\N	Doe, Jane Mangan, Martin A	CV-2014-0000277	\N
111	1	2003-12-12	\N	Andrew, Mike Jane Doe	CV-2013-0001039	\N
111	1	2013-03-11	\N	Linares, Brittany Jo Linares, Jacinto J	CV-2013-0000033	\N
111	1	2010-10-18	\N	James, Jodi Dee	CV-2010-0001065	\N
111	1	2010-06-01	\N	Williams, Wendy Williams, Wes E	CV-2010-0000522	\N
111	1	2010-03-13	\N	Coles, Holly M Coles, Jeffrey Lloyd	CV-2010-0000239	\N
111	1	2008-12-06	\N	John, Doe Thompson, Sheri	CV-2008-0001025	\N
111	1	2007-05-09	\N	Estrada, Jaime A Estrade, Maria D	CV-2007-0000381	\N
111	1	2007-04-11	\N	Gonzalez, Juatigui Gonzalez, Reyna	CV-2007-0000294	\N
111	1	2007-04-12	\N	Gonzalez, Juatigui Gonzalez, Reyna	CV-2007-0000295	\N
111	1	2007-02-27	\N	Patterson, Brenda Jolyn Patterson, Shane Brian	CV-2007-0000181	\N
111	1	2006-07-20	\N	Carter, Jane Doe Carter, Jeffrey Dean	CV-2006-0000581	\N
111	1	2006-01-04	\N	Burns, Brent Bary Burns, Deana	CV-2006-0000006	\N
161	1	2013-10-17	\N	Jane Doe, Justesen, Roger	CV-2013-0000709	\N
161	1	2013-08-30	\N	Bryd, Douglas Byrd, Wendi	CV-2013-0000577	\N
161	1	2013-08-30	\N	Wilburn, Jason	CV-2013-0000576	\N
161	1	2012-12-13	\N	Jane Doe, Jones, Brenden	CV-2012-0000903	\N
161	1	2012-12-06	\N	Stark, James E Stark, Kelly	CV-2012-0000848	\N
161	1	2011-08-11	\N	Bell, Nicole Bell, Travis	CV-2011-0000610	\N
161	1	2011-05-03	\N	Bradley, Cody J Bradely, Krista	CV-2011-0000324	\N
161	1	2010-04-19	\N	Andra, Katie Andra, Travis	Cv-2010-0000304	\N
161	1	2010-04-13	\N	Callier, Josh Callier, Mistie	CV-2010-0000280	\N
161	1	2010-01-08	\N	Brockman, Casey J Brockman, Sharon	CV-2010-0000013	\N
161	1	2009-12-08	\N	Jane Doe, Luekenga, Antone	CV-2009-0000921	\N
161	1	2009-11-05	\N	Wheeless, Bellia Wheeless, Wesley A	CV-2009-0000828	\N
161	1	2009-04-09	\N	John Doe, Kelly, Adrianna R	CV-2009-0000279	\N
161	1	2008-03-31	\N	John Doe, Knetzger, Heather N	CV-2008-0000255	\N
161	1	2008-04-28	\N	Garcia, Anthony Garcia, carol A	CV-2008-0000024	\N
161	1	2008-04-29	\N	Garcia, Anthony Garcia, carol A	CV-2008-0000025	\N
161	1	2008-04-30	\N	Garcia, Anthony Garcia, carol A	CV-2008-0000026	\N
161	1	2007-11-13	\N	Price, David Price, Teri	CV-2007-00000884	\N
161	1	2007-10-18	\N	John Doe, Nelson, Brittany	CV-2007-00000821	\N
161	1	2007-06-06	\N	John Doe, Russon, Lisa	CV-2007-00000485	\N
161	1	2007-06-07	\N	John Doe, Russon, Lisa	CV-2007-00000486	\N
161	1	2007-06-08	\N	John Doe, Russon, Lisa	CV-2007-00000487	\N
161	1	2007-04-02	\N	Jane Doe, Keele, Trent R	CV-2007-00000295	\N
161	1	2007-03-20	\N	John Doe, Pence, Amy N	CV-2007-00000260	\N
161	1	2007-03-21	\N	John Doe, Pence, Amy N	CV-2007-00000261	\N
161	1	2005-09-13	\N	John Doe, Zufelt, Stephanie, D	CV-2005-00000658	\N
169	1	2014-02-10	\N	Abrams, Kristy L Doe, John	CV-2014-0000095	\N
169	1	2013-03-20	\N	Oliver, Derek Oliver, Penny Jeanne	CV-2013-0000250	\N
169	1	2013-01-23	\N	Hansen, Ann Hansen, Roger	CV-2013-0000067	\N
85	2	2013-06-27	Inactive 07/01/2014	Daniels Brittney A.	CV-2013-0000297	Gilman J. Gardner
111	2	2014-05-08	Pending 11/18/2014	Covington Wende Ardell	CV-2014-0000374	Robert L. Crowley Jr.
111	2	2011-05-02	Inactive 04/12/2012	Henderson Scotty Glenn	CV-2011-0000412	Robert L. Crowley Jr.
161	2	2013-12-23	Inactive 09/09/2015	Hill Brad, Hill Shalayne	CV-2013-0000877	Mark S. Rammell
161	2	2013-02-07	Inactive 02/20/2015	Nedrow Jason D	CV-2013-0000078	Mark S. Rammell
\.


--
-- Data for Name: county; Type: TABLE DATA; Schema: public; Owner: Mehrotra
--

COPY county (id, name) FROM stdin;
51	Caribou
53	Cassia
59	Clark
69	Clearwater
71	Custer
73	Elmore
83	Franklin
85	Fremont
89	Gem
105	Gooding
109	Idaho
111	Jefferson
115	Jerome
117	Kootenai
123	Latah
125	Lemhi
127	Lewis
129	Lincoln
161	Madison
169	Minidoka
177	Nez+Perce
179	Oneida
205	Owyhee
207	Payette
209	Power
217	Shoshone
219	Teton
221	Valley
239	Washington
251	Canyon
252	Bingham
253	Bonneville
254	Bannock
256	Adams
257	BearLake
258	Benewah
259	Blaine
260	Boise
261	Bonner
262	Boundary
263	Butte
264	Camas
265	Bear+Lake
\.


--
-- Name: county_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mehrotra
--

SELECT pg_catalog.setval('county_id_seq', 356, true);


--
-- Data for Name: judgements; Type: TABLE DATA; Schema: public; Owner: Mehrotra
--

COPY judgements (id, case_number, judgement_amount, judgement_type, judgement_date) FROM stdin;
210	CV-2016-0002464-OC	0.00	Money Judgment-Default	2016-09-07
211	CV-2016-0001456-OC	2404.83	Money Judgment-Default	2016-07-22
212	CV-2016-0000769-OC	0.00	Money Judgment-Default	2016-04-26
213	CV-2016-0000601-OC	0.00	Money Judgment-Default	2016-04-12
214	CV-2015-0003701-OC	0.00	Money Judgment-Default	2015-12-22
215	CV-2015-0003107-OC	0.00	Money Judgment-Default	2015-12-01
216	CV-2015-0002546-OC	0.00	Money Judgment-Default	2015-10-06
217	CV-2015-0002160-OC	0.00	Money Judgment-Default	2015-09-22
218	CV-2015-0001070-OC	1333.70	Money Judgment-Default	2015-05-22
219	CV-2015-0000987-OC	38828.78	Money Judgment-Default	2015-05-19
220	CV-2015-0000412-OC	1389.15	Money Judgment-Default	2015-03-30
221	CV-2014-0004864-OC	4597.60	Money Judgment	2017-05-26
222	CV-2014-0004515-OC	0.00	Money Judgment-Default	2015-04-10
223	CV-2014-0001722-OC	0.00	Money Judgment-Default	2014-07-02
224	CV-2014-0001248-OC	534.86	Money Judgment	2016-12-20
225	CV-2014-0001129-OC	0.00	Money Judgment-Default	2014-04-30
226	CV-2013-0004755-OC	8689.15	Money Judgment	2016-12-02
227	CV-2013-0004196-OC	499.43	Money Judgment	2016-06-09
228	CV-2013-0003798-OC	0.00	Money Judgment	2016-04-27
229	CV-2013-0001469-OC	1595.04	Money Judgment	2016-07-12
230	CV-2012-0004252-OC	723.40	Money Judgment-Default	2012-11-30
231	CV-2012-0004021-OC	2083.70	Money Judgment-Default	2012-11-08
232	CV-2012-0003180-OC	1350.56	Money Judgment-Default	2012-09-13
233	CV-2012-0002384-OC	4130.40	Money Judgment-Default	2012-09-20
234	CV-2012-0001209-OC	1188.47	Money Judgment-Default	2012-05-02
235	CV-2012-0000747-OC	1200.70	Money Judgment-Default	2012-04-11
236	CV-2012-0000408-OC	853.02	Money Judgment-Default	2017-02-10
237	CV-2011-0005533-OC	749.70	Money Judgment-Default	2012-02-09
238	CV-2011-0004911-OC	981.82	Money Judgment-Default	2012-01-06
239	CV-2011-0003472-OC	724.37	Money Judgment	2012-02-09
240	CV-2011-0003465-OC	833.91	Money Judgment-Default	2011-10-18
241	CV-2011-0003323-OC	1288.44	Money Judgment-Default	2011-10-05
242	CV-2011-0002966-OC	858.34	Money Judgment	2014-01-22
243	CV-2011-0002871-OC	532.00	Money Judgment	2012-12-13
244	CV-2011-0002819-OC	1383.85	Money Judgment-Default	2011-09-15
245	CV-2011-0002374-OC	1597.24	Money Judgment-Default	2011-08-01
246	CV-2011-0002320-OC	540.00	Money Judgment	2015-09-24
247	CV-2011-0001910-OC	1375.71	Money Judgment-Default	2011-06-27
248	CV-2011-0000225-OC	2005.46	Money Judgment-Default	2011-03-18
249	CV-2010-0003812-OC	1431.85	Money Judgment	2015-12-10
250	CV-2010-0003811-OC	6316.58	Money Judgment	2013-02-20
251	CV-2010-0003427-OC	2927.25	Money Judgment	2015-09-24
252	CV-2010-0003133-OC	2661.35	Money Judgment-Default	2010-10-15
253	CV-2010-0001408-OC	555.40	Money Judgment-Default	2010-06-16
254	CV-2010-0000837-OC	1138.28	Money Judgment-Default	2010-04-20
255	CV-2010-0000767-OC	2263.57	Money Judgment	2015-04-03
256	CV-2010-0000482-OC	1529.90	Money Judgment-Default	2010-04-05
257	CV-2009-0003428-OC	0.00	Money Judgment-Default	2010-02-12
258	CV-2009-0002517-OC	1493.54	Money Judgment	2014-08-20
259	CV-2009-0002074-OC	1179.43	Default Judgment	2009-07-15
260	CV-2009-0001076-OC	543.22	Money Judgment-Default	2009-04-29
261	CV-2008-0004674-OC	1816.46	Money Judgment-Default	2009-10-28
262	CV-2008-0003859-OC	2443.20	Money Judgment	2011-03-24
263	CV-2008-0003809-OC	2357.10	Money Judgment-Default	2008-10-31
264	CV-2008-0003191-OC	512.50	Money Judgment	2009-07-20
265	CV-2008-0002942-OC	6814.01	Money Judgment-Default	2008-09-09
266	CV-2008-0002939-OC	1695.16	Default Judgment	2008-09-23
267	CV-2008-0002938-OC	288.53	Default Judgment	2008-09-09
268	CV-2007-0004797-OC	1080.64	Money Judgment-Default	2007-12-31
269	CV-2007-0004453-OC	2716.63	Money Judgment	2017-08-11
270	CV-2007-0004301-OC	150.00	Other:	2008-08-11
271	CV-2007-0004039-OC	987.05	Money Judgment-Default	2007-11-09
272	CV-2007-0002171-OC	1917.49	Default Judgment	2007-07-05
273	CV-2006-0004975-OC	804.97	Money Judgment-Default	2007-01-16
274	CV-2006-0002383-OC	504.45	Money Judgment-Default	2006-07-27
275	CV-2006-0002382-OC	598.50	Money Judgment	2008-07-07
276	CV-2015-0001081	1098.49	Money Jdgmt Default	2015-09-09
277	CV-2015-0001037	3534.19	Money Jdgmt Default	2015-08-19
278	CV-2015-0000587	1592.08	Default Judgment	2015-05-27
279	CV-2014-0001875	2945.78	Money Jdgmt Default	2014-11-20
280	CV-2014-0001828	3439.87	Money Jdgmt Default	2014-11-24
281	CV-2013-0001820	1002.77	Money Jdgmt Default	2013-11-12
282	CV-2012-0002228	0.00	Inactivity Dismissal	2017-03-08
283	CV-2015-0000672	3519.93	Default Judgment	2015-09-22
284	CV-2012-0000599	36215.66	Default Judgment	2013-01-22
285	CV-2016-0000297	2410.84	Default Judgment	2016-07-19
286	CV-2016-0000175	0.00	Default Judgment	2016-05-27
287	CV-2015-0000424	0.00	Default Judgment	2015-11-16
288	CV-2014-0000600	1178.75	Money Judgment	2016-04-04
289	CV-2014-0000636	10507.65	Default Judgment	2014-10-27
290	CV-2014-0000276	869.00	Default Judgment	2014-07-10
291	CV-2014-0000059	845.22	Default Judgment	2014-04-16
292	CV-2013-0000705	1725.43	Default Judgment	2013-10-25
293	CV-2013-0000653	10537.88	Default Judgment	2013-09-23
294	CV-2013-0000615	3342.86	Default Judgment	2013-10-01
295	CV-2013-0000272	0.00	Default Judgment	2013-06-20
296	CV-2013-0000239	720.94	Default Judgment	2013-04-24
297	CV-2013-0000233	3068.94	Default Judgment	2013-04-29
298	CV-2013-0000123	6875.20	Default Judgment	2013-04-05
299	CV-2012-0001026	7087.67	Default Judgment	2013-01-22
300	CV-2012-0000967	0.00	Default Judgment	2013-01-22
301	CV-2012-0000879	887.51	Default Judgment	2012-12-14
302	CV-2012-0000875	1092.65	Default Judgment	2012-12-11
303	CV-2012-0000713	2432.49	Default Judgment	2012-10-25
304	CV-2012-0000664	1319.51	Other	2017-08-01
305	CV-2012-0000619	776.60	Default Judgment	2012-11-20
306	CV-2012-0000603	0.00	Default Judgment	2013-02-13
307	CV-2012-0000166	801.91	Money Judgment	2016-09-29
308	CV-2010-0001301	546.00	Money Judgment	2017-04-12
309	CV-2010-0001277	300.00	Money Judgment	2014-08-05
310	CV-2010-0000845	6885.42	Money Judgment	2015-09-29
311	CV-2010-0000703	974.89	Money Judgment	2013-03-07
312	CV-2010-0000613	0.00	Default Judgment	2010-08-31
313	CV-2010-0000238	2574.19	Other	2017-06-01
314	CV-2009-0001047	3589.18	Money Judgment	2013-01-03
315	CV-2009-0000234	5276.68	Default Judgment	2009-05-01
316	CV-2009-0000151	855.00	Money Judgment	2014-09-19
317	CV-2008-0001058	635.30	Default Judgment	2009-04-09
318	CV-2008-0001024	642.00	Other	2015-09-15
319	CV-2008-0000963	479.50	Default Judgment	2009-09-16
320	CV-2008-0000892	500.00	Money Judgment	2013-12-04
321	CV-2008-0000836	656.91	Default Judgment	2008-12-05
322	CV-2008-0000831	2876.77	Default Judgment	2008-12-03
323	CV-2008-0000738	866.74	Default Judgment	2008-10-30
324	CV-2008-0000367	3941.75	Other	2013-03-25
325	CV-2007-0000293	560.81	Money Judgment	2016-11-21
326	CV-2007-0000152	4860.21	Default Judgment	2007-04-16
327	CV-2007-0000026	505.50	Other:	2008-02-26
328	CV-2006-0000984	5695.40	Default Judgment	2007-01-23
329	CV-2006-0000963	1766.38	Money Judgment	2016-10-13
330	CV-2014-0000110	1107.83	Money Judgmt Default	2014-04-09
331	CV-2013-0000450	1711.02	Money Judgmt Default	2014-02-26
332	CV-2012-0000550	3189.80	Money Judgment	2015-07-13
333	CV-2016-0000027	1703.32	Default	2016-04-12
334	CV-2014-0000215	2003.60	Default	2014-10-27
335	CV-2014-0000084	1866.37	Default	2014-06-04
336	CV-2014-0002795-OC	591.57	Money Judgment	2016-01-08
337	CV-2016-0001209	5626.39	Money Jdgmt Default	2016-09-08
338	CV-2016-0000992	2707.96	Money Jdgmt Default	2016-09-14
339	CV-2012-0002547	20308.14	Money Jdgmt Default	2013-03-05
340	CV-2014-0000263	709.20	Default Judgment	2014-04-23
341	CV-2014-0003144	1368.11	Money Jdgmt Default	2014-06-09
342	CV-2014-0000818	1288.49	Money Judgmt Default	2015-04-01
343	CV-2008-0000183	23652.97	Default Judgment	2008-10-16
344	CV-2008-0000183	23652.97	Default Judgment	2008-10-16
345	CV-2008-0000183	23652.97	Default Judgment	2008-10-16
346	CV-2016-0003472-OC	3284.89	Default Judgment	2016-08-17
347	CV-2016-0002920-OC	1713.15	Default Judgment	2016-08-01
348	CV-2016-0002301-OC	2010.47	Default Judgment	2016-07-05
349	CV-2016-0001141-OC	1693.72	Default Judgment	2016-05-02
350	CV-2015-0005659-OC	3019.96	Default Judgment	2015-12-18
351	CV-2015-0005293-OC	8425.13	Default Judgment	2015-12-22
352	CV-2015-0005294-OC	11124.34	Default Judgment	2015-12-01
353	CV-2015-0004793-OC	1389.40	Default Judgment	2015-11-13
354	CV-2015-0004619-OC	3802.13	Default Judgment	2015-10-29
355	CV-2015-0004463-OC	1115.91	Default Judgment	2015-11-03
356	CV-2015-0004201-OC	1465.11	Default Judgment	2015-11-13
357	CV-2015-0003556-OC	14540.40	Money Jdgmt Default	2015-09-24
358	CV-2015-0003472-OC	1001.00	Default Judgment	2015-09-24
359	CV-2015-0003256-OC	7294.21	Default Judgment	2015-08-20
360	CV-2015-0002573-OC	943.12	Default Judgment	2015-07-27
361	CV-2015-0002498-OC	2903.93	Default Judgment	2015-07-20
362	CV-2015-0002314-OC	2276.09	Money Judgment	2015-08-17
363	CV-2015-0002119-OC	2212.08	Default Judgment	2015-07-07
364	CV-2015-0002091-OC	1272.16	Default Judgment	2015-07-03
365	CV-2015-0002063-OC	4206.58	Default Judgment	2015-06-08
366	CV-2015-0001925-OC	2474.35	Money Jdgmt Default	2015-06-12
367	CV-2015-0001808-OC	2139.39	Money Jdgmt Default	2015-06-11
368	CV-2015-0001642-OC	1862.74	Default Judgment	2015-05-19
369	CV-2015-0001597-OC	4593.81	Default Judgment	2015-06-02
370	CV-2015-0000614-OC	2379.84	Default Judgment	2015-04-08
371	CV-2014-0006857-OC	3766.00	Default Judgment	2015-03-06
372	CV-2014-0006856-OC	1458.62	Default Judgment	2015-03-11
373	CV-2014-0006816-OC	13565.32	Default Judgment	2015-03-06
374	CV-2014-0006179-OC	1606.28	Default Judgment	2015-03-19
375	CV-2014-0006085-OC	1194.17	Default Judgment	2014-12-23
376	CV-2014-0005765-OC	3317.19	Default Judgment	2014-12-22
377	CV-2014-0005451-OC	5119.27	Default Judgment	2014-12-12
378	CV-2014-0005372-OC	4242.54	Default Judgment	2014-12-15
379	CV-2014-0004592-OC	619.12	Money Jdgmt Default	2014-10-09
380	CV-2014-0002614-OC	696.88	Default Judgment	2014-06-25
381	CV-2014-0001515-OC	3581.83	Default Judgment	2014-04-25
382	CV-2014-0001359-OC	911.70	Default Judgment	2014-05-16
383	CV-2014-0000613-OC	3521.61	Default Judgment	2014-03-27
384	CV-2013-0006681-OC	5671.76	Money Judgment	2016-08-30
385	CV-2013-0006369-OC	3329.55	Money Judgment	2016-07-26
386	CV-2013-0006155-OC	6919.20	Money Jdgmt Default	2014-01-22
387	CV-2013-0006041-OC	5563.76	Money Jdgmt Default	2014-01-27
388	CV-2013-0005994-OC	2388.87	Money Judgment	2016-07-26
389	CV-2013-0005959-OC	644.21	Default Judgment	2014-03-06
390	CV-2013-0005277-OC	4459.43	Money Judgment	2016-06-14
391	CV-2013-0004578-OC	2621.04	Default Judgment	2013-10-18
392	CV-2013-0003303-OC	3892.40	Default Judgment	2013-09-05
393	CV-2013-0003192-OC	3757.21	Money Jdgmt Default	2013-07-29
394	CV-2013-0002901-OC	1708.15	Default Judgment	2013-07-29
395	CV-2013-0001690-OC	2861.09	Default Judgment	2013-07-16
396	CV-2013-0000950-OC	2963.72	Money Judgment	2016-07-11
397	CV-2012-0006005-OC	816.22	Money Jdgmt Default	2012-12-07
398	CV-2012-0005409-OC	1449.84	Money Jdgmt Default	2012-11-30
399	CV-2012-0003329-OC	1615.43	Default Judgment	2012-08-09
400	CV-2012-0002242-OC	2979.90	Money Judgment	2016-06-14
401	CV-2011-0006751-OC	4877.25	Default Judgment	2011-12-30
402	CV-2011-0006548-OC	2498.25	Money Jdgmt Default	2011-12-15
403	CV-2011-0005102-OC	1432.79	Default Judgment	2011-10-28
404	CV-2011-0001941-OC	901.93	Money Judgment	2014-05-22
405	CV-2011-0000984-OC	921.78	Default Judgment	2011-04-01
406	CV-2011-0000709-OC	2716.19	Default Judgment	2011-08-25
407	CV-2010-0007011-OC	1864.23	Default Judgment	2011-01-21
408	CV-2010-0006839-OC	5821.77	Default Judgment	2010-12-30
409	CV-2010-0006109-OC	3490.25	Money Jdgmt Default	2010-11-29
410	CV-2010-0006105-OC	3827.83	Money Jdgmt Default	2010-11-29
411	CV-2010-0005619-OC	716.00	Money Judgment	2011-12-08
412	CV-2010-0005615-OC	1306.19	Default Judgment	2011-03-02
413	CV-2010-0004722-OC	250.00	Money Judgment	2012-08-14
414	CV-2010-0004449-OC	2383.03	Default Judgment	2010-10-15
415	CV-2010-0004265-OC	317.55	Default Judgment	2010-09-01
416	CV-2010-0004245-OC	1927.78	Money Jdgmt Default	2010-10-14
417	CV-2010-0004046-OC	3158.37	Default Judgment	2010-08-24
418	CV-2010-0003975-OC	1647.67	Default Judgment	2010-10-13
419	CV-2010-0003523-OC	1642.26	Default Judgment	2010-10-01
420	CV-2010-0002524-OC	1137.32	Default Judgment	2010-06-21
421	CV-2010-0002172-OC	5265.91	Default Judgment	2010-06-09
422	CV-2010-0001926-OC	1764.71	Money Judgment	2015-07-22
423	CV-2010-0001787-OC	1085.07	Money Judgment	2015-02-24
424	CV-2010-0001779-OC	2095.47	Money Judgment	2017-04-03
425	CV-2010-0001313-OC	1611.93	Money Judgment	2011-09-07
426	CV-2010-0000686-OC	1538.76	Default Judgment	2010-03-19
427	CV-2010-0000484-OC	604.06	Default Judgment	2010-03-15
428	CV-2010-0000174-OC	3346.90	Money Jdgmt Default	2014-12-17
429	CV-2009-0007582-OC	3906.88	Default Judgment	2010-02-19
430	CV-2009-0007469-OC	3876.61	Money Judgment	2013-02-01
431	CV-2009-0007043-OC	1797.30	Default Judgment	2010-09-28
432	CV-2009-0006463-OC	1552.20	Money Judgment	2016-11-10
433	CV-2009-0006183-OC	1154.17	Default Judgment	2009-12-02
434	CV-2009-0005631-OC	2354.43	Money Judgment	2014-08-25
435	CV-2009-0005611-OC	485.00	Money Judgment	2011-04-11
436	CV-2009-0004929-OC	1688.13	Money Judgment	2012-12-11
437	CV-2009-0004728-OC	8437.60	Default Judgment	2009-09-25
438	CV-2009-0003646-OC	1101.59	Money Jdgmt Default	2009-08-05
439	CV-2009-0003222-OC	2529.29	Default Judgment	2011-07-19
440	CV-2009-0003178-OC	1157.95	Money Judgment	2011-06-22
441	CV-2009-0003058-OC	2708.62	Money Jdgmt Default	2009-06-29
442	CV-2009-0002894-OC	2149.06	Money Jdgmt Default	2009-06-25
443	CV-2009-0002852-OC	2817.27	Money Jdgmt Default	2009-07-02
444	CV-2009-0002536-OC	24205.11	Default Judgment-Pla	2009-06-12
445	CV-2009-0002444-OC	4206.38	Money Judgment	2014-08-04
446	CV-2009-0002300-OC	1521.31	Default Judgment	2009-06-15
447	CV-2009-0002169-OC	1168.40	Default Judgment	2009-06-03
448	CV-2009-0001839-OC	2215.92	Money Judgment	2014-04-04
449	CV-2009-0001491-OC	5603.51	Default Judgment	2009-04-21
450	CV-2009-0000887-OC	2186.64	Default Judgment	2009-04-08
451	CV-2009-0000647-OC	2664.43	Default Judgment	2009-03-25
452	CV-2009-0000517-OC	1262.22	Default Judgment	2009-03-25
453	CV-2008-0007865-OC	1306.32	Default Judgment	2009-01-28
454	CV-2008-0007859-OC	1021.07	Default Judgment	2009-02-09
455	CV-2008-0007592-OC	873.21	Default Judgment	2009-01-29
456	CV-2008-0007520-OC	664.02	Default Judgment	2009-01-29
457	CV-2008-0006996-OC	832.80	Money Jdgmt Default	2009-01-06
458	CV-2008-0006676-OC	4102.27	Default Judgment	2008-12-09
459	CV-2008-0006482-OC	844.47	Default Judgment	2008-12-22
460	CV-2008-0006277-OC	2095.32	Default Judgment	2008-12-08
461	CV-2008-0006232-OC	1805.28	Default Judgment-Pla	2008-11-26
462	CV-2008-0006174-OC	847.72	Default Judgment	2008-12-02
463	CV-2008-0005948-OC	959.00	Money Judgment	2012-05-03
464	CV-2008-0005653-OC	5067.12	Default Judgment-Pla	2008-10-24
465	CV-2008-0005523-OC	1111.44	Default Judgment-Pla	2008-10-23
466	CV-2008-0004523-OC	3776.39	Money Judgment	2010-06-22
467	CV-2008-0004521-OC	3850.46	Money Judgment	2011-04-11
468	CV-2008-0004394-OC	2929.98	Default Judgment	2008-09-29
469	CV-2008-0004389-OC	2479.56	Default Judgment	2008-09-08
470	CV-2008-0004215-OC	6177.41	Money Jdgmt Default	2008-09-17
471	CV-2008-0003743-OC	1066.37	Default Judgment-Pla	2008-08-04
472	CV-2008-0002906-OC	4373.94	Default Judgment	2008-07-15
473	CV-2008-0002357-OC	1232.50	Money Judgment	2012-10-18
474	CV-2008-0002143-OC	1250.00	Money Judgment	2011-01-27
475	CV-2008-0001727-OC	2688.84	Money Judgment	2013-03-25
476	CV-2008-0001723-OC	1961.73	Default Judgment	2008-05-13
477	CV-2007-0006682-OC	1214.32	Default Judgment	2012-12-27
478	CV-2007-0006052-OC	1000.00	Money Judgment	2011-12-19
479	CV-2007-0005905-OC	2069.18	Money Jdgmt Default	2007-12-10
480	CV-2007-0005768-OC	959.00	Default Judgment	2011-06-15
481	CV-2007-0004368-OC	4346.67	Money Judgment	2011-07-01
482	CV-2007-0003867-OC	811.00	Money Judgment	2017-04-16
483	CV-2007-0003726-OC	644.50	Money Judgment	2010-07-07
484	CV-2007-0003236-OC	1903.63	Money Judgment	2012-04-04
485	CV-2007-0002366-OC	985.50	Money Judgment	2010-08-31
486	CV-2007-0001933-OC	1878.70	Default Judgment	2010-06-02
487	CV-2007-0001465-OC	2572.58	Order	2010-06-18
488	CV-2006-0007333-OC	1303.02	Money Judgment	2016-09-29
489	CV-2006-0004889-OC	1241.12	Default Judgment	2006-10-17
490	CV-2006-0004188-OC	332.54	Money Jdgmt Default	2006-10-16
491	CV-2006-0003791-OC	645.59	Order	2009-03-06
492	CV-2006-0003348-OC	509.50	Money Judgment	2008-04-18
493	CV-2006-0003346-OC	6640.18	Default Judgment	2009-03-12
494	CV-2006-0003126-OC	479.00	Money Judgment	2008-12-03
495	CV-2006-0001961-OC	1378.13	Money Judgment	2012-06-06
496	CV-2006-0000288-OC	789.61	Default Judgment	2006-03-23
497	CV-2005-0002069-OC	2050.59	Money Judgment	2014-12-19
498	CV-2004-0004754-OC	0.00	Default Judgment-Pla	2004-09-15
499	CV-2004-0002678-OC	0.00	Money Judgment	2004-07-13
500	CV-2005-0012696-C	25784.26	Default Judgment	2006-01-24
501	CV-2003-0002189-C	0.00	SC Default Judgment	2003-05-02
502	CV-2014-0000092	3591.70	Money	2014-03-26
503	CV-2006-0000022	4555.32	X	2006-04-24
504	CV-2014-0000134	720.06	X	2014-04-04
505	CV-2013-0000181	4357.35	X	2013-04-15
506	CV-2013-0000180	1670.95	X	2013-04-15
507	CV-2013-0000181	1671.95	X	2013-04-16
508	CV-2012-0000723	1778.25	X	2012-09-06
509	CV-2014-0000276	869.00	X	2014-07-10
510	CV-2014-0000277	870.00	X	2014-07-11
511	CV-2013-0001039	16114.21	X	2014-01-28
512	CV-2013-0000272	1124.38	X	2013-06-20
513	CV-2013-0000239	720.94	X	2013-04-24
514	CV-2013-0000033	3068.94	X	2013-04-29
515	CV-2012-0000875	1092.65	X	2012-12-11
516	CV-2012-0000713	2432.49	X	2012-10-25
517	CV-2012-0000664	2805.54	X	2017-08-01
518	CV-2012-0000619	776.00	X	2012-11-20
519	CV-2012-0000166	874.28	X	2012-09-10
520	CV-2010-0001277	6858.64	X	2011-02-11
521	CV-2010-0001065	906.14	X	20110-12-14
522	CV-2010-0000845	4983.76	X	2010-12-07
523	CV-2010-0000703	3234.15	X	2010-09-14
524	CV-2010-0000522	1788.79	X	2010-07-29
525	CV-2010-0000238	2433.11	X	2010-04-23
526	CV-2010-0000239	2434.11	X	2010-04-24
527	CV-2009-0001047	2073.21	X	2010-01-06
528	CV-2009-0000234	5276.68	X	2009-05-01
529	CV-2009-0000151	929.49	X	2009-04-09
530	CV-2008-0001058	635.00	X	2009-04-09
531	CV-2008-0001024	734.55	X	2009-02-11
532	CV-2008-0001025	735.55	X	2009-02-12
533	CV-2008-0000963	415.40	X	2009-03-16
534	CV-2008-0000892	1491.81	X	2008-12-18
535	CV-2008-0000836	656.91	X	2008-12-05
536	CV-2008-0000831	2876.77	X	2008-12-03
537	CV-2008-0000738	866.74	X	2008-10-30
538	CV-2008-0000367	3747.75	X	2008-06-13
539	CV-2007-0000381	704.67	X	2007-06-20
540	CV-2007-0000294	919.30	X	2007-05-30
541	CV-2007-0000295	920.30	X	2007-05-31
542	CV-2007-0000293	4535.76	X	2007-06-05
543	CV-2007-0000181	687.40	X	2007-05-03
544	CV-2007-0000152	4810.21	X	2007-03-28
545	CV-2007-0000152	4810.21	X	2007-03-28
546	CV-2007-0000026	966.37	X	2007-03-01
547	CV-2006-0000984	5695.40	X	2007-01-23
548	CV-2006-0000963	657.91	X	2007-01-10
549	CV-2006-0000581	371.59	X	2006-10-17
550	CV-2006-0000006	5914.64	X	2006-04-28
551	CV-2013-0000709	385.54	X	2014-01-16
552	CV-2013-0000577	741.49	X	2013-11-13
553	CV-2013-0000576	3369.06	X	2013-12-05
554	CV-2012-0000903	4938.33	X	2013-02-20
555	CV-2012-0000848	5564.91	X	2013-02-07
556	CV-2011-0000610	6667.05	X	2011-10-05
557	CV-2011-0000324	13281.55	X	2011-06-20
558	Cv-2010-0000304	6153.57	X	2010-06-23
559	CV-2010-0000280	5525.74	X	2010-06-23
560	CV-2010-0000013	9300.22	X	2010-02-24
561	CV-2009-0000921	1389.19	X	2010-02-04
562	CV-2009-0000828	4452.34	X	2009-12-30
563	CV-2009-0000279	4623.88	X	2009-06-17
564	CV-2008-0000255	8221.54	X	2008-06-04
565	CV-2008-0000024	9639.69	X	2008-04-28
566	CV-2008-0000025	9640.69	X	2008-04-29
567	CV-2008-0000026	9641.69	X	2008-04-30
568	CV-2007-00000884	755.38	X	2008-01-18
569	CV-2007-00000821	1589.44	X	2007-12-14
570	CV-2007-00000485	736.34	X	2007-07-31
571	CV-2007-00000486	737.34	X	2007-08-01
572	CV-2007-00000487	738.34	X	2007-08-02
573	CV-2007-00000295	3410.10	X	2007-05-22
574	CV-2007-00000260	1818.33	X	2007-05-03
575	CV-2007-00000261	1819.33	X	2007-05-04
576	CV-2005-00000658	5028.08	X	2005-12-09
577	CV-2014-0000110	1107.83	Money	2014-04-09
578	CV-2014-0000095	3771.99	Money	2015-10-27
579	CV-2013-0000250	714.95	X	2013-05-09
580	CV-2013-0000067	7765.87	X	2013-03-28
581	CV-2014-0000084	1866.37	X	2014-06-04
582	CV-2013-0000297	1134.84	Default Judgment	2013-11-07
583	CV-2014-0000374	8931.68	Default Judgment	2014-06-24
584	CV-2011-0000412	0.00	Default Judgment	2011-06-14
585	CV-2013-0000877	2175.00	Default Judgment	2014-02-03
586	CV-2013-0000078	1407.75	Default Judgment	2013-04-04
\.


--
-- Name: judgements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mehrotra
--

SELECT pg_catalog.setval('judgements_id_seq', 586, true);


--
-- Data for Name: plaintiffs; Type: TABLE DATA; Schema: public; Owner: Mehrotra
--

COPY plaintiffs (id, name) FROM stdin;
1	Medical Recovery Services
2	Bonneville Billing
5	Diversified Equity Systems
\.


--
-- Name: plaintiffs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mehrotra
--

SELECT pg_catalog.setval('plaintiffs_id_seq', 5, true);


--
-- Data for Name: warrants; Type: TABLE DATA; Schema: public; Owner: Mehrotra
--

COPY warrants (id, case_number, issued, reason, bond_amount, defendant) FROM stdin;
685	CV-2016-0002464-OC	2017-05-25		500.00	Falconer Jo Anna
686	CV-2016-0002464-OC	2017-05-25		500.00	Falconer Jo Anna
687	CV-2016-0002464-OC	2017-05-25		500.00	Falconer Jo Anna
688	CV-2016-0002464-OC	2017-05-25		500.00	Falconer Jo Anna
689	CV-2016-0002464-OC	2017-05-25		500.00	Falconer Jo Anna
690	CV-2016-0001456-OC	2016-04-26		0.00	cr (Bannock County Sheriff office searched for original warrant but could not find the original/warrant was cancelled on 2-28-17; they made exhaustive search but could not find);
691	CV-2016-0001456-OC	2017-02-22		500.00	Jaramillo Jose M
692	CV-2016-0001456-OC	2016-04-26		0.00	cr (Bannock County Sheriff office searched for original warrant but could not find the original/warrant was cancelled on 2-28-17; they made exhaustive search but could not find);
693	CV-2016-0001456-OC	2017-02-22		500.00	Jaramillo Jose M
694	CV-2016-0001456-OC	2016-04-26		0.00	cr (Bannock County Sheriff office searched for original warrant but could not find the original/warrant was cancelled on 2-28-17; they made exhaustive search but could not find);
695	CV-2016-0001456-OC	2017-02-22		500.00	Jaramillo Jose M
696	CV-2016-0001456-OC	2016-04-26		0.00	cr (Bannock County Sheriff office searched for original warrant but could not find the original/warrant was cancelled on 2-28-17; they made exhaustive search but could not find);
697	CV-2016-0001456-OC	2017-02-22		500.00	Jaramillo Jose M
698	CV-2016-0001456-OC	2016-04-26		0.00	cr (Bannock County Sheriff office searched for original warrant but could not find the original/warrant was cancelled on 2-28-17; they made exhaustive search but could not find);
699	CV-2016-0001456-OC	2017-02-22		500.00	Jaramillo Jose M
700	CV-2016-0000769-OC	2017-02-10		500.00	Martinez Maricela
701	CV-2016-0000769-OC	2017-02-10		500.00	Martinez Maricela
702	CV-2016-0000769-OC	2017-02-10		500.00	Martinez Maricela
703	CV-2016-0000769-OC	2017-02-10		500.00	Martinez Maricela
704	CV-2016-0000769-OC	2017-02-10		500.00	Martinez Maricela
705	CV-2016-0000601-OC	2016-12-28		500.00	Hopkins Kenneth
706	CV-2016-0000601-OC	2017-01-04		500.00	Bond Posted - Surety (Amount 500.00 ): Warrant: Bonded by Debbie's Bail Bonds
707	CV-2016-0000601-OC	2016-12-28		500.00	Hopkins Kenneth
708	CV-2016-0000601-OC	2017-01-04		500.00	Bond Posted - Surety (Amount 500.00 ): Warrant: Bonded by Debbie's Bail Bonds
709	CV-2016-0000601-OC	2016-12-28		500.00	Hopkins Kenneth
710	CV-2016-0000601-OC	2017-01-04		500.00	Bond Posted - Surety (Amount 500.00 ): Warrant: Bonded by Debbie's Bail Bonds
711	CV-2016-0000601-OC	2016-12-28		500.00	Hopkins Kenneth
712	CV-2016-0000601-OC	2017-01-04		500.00	Bond Posted - Surety (Amount 500.00 ): Warrant: Bonded by Debbie's Bail Bonds
713	CV-2016-0000601-OC	2016-12-28		500.00	Hopkins Kenneth
714	CV-2016-0000601-OC	2017-01-04		500.00	Bond Posted - Surety (Amount 500.00 ): Warrant: Bonded by Debbie's Bail Bonds
715	CV-2015-0003701-OC	2016-07-25		0.00	Minute Entry and Order s/ J. Clark 7-25-16; hearing held 7-25-16; motion for contempt granted; Plaintiff to submit bench warrant for court's signature
716	CV-2015-0003701-OC	2016-08-05		500.00	Powell Julie Ann
717	CV-2015-0003701-OC	2016-11-09		750.00	Powell Julie Ann
718	CV-2015-0003701-OC	2016-07-25		0.00	Minute Entry and Order s/ J. Clark 7-25-16; hearing held 7-25-16; motion for contempt granted; Plaintiff to submit bench warrant for court's signature
719	CV-2015-0003701-OC	2016-08-05		500.00	Powell Julie Ann
720	CV-2015-0003701-OC	2016-11-09		750.00	Powell Julie Ann
721	CV-2015-0003701-OC	2016-07-25		0.00	Minute Entry and Order s/ J. Clark 7-25-16; hearing held 7-25-16; motion for contempt granted; Plaintiff to submit bench warrant for court's signature
722	CV-2015-0003701-OC	2016-08-05		500.00	Powell Julie Ann
723	CV-2015-0003701-OC	2016-11-09		750.00	Powell Julie Ann
724	CV-2015-0003701-OC	2016-07-25		0.00	Minute Entry and Order s/ J. Clark 7-25-16; hearing held 7-25-16; motion for contempt granted; Plaintiff to submit bench warrant for court's signature
725	CV-2015-0003701-OC	2016-08-05		500.00	Powell Julie Ann
726	CV-2015-0003701-OC	2016-11-09		750.00	Powell Julie Ann
727	CV-2015-0003701-OC	2016-07-25		0.00	Minute Entry and Order s/ J. Clark 7-25-16; hearing held 7-25-16; motion for contempt granted; Plaintiff to submit bench warrant for court's signature
728	CV-2015-0003701-OC	2016-08-05		500.00	Powell Julie Ann
729	CV-2015-0003701-OC	2016-11-09		750.00	Powell Julie Ann
730	CV-2015-0003107-OC	2016-12-28		500.00	Barlow Daryenne
731	CV-2015-0003107-OC	2016-12-28		500.00	Barlow Daryenne
732	CV-2015-0003107-OC	2016-12-28		500.00	Barlow Daryenne
733	CV-2015-0003107-OC	2016-12-28		500.00	Barlow Daryenne
734	CV-2015-0003107-OC	2016-12-28		500.00	Barlow Daryenne
735	CV-2015-0002546-OC	2016-04-26		1000.00	Wilson Craig Allen
736	CV-2015-0002546-OC	2016-04-26		1000.00	Wilson Craig Allen
737	CV-2015-0002546-OC	2016-04-26		1000.00	Wilson Craig Allen
738	CV-2015-0002546-OC	2016-04-26		1000.00	Wilson Craig Allen
739	CV-2015-0002546-OC	2016-04-26		1000.00	Wilson Craig Allen
740	CV-2015-0002160-OC	2016-05-18		500.00	Carter Diana L
741	CV-2015-0002160-OC	2016-05-18		500.00	Carter Diana L
742	CV-2015-0002160-OC	2016-05-18		500.00	Carter Diana L
743	CV-2015-0002160-OC	2016-05-18		500.00	Carter Diana L
744	CV-2015-0002160-OC	2016-05-18		500.00	Carter Diana L
745	CV-2015-0001070-OC	2016-07-25		0.00	Minute Entry and Order; hearing held 7-25-16; motion for contempt granted; Plaintiff to submit bench warrant for court's signature; s/ J. Clark 7-25-16
746	CV-2015-0001070-OC	2016-08-05		500.00	Lacy Joseph T
747	CV-2015-0001070-OC	2016-07-25		0.00	Minute Entry and Order; hearing held 7-25-16; motion for contempt granted; Plaintiff to submit bench warrant for court's signature; s/ J. Clark 7-25-16
748	CV-2015-0001070-OC	2016-08-05		500.00	Lacy Joseph T
749	CV-2015-0001070-OC	2016-07-25		0.00	Minute Entry and Order; hearing held 7-25-16; motion for contempt granted; Plaintiff to submit bench warrant for court's signature; s/ J. Clark 7-25-16
750	CV-2015-0001070-OC	2016-08-05		500.00	Lacy Joseph T
751	CV-2015-0001070-OC	2016-07-25		0.00	Minute Entry and Order; hearing held 7-25-16; motion for contempt granted; Plaintiff to submit bench warrant for court's signature; s/ J. Clark 7-25-16
752	CV-2015-0001070-OC	2016-08-05		500.00	Lacy Joseph T
886	CV-2011-0005533-OC	2013-05-14		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
753	CV-2015-0001070-OC	2016-07-25		0.00	Minute Entry and Order; hearing held 7-25-16; motion for contempt granted; Plaintiff to submit bench warrant for court's signature; s/ J. Clark 7-25-16
754	CV-2015-0001070-OC	2016-08-05		500.00	Lacy Joseph T
755	CV-2015-0000987-OC	2016-02-10		300.00	Wiebelhaus Sky E
756	CV-2015-0000987-OC	2016-03-01		300.00	Bond Posted - Surety (Amount 300.00 ): Bench Warrant: Bonded by Debbie's Bail Bonds
757	CV-2015-0000987-OC	2016-02-10		300.00	Wiebelhaus Sky E
758	CV-2015-0000987-OC	2016-03-01		300.00	Bond Posted - Surety (Amount 300.00 ): Bench Warrant: Bonded by Debbie's Bail Bonds
759	CV-2015-0000987-OC	2016-02-10		300.00	Wiebelhaus Sky E
760	CV-2015-0000987-OC	2016-03-01		300.00	Bond Posted - Surety (Amount 300.00 ): Bench Warrant: Bonded by Debbie's Bail Bonds
761	CV-2015-0000987-OC	2016-02-10		300.00	Wiebelhaus Sky E
762	CV-2015-0000987-OC	2016-03-01		300.00	Bond Posted - Surety (Amount 300.00 ): Bench Warrant: Bonded by Debbie's Bail Bonds
763	CV-2015-0000987-OC	2016-02-10		300.00	Wiebelhaus Sky E
764	CV-2015-0000987-OC	2016-03-01		300.00	Bond Posted - Surety (Amount 300.00 ): Bench Warrant: Bonded by Debbie's Bail Bonds
765	CV-2015-0000412-OC	2017-02-01		500.00	Williams Sallie Francine
766	CV-2015-0000412-OC	2017-02-01		500.00	Williams Sallie Francine
767	CV-2015-0000412-OC	2017-02-01		500.00	Williams Sallie Francine
768	CV-2015-0000412-OC	2017-02-01		500.00	Williams Sallie Francine
769	CV-2015-0000412-OC	2017-02-01		500.00	Williams Sallie Francine
770	CV-2014-0004864-OC	2015-12-04		500.00	Myler Joshua David
771	CV-2014-0004864-OC	2015-12-04		500.00	Myler Joshua David
772	CV-2014-0004864-OC	2015-12-04		500.00	Myler Joshua David
773	CV-2014-0004864-OC	2015-12-04		500.00	Myler Joshua David
774	CV-2014-0004864-OC	2015-12-04		500.00	Myler Joshua David
775	CV-2014-0004515-OC	2015-10-13		0.00	Minute Entry and Order: hearing held; defenant failed to appear; request for warrant is granted: s/ Clark 10/13/2015
776	CV-2014-0004515-OC	2015-10-21		1642.10	Morrison Mistie
777	CV-2014-0004515-OC	2015-10-13		0.00	Minute Entry and Order: hearing held; defenant failed to appear; request for warrant is granted: s/ Clark 10/13/2015
778	CV-2014-0004515-OC	2015-10-21		1642.10	Morrison Mistie
779	CV-2014-0004515-OC	2015-10-13		0.00	Minute Entry and Order: hearing held; defenant failed to appear; request for warrant is granted: s/ Clark 10/13/2015
780	CV-2014-0004515-OC	2015-10-21		1642.10	Morrison Mistie
781	CV-2014-0004515-OC	2015-10-13		0.00	Minute Entry and Order: hearing held; defenant failed to appear; request for warrant is granted: s/ Clark 10/13/2015
782	CV-2014-0004515-OC	2015-10-21		1642.10	Morrison Mistie
783	CV-2014-0004515-OC	2015-10-13		0.00	Minute Entry and Order: hearing held; defenant failed to appear; request for warrant is granted: s/ Clark 10/13/2015
784	CV-2014-0004515-OC	2015-10-21		1642.10	Morrison Mistie
785	CV-2014-0001722-OC	2015-04-28	or a warrant will be issued for hisM; s/ Carnaroli 4/28/2015	0.00	or a warrant will be issued for hisM; s/ Carnaroli 4/28/2015
786	CV-2014-0001722-OC	2015-08-20		300.00	Arrants Harley H III
787	CV-2014-0001722-OC	2017-04-04		500.00	Arrants Harley H III
788	CV-2014-0001722-OC	2015-04-28	or a warrant will be issued for hisM; s/ Carnaroli 4/28/2015	0.00	or a warrant will be issued for hisM; s/ Carnaroli 4/28/2015
789	CV-2014-0001722-OC	2015-08-20		300.00	Arrants Harley H III
790	CV-2014-0001722-OC	2017-04-04		500.00	Arrants Harley H III
791	CV-2014-0001722-OC	2015-04-28	or a warrant will be issued for hisM; s/ Carnaroli 4/28/2015	0.00	or a warrant will be issued for hisM; s/ Carnaroli 4/28/2015
792	CV-2014-0001722-OC	2015-08-20		300.00	Arrants Harley H III
793	CV-2014-0001722-OC	2017-04-04		500.00	Arrants Harley H III
794	CV-2014-0001722-OC	2015-04-28	or a warrant will be issued for hisM; s/ Carnaroli 4/28/2015	0.00	or a warrant will be issued for hisM; s/ Carnaroli 4/28/2015
795	CV-2014-0001722-OC	2015-08-20		300.00	Arrants Harley H III
796	CV-2014-0001722-OC	2017-04-04		500.00	Arrants Harley H III
797	CV-2014-0001722-OC	2015-04-28	or a warrant will be issued for hisM; s/ Carnaroli 4/28/2015	0.00	or a warrant will be issued for hisM; s/ Carnaroli 4/28/2015
798	CV-2014-0001722-OC	2015-08-20		300.00	Arrants Harley H III
799	CV-2014-0001722-OC	2017-04-04		500.00	Arrants Harley H III
800	CV-2014-0001248-OC	2015-11-06		500.00	Olsen Christopher M
801	CV-2014-0001248-OC	2015-11-06		500.00	Olsen Christopher M
802	CV-2014-0001248-OC	2015-11-06		500.00	Olsen Christopher M
803	CV-2014-0001248-OC	2015-11-06		500.00	Olsen Christopher M
804	CV-2014-0001248-OC	2015-11-06		500.00	Olsen Christopher M
805	CV-2014-0001129-OC	2015-04-28		0.00	Order defendant to appear at on or before 8/10/2015 at the plaintiff office for examaintion or a warrant will be issued: s/ Carnaroli 4/28/2015
806	CV-2014-0001129-OC	2015-08-20		300.00	Griffey Kathleen M
807	CV-2014-0001129-OC	2017-07-17	on 07/17/2017 10:00 AM:	0.00	Failure To Appear For Hearing Or Trial- pa shall send warrant
808	CV-2014-0001129-OC	2015-04-28		0.00	Order defendant to appear at on or before 8/10/2015 at the plaintiff office for examaintion or a warrant will be issued: s/ Carnaroli 4/28/2015
809	CV-2014-0001129-OC	2015-08-20		300.00	Griffey Kathleen M
810	CV-2014-0001129-OC	2017-07-17	on 07/17/2017 10:00 AM:	0.00	Failure To Appear For Hearing Or Trial- pa shall send warrant
811	CV-2014-0001129-OC	2015-04-28		0.00	Order defendant to appear at on or before 8/10/2015 at the plaintiff office for examaintion or a warrant will be issued: s/ Carnaroli 4/28/2015
812	CV-2014-0001129-OC	2015-08-20		300.00	Griffey Kathleen M
813	CV-2014-0001129-OC	2017-07-17	on 07/17/2017 10:00 AM:	0.00	Failure To Appear For Hearing Or Trial- pa shall send warrant
814	CV-2014-0001129-OC	2015-04-28		0.00	Order defendant to appear at on or before 8/10/2015 at the plaintiff office for examaintion or a warrant will be issued: s/ Carnaroli 4/28/2015
815	CV-2014-0001129-OC	2015-08-20		300.00	Griffey Kathleen M
816	CV-2014-0001129-OC	2017-07-17	on 07/17/2017 10:00 AM:	0.00	Failure To Appear For Hearing Or Trial- pa shall send warrant
817	CV-2014-0001129-OC	2015-04-28		0.00	Order defendant to appear at on or before 8/10/2015 at the plaintiff office for examaintion or a warrant will be issued: s/ Carnaroli 4/28/2015
818	CV-2014-0001129-OC	2015-08-20		300.00	Griffey Kathleen M
819	CV-2014-0001129-OC	2017-07-17	on 07/17/2017 10:00 AM:	0.00	Failure To Appear For Hearing Or Trial- pa shall send warrant
820	CV-2013-0004755-OC	2015-04-28		0.00	Order Carrie to appear for examination at the plainff's office on or before 10 August or a Warrant will be issued: s/ Carnaroli 4/28/2015
821	CV-2013-0004755-OC	2015-04-28		0.00	Order Carrie to appear for examination at the plainff's office on or before 10 August or a Warrant will be issued: s/ Carnaroli 4/28/2015
822	CV-2013-0004755-OC	2015-04-28		0.00	Order Carrie to appear for examination at the plainff's office on or before 10 August or a Warrant will be issued: s/ Carnaroli 4/28/2015
823	CV-2013-0004755-OC	2015-04-28		0.00	Order Carrie to appear for examination at the plainff's office on or before 10 August or a Warrant will be issued: s/ Carnaroli 4/28/2015
824	CV-2013-0004755-OC	2015-04-28		0.00	Order Carrie to appear for examination at the plainff's office on or before 10 August or a Warrant will be issued: s/ Carnaroli 4/28/2015
825	CV-2013-0004196-OC	2015-07-31		782.14	Edwards Jordan R.
826	CV-2013-0004196-OC	2015-07-31		782.14	Edwards Jordan R.
827	CV-2013-0004196-OC	2015-07-31		782.14	Edwards Jordan R.
828	CV-2013-0004196-OC	2015-07-31		782.14	Edwards Jordan R.
829	CV-2013-0004196-OC	2015-07-31		782.14	Edwards Jordan R.
830	CV-2013-0003798-OC	2015-06-09		0.00	Order William Eldridge is found in contempt of this court; defendant to appear on or before 7/20/2015 or a warrant will be issued: s/ Thomsen 6/09/2015
831	CV-2013-0003798-OC	2015-06-09		0.00	Order William Eldridge is found in contempt of this court; defendant to appear on or before 7/20/2015 or a warrant will be issued: s/ Thomsen 6/09/2015
832	CV-2013-0003798-OC	2015-06-09		0.00	Order William Eldridge is found in contempt of this court; defendant to appear on or before 7/20/2015 or a warrant will be issued: s/ Thomsen 6/09/2015
833	CV-2013-0003798-OC	2015-06-09		0.00	Order William Eldridge is found in contempt of this court; defendant to appear on or before 7/20/2015 or a warrant will be issued: s/ Thomsen 6/09/2015
834	CV-2013-0003798-OC	2015-06-09		0.00	Order William Eldridge is found in contempt of this court; defendant to appear on or before 7/20/2015 or a warrant will be issued: s/ Thomsen 6/09/2015
835	CV-2013-0001469-OC	2015-04-27		0.00	Order: Frank Dickman to appear on or before 8/10/2015 or a warrant will be issued for his arrested: s/ Carnaroli 4/20/2015
836	CV-2013-0001469-OC	2015-09-24		1489.42	Dickman Frank Loreen
837	CV-2013-0001469-OC	2015-04-27		0.00	Order: Frank Dickman to appear on or before 8/10/2015 or a warrant will be issued for his arrested: s/ Carnaroli 4/20/2015
838	CV-2013-0001469-OC	2015-09-24		1489.42	Dickman Frank Loreen
839	CV-2013-0001469-OC	2015-04-27		0.00	Order: Frank Dickman to appear on or before 8/10/2015 or a warrant will be issued for his arrested: s/ Carnaroli 4/20/2015
840	CV-2013-0001469-OC	2015-09-24		1489.42	Dickman Frank Loreen
841	CV-2013-0001469-OC	2015-04-27		0.00	Order: Frank Dickman to appear on or before 8/10/2015 or a warrant will be issued for his arrested: s/ Carnaroli 4/20/2015
842	CV-2013-0001469-OC	2015-09-24		1489.42	Dickman Frank Loreen
843	CV-2013-0001469-OC	2015-04-27		0.00	Order: Frank Dickman to appear on or before 8/10/2015 or a warrant will be issued for his arrested: s/ Carnaroli 4/20/2015
844	CV-2013-0001469-OC	2015-09-24		1489.42	Dickman Frank Loreen
845	CV-2012-0004252-OC	2013-07-22		500.00	Ellertson Steven C
846	CV-2012-0004252-OC	2013-07-22		500.00	Ellertson Steven C
847	CV-2012-0004252-OC	2013-07-22		500.00	Ellertson Steven C
848	CV-2012-0004252-OC	2013-07-22		500.00	Ellertson Steven C
849	CV-2012-0004252-OC	2013-07-22		500.00	Ellertson Steven C
850	CV-2012-0004021-OC	2013-07-31		500.00	Neubacher Beth
851	CV-2012-0004021-OC	2015-09-18		2589.27	Neubacher Beth
852	CV-2012-0004021-OC	2013-07-31		500.00	Neubacher Beth
853	CV-2012-0004021-OC	2015-09-18		2589.27	Neubacher Beth
854	CV-2012-0004021-OC	2013-07-31		500.00	Neubacher Beth
855	CV-2012-0004021-OC	2015-09-18		2589.27	Neubacher Beth
856	CV-2012-0004021-OC	2013-07-31		500.00	Neubacher Beth
857	CV-2012-0004021-OC	2015-09-18		2589.27	Neubacher Beth
858	CV-2012-0004021-OC	2013-07-31		500.00	Neubacher Beth
859	CV-2012-0004021-OC	2015-09-18		2589.27	Neubacher Beth
860	CV-2012-0003180-OC	2013-04-08		500.00	Bacon Anissa M
861	CV-2012-0003180-OC	2013-04-08		500.00	Bacon Anissa M
862	CV-2012-0003180-OC	2013-04-08		500.00	Bacon Anissa M
863	CV-2012-0003180-OC	2013-04-08		500.00	Bacon Anissa M
864	CV-2012-0003180-OC	2013-04-08		500.00	Bacon Anissa M
865	CV-2012-0002384-OC	2013-03-04	on 03/04/2013 02:00 PM:	0.00	Failure To Appear For Hearing Or Trial-att shall prepare request for warrant
866	CV-2012-0002384-OC	2013-03-04	on 03/04/2013 02:00 PM:	0.00	Failure To Appear For Hearing Or Trial-att shall prepare request for warrant
867	CV-2012-0002384-OC	2013-03-04	on 03/04/2013 02:00 PM:	0.00	Failure To Appear For Hearing Or Trial-att shall prepare request for warrant
868	CV-2012-0002384-OC	2013-03-04	on 03/04/2013 02:00 PM:	0.00	Failure To Appear For Hearing Or Trial-att shall prepare request for warrant
869	CV-2012-0002384-OC	2013-03-04	on 03/04/2013 02:00 PM:	0.00	Failure To Appear For Hearing Or Trial-att shall prepare request for warrant
870	CV-2012-0001209-OC	2013-02-11	on 02/11/2013 03:00 PM:	0.00	Failure To Appear For Hearing Or Trial- pa shall prepare warrant
871	CV-2012-0001209-OC	2013-02-11	on 02/11/2013 03:00 PM:	0.00	Failure To Appear For Hearing Or Trial- pa shall prepare warrant
872	CV-2012-0001209-OC	2013-02-11	on 02/11/2013 03:00 PM:	0.00	Failure To Appear For Hearing Or Trial- pa shall prepare warrant
873	CV-2012-0001209-OC	2013-02-11	on 02/11/2013 03:00 PM:	0.00	Failure To Appear For Hearing Or Trial- pa shall prepare warrant
874	CV-2012-0001209-OC	2013-02-11	on 02/11/2013 03:00 PM:	0.00	Failure To Appear For Hearing Or Trial- pa shall prepare warrant
875	CV-2012-0000747-OC	2013-01-04		500.00	Price Dennis H
876	CV-2012-0000747-OC	2013-01-04		500.00	Price Dennis H
877	CV-2012-0000747-OC	2013-01-04		500.00	Price Dennis H
878	CV-2012-0000747-OC	2013-01-04		500.00	Price Dennis H
879	CV-2012-0000747-OC	2013-01-04		500.00	Price Dennis H
880	CV-2012-0000408-OC	2012-09-12		500.00	Bybee Laurie J
881	CV-2012-0000408-OC	2012-09-12		500.00	Bybee Laurie J
882	CV-2012-0000408-OC	2012-09-12		500.00	Bybee Laurie J
883	CV-2012-0000408-OC	2012-09-12		500.00	Bybee Laurie J
884	CV-2012-0000408-OC	2012-09-12		500.00	Bybee Laurie J
885	CV-2011-0005533-OC	2012-10-11		500.00	Cameron Kathryn
887	CV-2011-0005533-OC	2012-10-11		500.00	Cameron Kathryn
888	CV-2011-0005533-OC	2013-05-14		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
889	CV-2011-0005533-OC	2012-10-11		500.00	Cameron Kathryn
890	CV-2011-0005533-OC	2013-05-14		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
891	CV-2011-0005533-OC	2012-10-11		500.00	Cameron Kathryn
892	CV-2011-0005533-OC	2013-05-14		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
893	CV-2011-0005533-OC	2012-10-11		500.00	Cameron Kathryn
894	CV-2011-0005533-OC	2013-05-14		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
895	CV-2011-0004911-OC	2012-06-22		500.00	Davis Renee N
896	CV-2011-0004911-OC	2015-07-24		1000.00	Davis Renee N
897	CV-2011-0004911-OC	2012-06-22		500.00	Davis Renee N
898	CV-2011-0004911-OC	2015-07-24		1000.00	Davis Renee N
899	CV-2011-0004911-OC	2012-06-22		500.00	Davis Renee N
900	CV-2011-0004911-OC	2015-07-24		1000.00	Davis Renee N
901	CV-2011-0004911-OC	2012-06-22		500.00	Davis Renee N
902	CV-2011-0004911-OC	2015-07-24		1000.00	Davis Renee N
903	CV-2011-0004911-OC	2012-06-22		500.00	Davis Renee N
904	CV-2011-0004911-OC	2015-07-24		1000.00	Davis Renee N
905	CV-2011-0003472-OC	2013-04-01	for Warrant of Attachament: pa Zollinger	0.00	for Warrant of Attachament: pa Zollinger
906	CV-2011-0003472-OC	2013-04-08		500.00	Starks Theresa Anne
907	CV-2011-0003472-OC	2013-04-01	for Warrant of Attachament: pa Zollinger	0.00	for Warrant of Attachament: pa Zollinger
908	CV-2011-0003472-OC	2013-04-08		500.00	Starks Theresa Anne
909	CV-2011-0003472-OC	2013-04-01	for Warrant of Attachament: pa Zollinger	0.00	for Warrant of Attachament: pa Zollinger
910	CV-2011-0003472-OC	2013-04-08		500.00	Starks Theresa Anne
911	CV-2011-0003472-OC	2013-04-01	for Warrant of Attachament: pa Zollinger	0.00	for Warrant of Attachament: pa Zollinger
912	CV-2011-0003472-OC	2013-04-08		500.00	Starks Theresa Anne
913	CV-2011-0003472-OC	2013-04-01	for Warrant of Attachament: pa Zollinger	0.00	for Warrant of Attachament: pa Zollinger
914	CV-2011-0003472-OC	2013-04-08		500.00	Starks Theresa Anne
915	CV-2011-0003465-OC	2013-01-14		500.00	Lewis Mellisa
916	CV-2011-0003465-OC	2013-01-14		500.00	Lewis Mellisa
917	CV-2011-0003465-OC	2013-01-14		500.00	Lewis Mellisa
918	CV-2011-0003465-OC	2013-01-14		500.00	Lewis Mellisa
919	CV-2011-0003465-OC	2013-01-14		500.00	Lewis Mellisa
920	CV-2011-0003323-OC	2012-01-23		500.00	Hazelbush Cory K
921	CV-2011-0003323-OC	2012-01-23		500.00	Hazelbush Cory K
922	CV-2011-0003323-OC	2012-01-23		500.00	Hazelbush Cory K
923	CV-2011-0003323-OC	2012-01-23		500.00	Hazelbush Cory K
924	CV-2011-0003323-OC	2012-01-23		500.00	Hazelbush Cory K
925	CV-2011-0002966-OC	2012-02-03		500.00	Saraceno Tony
926	CV-2011-0002966-OC	2012-02-03		500.00	Saraceno Tony
927	CV-2011-0002966-OC	2012-02-03		500.00	Saraceno Tony
928	CV-2011-0002966-OC	2012-02-03		500.00	Saraceno Tony
929	CV-2011-0002966-OC	2012-02-03		500.00	Saraceno Tony
930	CV-2011-0002871-OC	2012-06-08		500.00	Guthrie Kasey
931	CV-2011-0002871-OC	2012-07-17		0.00	Order of Release: release the Warrant of Attachmnent for Kasey Guthrie
932	CV-2011-0002871-OC	2012-06-08		500.00	Guthrie Kasey
933	CV-2011-0002871-OC	2012-07-17		0.00	Order of Release: release the Warrant of Attachmnent for Kasey Guthrie
934	CV-2011-0002871-OC	2012-06-08		500.00	Guthrie Kasey
935	CV-2011-0002871-OC	2012-07-17		0.00	Order of Release: release the Warrant of Attachmnent for Kasey Guthrie
936	CV-2011-0002871-OC	2012-06-08		500.00	Guthrie Kasey
937	CV-2011-0002871-OC	2012-07-17		0.00	Order of Release: release the Warrant of Attachmnent for Kasey Guthrie
938	CV-2011-0002871-OC	2012-06-08		500.00	Guthrie Kasey
939	CV-2011-0002871-OC	2012-07-17		0.00	Order of Release: release the Warrant of Attachmnent for Kasey Guthrie
940	CV-2011-0002819-OC	2012-06-06		500.00	Dueling Todd
941	CV-2011-0002819-OC	2012-06-06		500.00	Dueling Todd
942	CV-2011-0002819-OC	2012-06-06		500.00	Dueling Todd
943	CV-2011-0002819-OC	2012-06-06		500.00	Dueling Todd
944	CV-2011-0002819-OC	2012-06-06		500.00	Dueling Todd
945	CV-2011-0002374-OC	2017-02-10		500.00	Medrano Rosen
946	CV-2011-0002374-OC	2017-06-26		2500.00	Medrano Rosen
947	CV-2011-0002374-OC	2017-02-10		500.00	Medrano Rosen
948	CV-2011-0002374-OC	2017-06-26		2500.00	Medrano Rosen
949	CV-2011-0002374-OC	2017-02-10		500.00	Medrano Rosen
950	CV-2011-0002374-OC	2017-06-26		2500.00	Medrano Rosen
951	CV-2011-0002374-OC	2017-02-10		500.00	Medrano Rosen
952	CV-2011-0002374-OC	2017-06-26		2500.00	Medrano Rosen
953	CV-2011-0002374-OC	2017-02-10		500.00	Medrano Rosen
954	CV-2011-0002374-OC	2017-06-26		2500.00	Medrano Rosen
955	CV-2011-0002320-OC	2011-12-23		500.00	Belew Laurel
956	CV-2011-0002320-OC	2014-12-03		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
957	CV-2011-0002320-OC	2011-12-23		500.00	Belew Laurel
958	CV-2011-0002320-OC	2014-12-03		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
959	CV-2011-0002320-OC	2011-12-23		500.00	Belew Laurel
960	CV-2011-0002320-OC	2014-12-03		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
961	CV-2011-0002320-OC	2011-12-23		500.00	Belew Laurel
962	CV-2011-0002320-OC	2014-12-03		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
963	CV-2011-0002320-OC	2011-12-23		500.00	Belew Laurel
964	CV-2011-0002320-OC	2014-12-03		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
965	CV-2011-0001910-OC	2011-12-30		500.00	Ridley Darrin L
966	CV-2011-0001910-OC	2013-02-20		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
967	CV-2011-0001910-OC	2011-12-30		500.00	Ridley Darrin L
968	CV-2011-0001910-OC	2013-02-20		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
969	CV-2011-0001910-OC	2011-12-30		500.00	Ridley Darrin L
970	CV-2011-0001910-OC	2013-02-20		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
971	CV-2011-0001910-OC	2011-12-30		500.00	Ridley Darrin L
972	CV-2011-0001910-OC	2013-02-20		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
973	CV-2011-0001910-OC	2011-12-30		500.00	Ridley Darrin L
974	CV-2011-0001910-OC	2013-02-20		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
975	CV-2011-0000225-OC	2011-08-22		500.00	Anderson Cynthia
976	CV-2011-0000225-OC	2014-09-24		500.00	Bond Posted - Cash (Receipt 31131 Dated 9/24/2014 for 500.00) Warrant
977	CV-2011-0000225-OC	2011-08-22		500.00	Anderson Cynthia
978	CV-2011-0000225-OC	2014-09-24		500.00	Bond Posted - Cash (Receipt 31131 Dated 9/24/2014 for 500.00) Warrant
979	CV-2011-0000225-OC	2011-08-22		500.00	Anderson Cynthia
980	CV-2011-0000225-OC	2014-09-24		500.00	Bond Posted - Cash (Receipt 31131 Dated 9/24/2014 for 500.00) Warrant
981	CV-2011-0000225-OC	2011-08-22		500.00	Anderson Cynthia
982	CV-2011-0000225-OC	2014-09-24		500.00	Bond Posted - Cash (Receipt 31131 Dated 9/24/2014 for 500.00) Warrant
983	CV-2011-0000225-OC	2011-08-22		500.00	Anderson Cynthia
984	CV-2011-0000225-OC	2014-09-24		500.00	Bond Posted - Cash (Receipt 31131 Dated 9/24/2014 for 500.00) Warrant
985	CV-2010-0003812-OC	2011-07-08		500.00	Verderber Tessa Leigh
986	CV-2010-0003812-OC	2011-07-08		500.00	Verderber Tessa Leigh
987	CV-2010-0003812-OC	2011-07-08		500.00	Verderber Tessa Leigh
988	CV-2010-0003812-OC	2011-07-08		500.00	Verderber Tessa Leigh
989	CV-2010-0003812-OC	2011-07-08		500.00	Verderber Tessa Leigh
990	CV-2010-0003811-OC	2011-06-17		500.00	Johns Darin Michael
991	CV-2010-0003811-OC	2011-06-17		500.00	Johns Darin Michael
992	CV-2010-0003811-OC	2011-06-17		500.00	Johns Darin Michael
993	CV-2010-0003811-OC	2011-06-17		500.00	Johns Darin Michael
994	CV-2010-0003811-OC	2011-06-17		500.00	Johns Darin Michael
995	CV-2010-0003427-OC	2012-01-31		500.00	Downard Corrinna
996	CV-2010-0003427-OC	2012-01-31		500.00	Downard Corrinna
997	CV-2010-0003427-OC	2012-01-31		500.00	Downard Corrinna
998	CV-2010-0003427-OC	2012-01-31		500.00	Downard Corrinna
999	CV-2010-0003427-OC	2012-01-31		500.00	Downard Corrinna
1000	CV-2010-0003133-OC	2012-03-20		500.00	Hoyt Michelle M
1001	CV-2010-0003133-OC	2012-03-20		500.00	Hoyt Michelle M
1002	CV-2010-0003133-OC	2012-03-20		500.00	Hoyt Michelle M
1003	CV-2010-0003133-OC	2012-03-20		500.00	Hoyt Michelle M
1004	CV-2010-0003133-OC	2012-03-20		500.00	Hoyt Michelle M
1005	CV-2010-0001408-OC	2010-12-20		500.00	McMahen Trent A
1006	CV-2010-0001408-OC	2011-02-23		500.00	Bond Posted - Surety (Amount 500.00 ): FTA WARRANT
1007	CV-2010-0001408-OC	2011-12-23		500.00	McMahen Trent A
1008	CV-2010-0001408-OC	2012-01-26		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
1009	CV-2010-0001408-OC	2010-12-20		500.00	McMahen Trent A
1010	CV-2010-0001408-OC	2011-02-23		500.00	Bond Posted - Surety (Amount 500.00 ): FTA WARRANT
1011	CV-2010-0001408-OC	2011-12-23		500.00	McMahen Trent A
1012	CV-2010-0001408-OC	2012-01-26		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
1013	CV-2010-0001408-OC	2010-12-20		500.00	McMahen Trent A
1014	CV-2010-0001408-OC	2011-02-23		500.00	Bond Posted - Surety (Amount 500.00 ): FTA WARRANT
1015	CV-2010-0001408-OC	2011-12-23		500.00	McMahen Trent A
1016	CV-2010-0001408-OC	2012-01-26		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
1017	CV-2010-0001408-OC	2010-12-20		500.00	McMahen Trent A
1018	CV-2010-0001408-OC	2011-02-23		500.00	Bond Posted - Surety (Amount 500.00 ): FTA WARRANT
1019	CV-2010-0001408-OC	2011-12-23		500.00	McMahen Trent A
1020	CV-2010-0001408-OC	2012-01-26		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
1021	CV-2010-0001408-OC	2010-12-20		500.00	McMahen Trent A
1022	CV-2010-0001408-OC	2011-02-23		500.00	Bond Posted - Surety (Amount 500.00 ): FTA WARRANT
1023	CV-2010-0001408-OC	2011-12-23		500.00	McMahen Trent A
1024	CV-2010-0001408-OC	2012-01-26		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
1025	CV-2010-0000837-OC	2011-04-07		500.00	Thompson Edwin E
1026	CV-2010-0000837-OC	2011-04-07		500.00	Thompson Edwin E
1027	CV-2010-0000837-OC	2011-04-07		500.00	Thompson Edwin E
1028	CV-2010-0000837-OC	2011-04-07		500.00	Thompson Edwin E
1029	CV-2010-0000837-OC	2011-04-07		500.00	Thompson Edwin E
1030	CV-2010-0000767-OC	2010-12-23		500.00	Howerton Tina M
1031	CV-2010-0000767-OC	2010-12-23		500.00	Howerton Tina M
1032	CV-2010-0000767-OC	2010-12-23		500.00	Howerton Tina M
1033	CV-2010-0000767-OC	2010-12-23		500.00	Howerton Tina M
1034	CV-2010-0000767-OC	2010-12-23		500.00	Howerton Tina M
1035	CV-2010-0000482-OC	2011-01-11		500.00	Rogers Adam
1036	CV-2010-0000482-OC	2011-02-22		500.00	Bond Posted - Surety (Amount 500.00 ): FTA WARRANT
1037	CV-2010-0000482-OC	2011-01-11		500.00	Rogers Adam
1038	CV-2010-0000482-OC	2011-02-22		500.00	Bond Posted - Surety (Amount 500.00 ): FTA WARRANT
1039	CV-2010-0000482-OC	2011-01-11		500.00	Rogers Adam
1040	CV-2010-0000482-OC	2011-02-22		500.00	Bond Posted - Surety (Amount 500.00 ): FTA WARRANT
1041	CV-2010-0000482-OC	2011-01-11		500.00	Rogers Adam
1042	CV-2010-0000482-OC	2011-02-22		500.00	Bond Posted - Surety (Amount 500.00 ): FTA WARRANT
1043	CV-2010-0000482-OC	2011-01-11		500.00	Rogers Adam
1044	CV-2010-0000482-OC	2011-02-22		500.00	Bond Posted - Surety (Amount 500.00 ): FTA WARRANT
1045	CV-2009-0003428-OC	2010-10-27		500.00	Croft Kasi K.
1046	CV-2009-0003428-OC	2010-10-27		500.00	Croft Kasi K.
1047	CV-2009-0003428-OC	2010-10-27		500.00	Croft Kasi K.
1048	CV-2009-0003428-OC	2010-10-27		500.00	Croft Kasi K.
1049	CV-2009-0003428-OC	2010-10-27		500.00	Croft Kasi K.
1050	CV-2009-0002517-OC	2010-01-29		500.00	Leading Mark
1051	CV-2009-0002517-OC	2010-01-29		500.00	Leading Mark
1052	CV-2009-0002517-OC	2010-01-29		500.00	Leading Mark
1053	CV-2009-0002517-OC	2010-01-29		500.00	Leading Mark
1054	CV-2009-0002517-OC	2010-01-29		500.00	Leading Mark
1055	CV-2009-0002074-OC	2012-10-18		500.00	Mahan Nickcole D
1056	CV-2009-0002074-OC	2012-10-18		500.00	Mahan Nickcole D
1057	CV-2009-0002074-OC	2012-10-18		500.00	Mahan Nickcole D
1058	CV-2009-0002074-OC	2012-10-18		500.00	Mahan Nickcole D
1059	CV-2009-0002074-OC	2012-10-18		500.00	Mahan Nickcole D
1060	CV-2009-0001076-OC	2010-10-27		500.00	Casper Andrew J
1061	CV-2009-0001076-OC	2010-10-27		500.00	Casper Andrew J
1062	CV-2009-0001076-OC	2010-10-27		500.00	Casper Andrew J
1063	CV-2009-0001076-OC	2010-10-27		500.00	Casper Andrew J
1064	CV-2009-0001076-OC	2010-10-27		500.00	Casper Andrew J
1065	CV-2008-0004674-OC	2009-10-08		500.00	Reisner Darwin
1066	CV-2008-0004674-OC	2009-10-08		500.00	Reisner Darwin
1067	CV-2008-0004674-OC	2009-10-08		500.00	Reisner Darwin
1068	CV-2008-0004674-OC	2009-10-08		500.00	Reisner Darwin
1069	CV-2008-0004674-OC	2009-10-08		500.00	Reisner Darwin
1070	CV-2008-0003859-OC	2012-09-06		0.00	Affidavit of BryanN Zollinger in Supporr of Warrant of Attachemtn: pa Zollinger
1071	CV-2008-0003859-OC	2012-10-18		500.00	Rowberry Jeremy
1072	CV-2008-0003859-OC	2012-09-06		0.00	Affidavit of BryanN Zollinger in Supporr of Warrant of Attachemtn: pa Zollinger
1073	CV-2008-0003859-OC	2012-10-18		500.00	Rowberry Jeremy
1074	CV-2008-0003859-OC	2012-09-06		0.00	Affidavit of BryanN Zollinger in Supporr of Warrant of Attachemtn: pa Zollinger
1075	CV-2008-0003859-OC	2012-10-18		500.00	Rowberry Jeremy
1076	CV-2008-0003859-OC	2012-09-06		0.00	Affidavit of BryanN Zollinger in Supporr of Warrant of Attachemtn: pa Zollinger
1077	CV-2008-0003859-OC	2012-10-18		500.00	Rowberry Jeremy
1078	CV-2008-0003859-OC	2012-09-06		0.00	Affidavit of BryanN Zollinger in Supporr of Warrant of Attachemtn: pa Zollinger
1079	CV-2008-0003859-OC	2012-10-18		500.00	Rowberry Jeremy
1080	CV-2008-0003809-OC	2010-08-02		500.00	Alonso Carrie J.
1081	CV-2008-0003809-OC	2010-08-02		500.00	Alonso Carrie J.
1082	CV-2008-0003809-OC	2010-08-02		500.00	Alonso Carrie J.
1083	CV-2008-0003809-OC	2010-08-02		500.00	Alonso Carrie J.
1084	CV-2008-0003809-OC	2010-08-02		500.00	Alonso Carrie J.
1085	CV-2008-0003191-OC	2011-02-09		500.00	Stark Justin D
1086	CV-2008-0003191-OC	2011-05-23		500.00	Bond Posted - Surety (Amount 500.00 ): FTA Warrant
1087	CV-2008-0003191-OC	2011-02-09		500.00	Stark Justin D
1088	CV-2008-0003191-OC	2011-05-23		500.00	Bond Posted - Surety (Amount 500.00 ): FTA Warrant
1089	CV-2008-0003191-OC	2011-02-09		500.00	Stark Justin D
1090	CV-2008-0003191-OC	2011-05-23		500.00	Bond Posted - Surety (Amount 500.00 ): FTA Warrant
1091	CV-2008-0003191-OC	2011-02-09		500.00	Stark Justin D
1092	CV-2008-0003191-OC	2011-05-23		500.00	Bond Posted - Surety (Amount 500.00 ): FTA Warrant
1093	CV-2008-0003191-OC	2011-02-09		500.00	Stark Justin D
1094	CV-2008-0003191-OC	2011-05-23		500.00	Bond Posted - Surety (Amount 500.00 ): FTA Warrant
1095	CV-2008-0002942-OC	2009-02-18		7137.32	Heath Arthur Sr (no dfdt identifiers provided on warrant prepared by pltf atty)
1096	CV-2008-0002942-OC	2009-02-18		7137.32	Heath Peggy (no dfdt identifiers provided on warrant prepared by pltf atty)
1097	CV-2008-0002942-OC	2009-02-18		7137.32	Heath Arthur Sr (no dfdt identifiers provided on warrant prepared by pltf atty)
1098	CV-2008-0002942-OC	2009-02-18		7137.32	Heath Peggy (no dfdt identifiers provided on warrant prepared by pltf atty)
1099	CV-2008-0002942-OC	2009-02-18		7137.32	Heath Arthur Sr (no dfdt identifiers provided on warrant prepared by pltf atty)
1100	CV-2008-0002942-OC	2009-02-18		7137.32	Heath Peggy (no dfdt identifiers provided on warrant prepared by pltf atty)
1101	CV-2008-0002942-OC	2009-02-18		7137.32	Heath Arthur Sr (no dfdt identifiers provided on warrant prepared by pltf atty)
1102	CV-2008-0002942-OC	2009-02-18		7137.32	Heath Peggy (no dfdt identifiers provided on warrant prepared by pltf atty)
1103	CV-2008-0002942-OC	2009-02-18		7137.32	Heath Arthur Sr (no dfdt identifiers provided on warrant prepared by pltf atty)
1104	CV-2008-0002942-OC	2009-02-18		7137.32	Heath Peggy (no dfdt identifiers provided on warrant prepared by pltf atty)
1105	CV-2008-0002939-OC	2009-07-07		300.00	Vaughan Shane J.; /s/ J Carnaroli 07-02-09
1106	CV-2008-0002939-OC	2009-07-07		300.00	Vaughan Shane J.; /s/ J Carnaroli 07-02-09
1107	CV-2008-0002939-OC	2009-07-07		300.00	Vaughan Shane J.; /s/ J Carnaroli 07-02-09
1108	CV-2008-0002939-OC	2009-07-07		300.00	Vaughan Shane J.; /s/ J Carnaroli 07-02-09
1109	CV-2008-0002939-OC	2009-07-07		300.00	Vaughan Shane J.; /s/ J Carnaroli 07-02-09
1110	CV-2008-0002938-OC	2009-03-05		940.48	Palmer James; /s/ J Box 03-05-09
1111	CV-2008-0002938-OC	2010-10-29		940.48	Bond Posted - Surety (Amount 940.48 ) FTA WARRANT
1112	CV-2008-0002938-OC	2009-03-05		940.48	Palmer James; /s/ J Box 03-05-09
1113	CV-2008-0002938-OC	2010-10-29		940.48	Bond Posted - Surety (Amount 940.48 ) FTA WARRANT
1114	CV-2008-0002938-OC	2009-03-05		940.48	Palmer James; /s/ J Box 03-05-09
1115	CV-2008-0002938-OC	2010-10-29		940.48	Bond Posted - Surety (Amount 940.48 ) FTA WARRANT
1116	CV-2008-0002938-OC	2009-03-05		940.48	Palmer James; /s/ J Box 03-05-09
1117	CV-2008-0002938-OC	2010-10-29		940.48	Bond Posted - Surety (Amount 940.48 ) FTA WARRANT
1118	CV-2008-0002938-OC	2009-03-05		940.48	Palmer James; /s/ J Box 03-05-09
1119	CV-2008-0002938-OC	2010-10-29		940.48	Bond Posted - Surety (Amount 940.48 ) FTA WARRANT
1120	CV-2007-0004797-OC	2009-04-01		500.00	Valai Shirlene; /s/ J Thomsen 04-01-09
1121	CV-2007-0004797-OC	2009-04-01		500.00	Valai Shirlene; /s/ J Thomsen 04-01-09
1122	CV-2007-0004797-OC	2009-04-01		500.00	Valai Shirlene; /s/ J Thomsen 04-01-09
1123	CV-2007-0004797-OC	2009-04-01		500.00	Valai Shirlene; /s/ J Thomsen 04-01-09
1124	CV-2007-0004797-OC	2009-04-01		500.00	Valai Shirlene; /s/ J Thomsen 04-01-09
1125	CV-2007-0004453-OC	2008-11-12	Failure To Appear For Hearing Or Trial - Defnt FTA'd; Atty to provide warrant	0.00	Failure To Appear For Hearing Or Trial - Defnt FTA'd; Atty to provide warrant
1126	CV-2007-0004453-OC	2008-11-28		2047.76	Lane Martin P; warrant /s/ J Thomsen 11-21-08
1127	CV-2007-0004453-OC	2010-04-28		500.00	Lane Martin P
1128	CV-2007-0004453-OC	2008-11-12	Failure To Appear For Hearing Or Trial - Defnt FTA'd; Atty to provide warrant	0.00	Failure To Appear For Hearing Or Trial - Defnt FTA'd; Atty to provide warrant
1129	CV-2007-0004453-OC	2008-11-28		2047.76	Lane Martin P; warrant /s/ J Thomsen 11-21-08
1130	CV-2007-0004453-OC	2010-04-28		500.00	Lane Martin P
1131	CV-2007-0004453-OC	2008-11-12	Failure To Appear For Hearing Or Trial - Defnt FTA'd; Atty to provide warrant	0.00	Failure To Appear For Hearing Or Trial - Defnt FTA'd; Atty to provide warrant
1132	CV-2007-0004453-OC	2008-11-28		2047.76	Lane Martin P; warrant /s/ J Thomsen 11-21-08
1133	CV-2007-0004453-OC	2010-04-28		500.00	Lane Martin P
1134	CV-2007-0004453-OC	2008-11-12	Failure To Appear For Hearing Or Trial - Defnt FTA'd; Atty to provide warrant	0.00	Failure To Appear For Hearing Or Trial - Defnt FTA'd; Atty to provide warrant
1135	CV-2007-0004453-OC	2008-11-28		2047.76	Lane Martin P; warrant /s/ J Thomsen 11-21-08
1136	CV-2007-0004453-OC	2010-04-28		500.00	Lane Martin P
1137	CV-2007-0004453-OC	2008-11-12	Failure To Appear For Hearing Or Trial - Defnt FTA'd; Atty to provide warrant	0.00	Failure To Appear For Hearing Or Trial - Defnt FTA'd; Atty to provide warrant
1138	CV-2007-0004453-OC	2008-11-28		2047.76	Lane Martin P; warrant /s/ J Thomsen 11-21-08
1139	CV-2007-0004453-OC	2010-04-28		500.00	Lane Martin P
1140	CV-2007-0004301-OC	2010-08-31		500.00	Larsen Jared L
1141	CV-2007-0004301-OC	2012-01-26		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
1142	CV-2007-0004301-OC	2010-08-31		500.00	Larsen Jared L
1143	CV-2007-0004301-OC	2012-01-26		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
1144	CV-2007-0004301-OC	2010-08-31		500.00	Larsen Jared L
1145	CV-2007-0004301-OC	2012-01-26		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
1146	CV-2007-0004301-OC	2010-08-31		500.00	Larsen Jared L
1147	CV-2007-0004301-OC	2012-01-26		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
1148	CV-2007-0004301-OC	2010-08-31		500.00	Larsen Jared L
1149	CV-2007-0004301-OC	2012-01-26		500.00	Bond Posted - Surety (Amount 500.00 )- Warrant
1150	CV-2007-0004039-OC	2008-07-15		0.00	Affidavit of Bryan D Smith in Support of Warrant of Attachemtn; PA Smith
1151	CV-2007-0004039-OC	2008-07-15		0.00	Affidavit of Bryan D Smith in Support of Warrant of Attachemtn; PA Smith
1152	CV-2007-0004039-OC	2008-07-15		0.00	Affidavit of Bryan D Smith in Support of Warrant of Attachemtn; PA Smith
1153	CV-2007-0004039-OC	2008-07-15		0.00	Affidavit of Bryan D Smith in Support of Warrant of Attachemtn; PA Smith
1154	CV-2007-0004039-OC	2008-07-15		0.00	Affidavit of Bryan D Smith in Support of Warrant of Attachemtn; PA Smith
1155	CV-2007-0002171-OC	2008-06-17		1991.96	McDonald Rosemarrie; /s/ J Box 05-27-08
1156	CV-2007-0002171-OC	2008-06-17		1991.96	McDonald Michael; /s/ J Box 05-27-08 -- original warrant sent to BCSD
1157	CV-2007-0002171-OC	2010-04-13		500.00	McDonald Rosemarrie
1158	CV-2007-0002171-OC	2008-06-17		1991.96	McDonald Rosemarrie; /s/ J Box 05-27-08
1159	CV-2007-0002171-OC	2008-06-17		1991.96	McDonald Michael; /s/ J Box 05-27-08 -- original warrant sent to BCSD
1160	CV-2007-0002171-OC	2010-04-13		500.00	McDonald Rosemarrie
1161	CV-2007-0002171-OC	2008-06-17		1991.96	McDonald Rosemarrie; /s/ J Box 05-27-08
1162	CV-2007-0002171-OC	2008-06-17		1991.96	McDonald Michael; /s/ J Box 05-27-08 -- original warrant sent to BCSD
1163	CV-2007-0002171-OC	2010-04-13		500.00	McDonald Rosemarrie
1164	CV-2007-0002171-OC	2008-06-17		1991.96	McDonald Rosemarrie; /s/ J Box 05-27-08
1165	CV-2007-0002171-OC	2008-06-17		1991.96	McDonald Michael; /s/ J Box 05-27-08 -- original warrant sent to BCSD
1166	CV-2007-0002171-OC	2010-04-13		500.00	McDonald Rosemarrie
1167	CV-2007-0002171-OC	2008-06-17		1991.96	McDonald Rosemarrie; /s/ J Box 05-27-08
1168	CV-2007-0002171-OC	2008-06-17		1991.96	McDonald Michael; /s/ J Box 05-27-08 -- original warrant sent to BCSD
1169	CV-2007-0002171-OC	2010-04-13		500.00	McDonald Rosemarrie
1170	CV-2006-0004975-OC	2008-08-07		804.20	Govan Herman Jr; /s/ J Carnaroli 07-25-08
1171	CV-2006-0004975-OC	2012-03-29		500.00	Govan Maria
1172	CV-2006-0004975-OC	2008-08-07		804.20	Govan Herman Jr; /s/ J Carnaroli 07-25-08
1173	CV-2006-0004975-OC	2012-03-29		500.00	Govan Maria
1174	CV-2006-0004975-OC	2008-08-07		804.20	Govan Herman Jr; /s/ J Carnaroli 07-25-08
1175	CV-2006-0004975-OC	2012-03-29		500.00	Govan Maria
1176	CV-2006-0004975-OC	2008-08-07		804.20	Govan Herman Jr; /s/ J Carnaroli 07-25-08
1177	CV-2006-0004975-OC	2012-03-29		500.00	Govan Maria
1178	CV-2006-0004975-OC	2008-08-07		804.20	Govan Herman Jr; /s/ J Carnaroli 07-25-08
1179	CV-2006-0004975-OC	2012-03-29		500.00	Govan Maria
1180	CV-2006-0002383-OC	2007-02-05	Bond amount: 617.06	617.06	Failed to Appear Defendant: Elder Donald E - sent to Bannock County to send to Bingham County (as per CH)
1181	CV-2006-0002383-OC	2007-05-18		617.06	Elder Donald E
1182	CV-2006-0002383-OC	2007-02-05	Bond amount: 617.06	617.06	Failed to Appear Defendant: Elder Donald E - sent to Bannock County to send to Bingham County (as per CH)
1183	CV-2006-0002383-OC	2007-05-18		617.06	Elder Donald E
1184	CV-2006-0002383-OC	2007-02-05	Bond amount: 617.06	617.06	Failed to Appear Defendant: Elder Donald E - sent to Bannock County to send to Bingham County (as per CH)
1185	CV-2006-0002383-OC	2007-05-18		617.06	Elder Donald E
1186	CV-2006-0002383-OC	2007-02-05	Bond amount: 617.06	617.06	Failed to Appear Defendant: Elder Donald E - sent to Bannock County to send to Bingham County (as per CH)
1187	CV-2006-0002383-OC	2007-05-18		617.06	Elder Donald E
1188	CV-2006-0002383-OC	2007-02-05	Bond amount: 617.06	617.06	Failed to Appear Defendant: Elder Donald E - sent to Bannock County to send to Bingham County (as per CH)
1189	CV-2006-0002383-OC	2007-05-18		617.06	Elder Donald E
1190	CV-2006-0002382-OC	2007-02-06	for Warrant of Attachement; PA Smith	0.00	for Warrant of Attachement; PA Smith
1191	CV-2006-0002382-OC	2007-03-22	Bond amount: 1548.83	1548.83	Failed to Appear Debtor exam Defendant: Cluff Alan
1192	CV-2006-0002382-OC	2007-03-22	Bond amount: 1548.83	1548.83	Failed to Appear Debtor Exam Defendant: Cluff Brenda E
1193	CV-2006-0002382-OC	2007-02-06	for Warrant of Attachement; PA Smith	0.00	for Warrant of Attachement; PA Smith
1194	CV-2006-0002382-OC	2007-03-22	Bond amount: 1548.83	1548.83	Failed to Appear Debtor exam Defendant: Cluff Alan
1195	CV-2006-0002382-OC	2007-03-22	Bond amount: 1548.83	1548.83	Failed to Appear Debtor Exam Defendant: Cluff Brenda E
1196	CV-2006-0002382-OC	2007-02-06	for Warrant of Attachement; PA Smith	0.00	for Warrant of Attachement; PA Smith
1197	CV-2006-0002382-OC	2007-03-22	Bond amount: 1548.83	1548.83	Failed to Appear Debtor exam Defendant: Cluff Alan
1198	CV-2006-0002382-OC	2007-03-22	Bond amount: 1548.83	1548.83	Failed to Appear Debtor Exam Defendant: Cluff Brenda E
1199	CV-2006-0002382-OC	2007-02-06	for Warrant of Attachement; PA Smith	0.00	for Warrant of Attachement; PA Smith
1200	CV-2006-0002382-OC	2007-03-22	Bond amount: 1548.83	1548.83	Failed to Appear Debtor exam Defendant: Cluff Alan
1201	CV-2006-0002382-OC	2007-03-22	Bond amount: 1548.83	1548.83	Failed to Appear Debtor Exam Defendant: Cluff Brenda E
1202	CV-2006-0002382-OC	2007-02-06	for Warrant of Attachement; PA Smith	0.00	for Warrant of Attachement; PA Smith
1203	CV-2006-0002382-OC	2007-03-22	Bond amount: 1548.83	1548.83	Failed to Appear Debtor exam Defendant: Cluff Alan
1299	CV-2008-0000183	2011-07-15		500.00	Bonneville Billing & Collections
1204	CV-2006-0002382-OC	2007-03-22	Bond amount: 1548.83	1548.83	Failed to Appear Debtor Exam Defendant: Cluff Brenda E
1205	CV-2015-0001081	2016-06-08		0.00	Conan Jamie Dean
1206	CV-2015-0001037	2017-06-07		300.00	Roberts Ron
1207	CV-2015-0000587	2016-02-18		500.00	Buck Weston
1208	CV-2014-0001875	2016-11-09		300.00	Smith Melonie D
1209	CV-2014-0001828	2015-09-09		3742.35	Leonardson Traci L
1210	CV-2013-0001820	2017-06-07		300.00	Elison Desiree Sarah
1211	CV-2012-0002228	2016-06-08		0.00	Kohler Kaydon
1212	CV-2012-0002228	2016-06-10	By Bingham County Sheriff\\r\\nServed To Kaydon Kohler Fail To Appear	0.00	By Bingham County Sheriff\\r\\nServed To Kaydon Kohler Fail To Appear
1213	CV-2015-0000672	2016-06-01		500.00	Jones Kimberly B
1214	CV-2012-0000599	2014-04-23		0.00	Medical Recovery Services LLC
1215	CV-2016-0000297	2017-05-22		500.00	Rothman Jeffrey Michael
1216	CV-2016-0000175	2017-05-23		500.00	Renick Lisa
1217	CV-2015-0000424	2016-08-29		3200.27	Romo Joseph Michael
1218	CV-2015-0000424	2016-08-30	(Arraignment	0.00	on a warrant
1219	CV-2015-0000424	2016-08-30	on 08/30/2016 11:00 AM:	0.00	on a warrant
1220	CV-2014-0000600	2015-12-07		500.00	Mcdonald Fred T
1221	CV-2014-0000636	2015-08-03		0.00	Warrant Issued - Warrant of Attatchment for Luis Varela
1222	CV-2014-0000636	2015-08-03		500.00	Varela Luis
1223	CV-2014-0000636	2015-09-28		0.00	Application for Another Warrant of Attatchment
1224	CV-2014-0000636	2015-09-28		0.00	Affidavit of Jessica Sargent in Support of Application for Another Warrant of Attatchment
1225	CV-2014-0000636	2015-10-02		500.00	Varela Luis
1226	CV-2014-0000636	2015-10-02		500.00	Varela Luis
1227	CV-2014-0000276	2014-11-13		500.00	Mangan Martin A
1228	CV-2014-0000276	2014-12-23		0.00	Warrant of Body Attatchment Issued for MArtin MAngan
1229	CV-2014-0000276	2014-12-23		500.00	Mangan Martin A
1230	CV-2014-0000059	2015-10-23		0.00	Warrant of Attatchment Issued for Charie Sorensen
1231	CV-2014-0000059	2015-10-23		500.00	Sorensen Cherie
1232	CV-2014-0000059	2016-04-20		500.00	Sorensen Cherie
1233	CV-2013-0000705	2014-06-20		500.00	Hernandez Leticia
1234	CV-2013-0000653	2014-02-21		500.00	Barrientos Francesca
1235	CV-2013-0000653	2014-02-21		0.00	Warrant Issued - Arrest FTAH Fransisco Barrientos
1236	CV-2013-0000615	2014-02-18		500.00	Graham Brittney
1237	CV-2013-0000615	2014-02-18		0.00	Warrant Issued - Arrest for contempt
1238	CV-2013-0000272	2013-11-19		500.00	Schell John
1239	CV-2013-0000239	2014-03-20		500.00	Parker Kristine B
1240	CV-2013-0000233	2015-04-14		500.00	Linares Brittany Jo
1241	CV-2013-0000123	2013-09-13		500.00	Stibal Tyrel L
1242	CV-2012-0001026	2014-12-24		500.00	Robbins Jeff J
1243	CV-2012-0000967	2017-01-13		500.00	Dortch Jimmy T
1244	CV-2012-0000879	2013-07-19		500.00	Lopez Joe
1245	CV-2012-0000875	2014-11-13		500.00	Smith Rachel
1246	CV-2012-0000713	2014-03-20		500.00	Fillmore Michelle Rae
1247	CV-2012-0000664	2014-07-22		500.00	Covington Jory T
1248	CV-2012-0000619	2013-06-18		500.00	Christensen Josh
1249	CV-2012-0000603	2015-10-23		0.00	Warrant of Attatachment Issued for Skipper T Morton
1250	CV-2012-0000603	2015-10-23		500.00	Morton Skipper T
1251	CV-2012-0000166	2013-05-01		0.00	Warrant Issued - Bench
1252	CV-2012-0000166	2014-05-12		0.00	Warrant Recalled - Bonneville County
1253	CV-2010-0001301	2013-09-30		500.00	Morton Megan
1254	CV-2010-0001301	2013-10-21		0.00	Warrant Recalled by Bryan Zollinger
1255	CV-2010-0001277	2012-02-24		500.00	Davis Alan
1256	CV-2010-0000845	2012-01-31		500.00	Wilde Shelly
1257	CV-2010-0000703	2011-01-14		500.00	Defendant: Lance Barber
1258	CV-2010-0000613	2011-01-10		500.00	Williams Curtis Martin
1259	CV-2010-0000613	2011-02-14		500.00	Williams Curtis Martin
1260	CV-2010-0000238	2010-09-15		0.00	Coles Holly M
1261	CV-2009-0001047	2011-06-30		500.00	Oler Deena Lynn
1262	CV-2009-0000234	2011-01-14		500.00	Defendant: Brent Layton
1263	CV-2009-0000151	2010-11-10		500.00	Stowers Rebecca
1264	CV-2008-0001058	2014-04-30		500.00	Sakan Karla R
1265	CV-2008-0001024	2009-05-20		819.45	Thompson Sheri
1266	CV-2008-0001024	2009-06-03		819.45	Medical Recovery Services Inc
1267	CV-2008-0001024	2009-06-03		819.45	Thompson Sheri
1268	CV-2008-0000963	2009-07-23		319.48	Medical Recovery Services Inc
1269	CV-2008-0000963	2009-07-23		319.48	Graham Marcia
1270	CV-2008-0000892	2010-05-05		500.00	Baler Nikki
1271	CV-2008-0000836	2009-04-16		817.97	Wakley Charity
1272	CV-2008-0000831	2009-04-16		3152.25	Acor Kevin T
1273	CV-2008-0000738	2010-05-05		500.00	Roberts Corry
1274	CV-2008-0000738	2010-06-09		0.00	Warrant on Corry Roberts Recalled
1275	CV-2008-0000367	2011-05-10		500.00	Wellard Matthew J
1276	CV-2007-0000293	2010-03-24		500.00	Rogers Gale Wayne
1277	CV-2007-0000152	2008-02-28		701.98	Baker Jennie
1278	CV-2007-0000152	2008-02-28		701.98	Baker Matthew
1279	CV-2007-0000026	2007-11-06		0.00	Owens Steven
1280	CV-2006-0000984	2008-11-26		6192.20	Morgan Jennifer Lou
1281	CV-2006-0000963	2008-02-29		717.32	Landon Jared Daniel
1282	CV-2014-0000110	2014-11-07		500.00	Olmos Claudia
1283	CV-2013-0000450	2014-08-28		500.00	Moreno Olivia
1284	CV-2012-0000550	2013-05-20		500.00	Smith Robert S
1285	CV-2016-0000027	2016-12-28		300.00	McDaniel Richard Lynn
1286	CV-2014-0000215	2015-11-20		500.00	Medical Recovery Services LLC
1287	CV-2014-0000084	2015-01-07		2039.12	Valdez Krista D
1288	CV-2014-0002795-OC	2016-07-25		0.00	Minute Entry and Order; hearing held 7-25-16; motion for contempt granted; Plaintiff to submit bench warrant for court's signature; s/ J. Clark 7-25-16
1289	CV-2014-0002795-OC	2016-08-05		500.00	Tharpe Marcus Vaughan
1290	CV-2016-0001209	2017-06-28		300.00	Murray Tyson D
1291	CV-2016-0000992	2017-06-28		0.00	Diversified Equity Systems
1292	CV-2016-0000992	2017-06-28		300.00	Jensen Jason
1293	CV-2012-0002547	2014-07-14		5000.00	Bingo Leonard
1294	CV-2014-0000263	2016-11-04		0.00	Warrant Recalled
1295	CV-2014-0003144	2015-07-27		100.00	Jenkins Megan S
1296	CV-2014-0003144	2015-08-18		0.00	Order Rescinding the Warrant and Exonerating the Bond
1297	CV-2014-0000818	2015-10-19		1415.95	Bell Dustin J
1298	CV-2008-0000183	2011-07-14		500.00	Varner Tiffany M
1300	CV-2008-0000183	2011-07-15		500.00	Varner Michael J Jr
1301	CV-2008-0000183	2011-07-14		500.00	Varner Tiffany M
1302	CV-2008-0000183	2011-07-15		500.00	Bonneville Billing & Collections
1303	CV-2008-0000183	2011-07-15		500.00	Varner Michael J Jr
1304	CV-2008-0000183	2011-07-14		500.00	Varner Tiffany M
1305	CV-2008-0000183	2011-07-15		500.00	Bonneville Billing & Collections
1306	CV-2008-0000183	2011-07-15		500.00	Varner Michael J Jr
1307	CV-2016-0003472-OC	2017-04-25		300.00	Chester Dawna Lynn
1308	CV-2016-0003472-OC	2017-04-25		300.00	Chester Dawna Lynn
1309	CV-2016-0003472-OC	2017-04-25		300.00	Chester Dawna Lynn
1310	CV-2016-0003472-OC	2017-04-25		300.00	Chester Dawna Lynn
1311	CV-2016-0003472-OC	2017-04-25		300.00	Chester Dawna Lynn
1312	CV-2016-0002920-OC	2017-03-17		300.00	Thomas Tammy
1313	CV-2016-0002920-OC	2017-03-17		300.00	Thomas Tammy
1314	CV-2016-0002920-OC	2017-03-17		300.00	Thomas Tammy
1315	CV-2016-0002920-OC	2017-03-17		300.00	Thomas Tammy
1316	CV-2016-0002920-OC	2017-03-17		300.00	Thomas Tammy
1317	CV-2016-0002301-OC	2017-05-22		300.00	Maxey Patrick Armon
1318	CV-2016-0002301-OC	2017-05-22		300.00	Maxey Patrick Armon
1319	CV-2016-0002301-OC	2017-05-22		300.00	Maxey Patrick Armon
1320	CV-2016-0002301-OC	2017-05-22		300.00	Maxey Patrick Armon
1321	CV-2016-0002301-OC	2017-05-22		300.00	Maxey Patrick Armon
1322	CV-2016-0001141-OC	2016-11-22		500.00	Barraza Monica
1323	CV-2016-0001141-OC	2016-11-22		500.00	Barraza Monica
1324	CV-2016-0001141-OC	2016-11-22		500.00	Barraza Monica
1325	CV-2016-0001141-OC	2016-11-22		500.00	Barraza Monica
1326	CV-2016-0001141-OC	2016-11-22		500.00	Barraza Monica
1327	CV-2015-0005659-OC	2016-05-20		300.00	Rasmussen Tyler Michael
1328	CV-2015-0005659-OC	2016-07-25		300.00	Rasmussen Tyler Michael
1329	CV-2015-0005659-OC	2016-10-06	(Hearing	0.00	Warrant of Attatchment
1330	CV-2015-0005659-OC	2016-10-07	on 10/07/2016 01:00 PM:	0.00	Warrant of Attatchment
1331	CV-2015-0005659-OC	2016-05-20		300.00	Rasmussen Tyler Michael
1332	CV-2015-0005659-OC	2016-07-25		300.00	Rasmussen Tyler Michael
1333	CV-2015-0005659-OC	2016-10-06	(Hearing	0.00	Warrant of Attatchment
1334	CV-2015-0005659-OC	2016-10-07	on 10/07/2016 01:00 PM:	0.00	Warrant of Attatchment
1335	CV-2015-0005659-OC	2016-05-20		300.00	Rasmussen Tyler Michael
1336	CV-2015-0005659-OC	2016-07-25		300.00	Rasmussen Tyler Michael
1337	CV-2015-0005659-OC	2016-10-06	(Hearing	0.00	Warrant of Attatchment
1338	CV-2015-0005659-OC	2016-10-07	on 10/07/2016 01:00 PM:	0.00	Warrant of Attatchment
1339	CV-2015-0005659-OC	2016-05-20		300.00	Rasmussen Tyler Michael
1340	CV-2015-0005659-OC	2016-07-25		300.00	Rasmussen Tyler Michael
1341	CV-2015-0005659-OC	2016-10-06	(Hearing	0.00	Warrant of Attatchment
1342	CV-2015-0005659-OC	2016-10-07	on 10/07/2016 01:00 PM:	0.00	Warrant of Attatchment
1343	CV-2015-0005659-OC	2016-05-20		300.00	Rasmussen Tyler Michael
1344	CV-2015-0005659-OC	2016-07-25		300.00	Rasmussen Tyler Michael
1345	CV-2015-0005659-OC	2016-10-06	(Hearing	0.00	Warrant of Attatchment
1346	CV-2015-0005659-OC	2016-10-07	on 10/07/2016 01:00 PM:	0.00	Warrant of Attatchment
1347	CV-2015-0005293-OC	2016-10-18		300.00	Ephrem Kent
1348	CV-2015-0005293-OC	2017-02-02	Warrant	0.00	Warrant
1349	CV-2015-0005293-OC	2016-10-18		300.00	Ephrem Kent
1350	CV-2015-0005293-OC	2017-02-02	Warrant	0.00	Warrant
1351	CV-2015-0005293-OC	2016-10-18		300.00	Ephrem Kent
1352	CV-2015-0005293-OC	2017-02-02	Warrant	0.00	Warrant
1353	CV-2015-0005293-OC	2016-10-18		300.00	Ephrem Kent
1354	CV-2015-0005293-OC	2017-02-02	Warrant	0.00	Warrant
1355	CV-2015-0005293-OC	2016-10-18		300.00	Ephrem Kent
1356	CV-2015-0005293-OC	2017-02-02	Warrant	0.00	Warrant
1357	CV-2015-0005294-OC	2017-07-24		300.00	Perez Fabiola
1358	CV-2015-0005294-OC	2017-07-24		300.00	Perez Fabiola
1359	CV-2015-0005294-OC	2017-07-24		300.00	Perez Fabiola
1360	CV-2015-0005294-OC	2017-07-24		300.00	Perez Fabiola
1361	CV-2015-0005294-OC	2017-07-24		300.00	Perez Fabiola
1362	CV-2015-0004793-OC	2017-07-24		300.00	Radford Sharon
1363	CV-2015-0004793-OC	2017-07-24		300.00	Radford Sharon
1364	CV-2015-0004793-OC	2017-07-24		300.00	Radford Sharon
1365	CV-2015-0004793-OC	2017-07-24		300.00	Radford Sharon
1366	CV-2015-0004793-OC	2017-07-24		300.00	Radford Sharon
1367	CV-2015-0004619-OC	2016-05-20		300.00	Rollene Jason Lee
1368	CV-2015-0004619-OC	2016-05-20		300.00	Rollene Jason Lee
1369	CV-2015-0004619-OC	2016-05-20		300.00	Rollene Jason Lee
1370	CV-2015-0004619-OC	2016-05-20		300.00	Rollene Jason Lee
1371	CV-2015-0004619-OC	2016-05-20		300.00	Rollene Jason Lee
1372	CV-2015-0004463-OC	2016-05-05		300.00	Allison Julie K
1373	CV-2015-0004463-OC	2016-05-05		300.00	Allison Julie K
1374	CV-2015-0004463-OC	2016-05-05		300.00	Allison Julie K
1375	CV-2015-0004463-OC	2016-05-05		300.00	Allison Julie K
1376	CV-2015-0004463-OC	2016-05-05		300.00	Allison Julie K
1377	CV-2015-0004201-OC	2016-05-02		300.00	Widerburg Ryan Lane
1378	CV-2015-0004201-OC	2016-05-02		300.00	Widerburg Ryan Lane
1379	CV-2015-0004201-OC	2016-05-02		300.00	Widerburg Ryan Lane
1380	CV-2015-0004201-OC	2016-05-02		300.00	Widerburg Ryan Lane
1381	CV-2015-0004201-OC	2016-05-02		300.00	Widerburg Ryan Lane
1382	CV-2015-0003556-OC	2017-08-22		300.00	Rodriguez Jorge
1383	CV-2015-0003556-OC	2017-08-22		300.00	Rodriguez Jorge
1384	CV-2015-0003556-OC	2017-08-22		300.00	Rodriguez Jorge
1385	CV-2015-0003556-OC	2017-08-22		300.00	Rodriguez Jorge
1386	CV-2015-0003556-OC	2017-08-22		300.00	Rodriguez Jorge
1387	CV-2015-0003472-OC	2016-05-20		300.00	Stoneburner Joshua
1388	CV-2015-0003472-OC	2016-05-20		300.00	Stoneburner Joshua
1389	CV-2015-0003472-OC	2016-05-20		300.00	Stoneburner Joshua
1390	CV-2015-0003472-OC	2016-05-20		300.00	Stoneburner Joshua
1391	CV-2015-0003472-OC	2016-05-20		300.00	Stoneburner Joshua
1392	CV-2015-0003256-OC	2016-03-17		300.00	Potter Angela Dawn
1393	CV-2015-0003256-OC	2016-03-17		300.00	Potter Angela Dawn
1394	CV-2015-0003256-OC	2016-03-17		300.00	Potter Angela Dawn
1395	CV-2015-0003256-OC	2016-03-17		300.00	Potter Angela Dawn
1396	CV-2015-0003256-OC	2016-03-17		300.00	Potter Angela Dawn
1397	CV-2015-0002573-OC	2015-12-18		300.00	Terry John W
1398	CV-2015-0002573-OC	2015-12-18		300.00	Terry John W
1399	CV-2015-0002573-OC	2015-12-18		300.00	Terry John W
1400	CV-2015-0002573-OC	2015-12-18		300.00	Terry John W
1401	CV-2015-0002573-OC	2015-12-18		300.00	Terry John W
1402	CV-2015-0002498-OC	2016-03-17		300.00	Curzon Blaine
1403	CV-2015-0002498-OC	2016-03-17		300.00	Curzon Blaine
1404	CV-2015-0002498-OC	2016-03-17		300.00	Curzon Blaine
1405	CV-2015-0002498-OC	2016-03-17		300.00	Curzon Blaine
1406	CV-2015-0002498-OC	2016-03-17		300.00	Curzon Blaine
1407	CV-2015-0002314-OC	2016-04-29		300.00	Malott Demi R
1408	CV-2015-0002314-OC	2016-04-29		300.00	Malott Demi R
1409	CV-2015-0002314-OC	2016-04-29		300.00	Malott Demi R
1410	CV-2015-0002314-OC	2016-04-29		300.00	Malott Demi R
1411	CV-2015-0002314-OC	2016-04-29		300.00	Malott Demi R
1412	CV-2015-0002119-OC	2016-08-22		300.00	Rentelman Tabitha Ineez
1413	CV-2015-0002119-OC	2016-08-22		300.00	Rentelman Tabitha Ineez
1414	CV-2015-0002119-OC	2016-08-22		300.00	Rentelman Tabitha Ineez
1415	CV-2015-0002119-OC	2016-08-22		300.00	Rentelman Tabitha Ineez
1416	CV-2015-0002119-OC	2016-08-22		300.00	Rentelman Tabitha Ineez
1417	CV-2015-0002091-OC	2016-05-05		300.00	Sanchez Letesha Marie
1418	CV-2015-0002091-OC	2016-12-13		0.00	***NOT FOUND WARRANT****
1419	CV-2015-0002091-OC	2016-05-05		300.00	Sanchez Letesha Marie
1420	CV-2015-0002091-OC	2016-12-13		0.00	***NOT FOUND WARRANT****
1421	CV-2015-0002091-OC	2016-05-05		300.00	Sanchez Letesha Marie
1422	CV-2015-0002091-OC	2016-12-13		0.00	***NOT FOUND WARRANT****
1423	CV-2015-0002091-OC	2016-05-05		300.00	Sanchez Letesha Marie
1424	CV-2015-0002091-OC	2016-12-13		0.00	***NOT FOUND WARRANT****
1425	CV-2015-0002091-OC	2016-05-05		300.00	Sanchez Letesha Marie
1426	CV-2015-0002091-OC	2016-12-13		0.00	***NOT FOUND WARRANT****
1427	CV-2015-0002063-OC	2015-12-01		300.00	(Original Warrant to Sheriff's Office)
1428	CV-2015-0002063-OC	2015-12-01		300.00	(Original Warrant to Sheriff's Office)
1429	CV-2015-0002063-OC	2015-12-01		300.00	(Original Warrant to Sheriff's Office)
1430	CV-2015-0002063-OC	2015-12-01		300.00	(Original Warrant to Sheriff's Office)
1431	CV-2015-0002063-OC	2015-12-01		300.00	(Original Warrant to Sheriff's Office)
1432	CV-2015-0001925-OC	2017-06-16		300.00	Ramirez Gabriel
1433	CV-2015-0001925-OC	2017-06-16		300.00	Ramirez Gabriel
1434	CV-2015-0001925-OC	2017-06-16		300.00	Ramirez Gabriel
1435	CV-2015-0001925-OC	2017-06-16		300.00	Ramirez Gabriel
1436	CV-2015-0001925-OC	2017-06-16		300.00	Ramirez Gabriel
1437	CV-2015-0001808-OC	2017-05-22		300.00	Gonzalez Luis M
1438	CV-2015-0001808-OC	2017-05-22		300.00	Gonzalez Luis M
1439	CV-2015-0001808-OC	2017-05-22		300.00	Gonzalez Luis M
1440	CV-2015-0001808-OC	2017-05-22		300.00	Gonzalez Luis M
1441	CV-2015-0001808-OC	2017-05-22		300.00	Gonzalez Luis M
1442	CV-2015-0001642-OC	2016-03-17		300.00	Beckstead Dustin
1443	CV-2015-0001642-OC	2017-08-04		300.00	Beckstead Dustin
1444	CV-2015-0001642-OC	2016-03-17		300.00	Beckstead Dustin
1445	CV-2015-0001642-OC	2017-08-04		300.00	Beckstead Dustin
1446	CV-2015-0001642-OC	2016-03-17		300.00	Beckstead Dustin
1447	CV-2015-0001642-OC	2017-08-04		300.00	Beckstead Dustin
1448	CV-2015-0001642-OC	2016-03-17		300.00	Beckstead Dustin
1449	CV-2015-0001642-OC	2017-08-04		300.00	Beckstead Dustin
1450	CV-2015-0001642-OC	2016-03-17		300.00	Beckstead Dustin
1451	CV-2015-0001642-OC	2017-08-04		300.00	Beckstead Dustin
1452	CV-2015-0001597-OC	2016-11-22		500.00	Bird Bryan
1453	CV-2015-0001597-OC	2016-11-22		500.00	Bird Bryan
1454	CV-2015-0001597-OC	2016-11-22		500.00	Bird Bryan
1455	CV-2015-0001597-OC	2016-11-22		500.00	Bird Bryan
1456	CV-2015-0001597-OC	2016-11-22		500.00	Bird Bryan
1457	CV-2015-0000614-OC	2015-11-03		500.00	Higgins Kevin
1458	CV-2015-0000614-OC	2016-12-19		300.00	Higgins Kevin
1459	CV-2015-0000614-OC	2017-02-02	Warrant	0.00	Warrant
1460	CV-2015-0000614-OC	2015-11-03		500.00	Higgins Kevin
1461	CV-2015-0000614-OC	2016-12-19		300.00	Higgins Kevin
1462	CV-2015-0000614-OC	2017-02-02	Warrant	0.00	Warrant
1463	CV-2015-0000614-OC	2015-11-03		500.00	Higgins Kevin
1464	CV-2015-0000614-OC	2016-12-19		300.00	Higgins Kevin
1465	CV-2015-0000614-OC	2017-02-02	Warrant	0.00	Warrant
1466	CV-2015-0000614-OC	2015-11-03		500.00	Higgins Kevin
1467	CV-2015-0000614-OC	2016-12-19		300.00	Higgins Kevin
1468	CV-2015-0000614-OC	2017-02-02	Warrant	0.00	Warrant
1469	CV-2015-0000614-OC	2015-11-03		500.00	Higgins Kevin
1470	CV-2015-0000614-OC	2016-12-19		300.00	Higgins Kevin
1471	CV-2015-0000614-OC	2017-02-02	Warrant	0.00	Warrant
1472	CV-2014-0006857-OC	2017-07-27		300.00	Rydalch Bonnie
1473	CV-2014-0006857-OC	2017-07-27		300.00	Rydalch Bonnie
1474	CV-2014-0006857-OC	2017-07-27		300.00	Rydalch Bonnie
1475	CV-2014-0006857-OC	2017-07-27		300.00	Rydalch Bonnie
1476	CV-2014-0006857-OC	2017-07-27		300.00	Rydalch Bonnie
1477	CV-2014-0006856-OC	2016-06-01		300.00	Albertson Danial Burton
1478	CV-2014-0006856-OC	2017-03-21		300.00	Albertson Sara
1479	CV-2014-0006856-OC	2017-04-20		300.00	Albertson Sara - ORIGINAL WARRANT SENT TO BRYAN ZOLLINGER'S OFFICE
1480	CV-2014-0006856-OC	2016-06-01		300.00	Albertson Danial Burton
1481	CV-2014-0006856-OC	2017-03-21		300.00	Albertson Sara
1482	CV-2014-0006856-OC	2017-04-20		300.00	Albertson Sara - ORIGINAL WARRANT SENT TO BRYAN ZOLLINGER'S OFFICE
1483	CV-2014-0006856-OC	2016-06-01		300.00	Albertson Danial Burton
1484	CV-2014-0006856-OC	2017-03-21		300.00	Albertson Sara
1485	CV-2014-0006856-OC	2017-04-20		300.00	Albertson Sara - ORIGINAL WARRANT SENT TO BRYAN ZOLLINGER'S OFFICE
1486	CV-2014-0006856-OC	2016-06-01		300.00	Albertson Danial Burton
1487	CV-2014-0006856-OC	2017-03-21		300.00	Albertson Sara
1488	CV-2014-0006856-OC	2017-04-20		300.00	Albertson Sara - ORIGINAL WARRANT SENT TO BRYAN ZOLLINGER'S OFFICE
1489	CV-2014-0006856-OC	2016-06-01		300.00	Albertson Danial Burton
1490	CV-2014-0006856-OC	2017-03-21		300.00	Albertson Sara
1491	CV-2014-0006856-OC	2017-04-20		300.00	Albertson Sara - ORIGINAL WARRANT SENT TO BRYAN ZOLLINGER'S OFFICE
1492	CV-2014-0006816-OC	2015-12-18		300.00	Andra Travis
1493	CV-2014-0006816-OC	2015-12-18		300.00	Andra Travis
1494	CV-2014-0006816-OC	2015-12-18		300.00	Andra Travis
1495	CV-2014-0006816-OC	2015-12-18		300.00	Andra Travis
1496	CV-2014-0006816-OC	2015-12-18		300.00	Andra Travis
1497	CV-2014-0006179-OC	2017-03-20		300.00	Peterson Saleena
1498	CV-2014-0006179-OC	2017-03-20		300.00	Peterson Saleena
1499	CV-2014-0006179-OC	2017-03-20		300.00	Peterson Saleena
1500	CV-2014-0006179-OC	2017-03-20		300.00	Peterson Saleena
1501	CV-2014-0006179-OC	2017-03-20		300.00	Peterson Saleena
1502	CV-2014-0006085-OC	2016-03-21		300.00	Merrill Kelli
1503	CV-2014-0006085-OC	2016-03-21		300.00	Merrill Kelli
1504	CV-2014-0006085-OC	2016-03-21		300.00	Merrill Kelli
1505	CV-2014-0006085-OC	2016-03-21		300.00	Merrill Kelli
1506	CV-2014-0006085-OC	2016-03-21		300.00	Merrill Kelli
1507	CV-2014-0005765-OC	2016-04-29		300.00	Chapin Benjamin
1508	CV-2014-0005765-OC	2016-04-29		300.00	Chapin Benjamin
1509	CV-2014-0005765-OC	2016-04-29		300.00	Chapin Benjamin
1510	CV-2014-0005765-OC	2016-04-29		300.00	Chapin Benjamin
1511	CV-2014-0005765-OC	2016-04-29		300.00	Chapin Benjamin
1512	CV-2014-0005451-OC	2015-12-18		300.00	Salinas Jesus
1513	CV-2014-0005451-OC	2016-02-09		300.00	Salinas Jesus
1514	CV-2014-0005451-OC	2015-12-18		300.00	Salinas Jesus
1515	CV-2014-0005451-OC	2016-02-09		300.00	Salinas Jesus
1516	CV-2014-0005451-OC	2015-12-18		300.00	Salinas Jesus
1517	CV-2014-0005451-OC	2016-02-09		300.00	Salinas Jesus
1518	CV-2014-0005451-OC	2015-12-18		300.00	Salinas Jesus
1519	CV-2014-0005451-OC	2016-02-09		300.00	Salinas Jesus
1520	CV-2014-0005451-OC	2015-12-18		300.00	Salinas Jesus
1521	CV-2014-0005451-OC	2016-02-09		300.00	Salinas Jesus
1522	CV-2014-0005372-OC	2015-10-05		4518.70	Deblase Jamen Cory
1523	CV-2014-0005372-OC	2015-10-05		4518.70	Deblase Jamen Cory
1524	CV-2014-0005372-OC	2015-10-05		4518.70	Deblase Jamen Cory
1525	CV-2014-0005372-OC	2015-10-05		4518.70	Deblase Jamen Cory
1526	CV-2014-0005372-OC	2015-10-05		4518.70	Deblase Jamen Cory
1527	CV-2014-0004592-OC	2015-12-03		300.00	Benson Lisa Dawn
1528	CV-2014-0004592-OC	2015-12-03		300.00	Benson Lisa Dawn
1529	CV-2014-0004592-OC	2015-12-03		300.00	Benson Lisa Dawn
1530	CV-2014-0004592-OC	2015-12-03		300.00	Benson Lisa Dawn
1531	CV-2014-0004592-OC	2015-12-03		300.00	Benson Lisa Dawn
1532	CV-2014-0002614-OC	2015-11-17		500.00	Bunch Andrew
1533	CV-2014-0002614-OC	2015-11-17		500.00	Bunch Andrew
1534	CV-2014-0002614-OC	2015-11-17		500.00	Bunch Andrew
1535	CV-2014-0002614-OC	2015-11-17		500.00	Bunch Andrew
1536	CV-2014-0002614-OC	2015-11-17		500.00	Bunch Andrew
1537	CV-2014-0001515-OC	2015-11-03		500.00	Kirchner Standley
1538	CV-2014-0001515-OC	2015-11-03		500.00	Kirchner Standley
1539	CV-2014-0001515-OC	2015-11-03		500.00	Kirchner Standley
1540	CV-2014-0001515-OC	2015-11-03		500.00	Kirchner Standley
1541	CV-2014-0001515-OC	2015-11-03		500.00	Kirchner Standley
1542	CV-2014-0001359-OC	2015-12-03		300.00	Nunez Jacqueline Angelica
1543	CV-2014-0001359-OC	2015-12-03		300.00	Nunez Jacqueline Angelica
1544	CV-2014-0001359-OC	2015-12-03		300.00	Nunez Jacqueline Angelica
1545	CV-2014-0001359-OC	2015-12-03		300.00	Nunez Jacqueline Angelica
1546	CV-2014-0001359-OC	2015-12-03		300.00	Nunez Jacqueline Angelica
1547	CV-2014-0000613-OC	2015-12-18		300.00	Matthews Jami L
1548	CV-2014-0000613-OC	2015-12-18		300.00	Matthews Jami L
1549	CV-2014-0000613-OC	2015-12-18		300.00	Matthews Jami L
1550	CV-2014-0000613-OC	2015-12-18		300.00	Matthews Jami L
1551	CV-2014-0000613-OC	2015-12-18		300.00	Matthews Jami L
1552	CV-2013-0006681-OC	2016-03-17		300.00	Rodriguez Krystal
1553	CV-2013-0006681-OC	2016-03-17		300.00	Rodriguez Krystal
1554	CV-2013-0006681-OC	2016-03-17		300.00	Rodriguez Krystal
1555	CV-2013-0006681-OC	2016-03-17		300.00	Rodriguez Krystal
1556	CV-2013-0006681-OC	2016-03-17		300.00	Rodriguez Krystal
1557	CV-2013-0006369-OC	2015-11-25		300.00	Fowers Richard D
1558	CV-2013-0006369-OC	2015-11-25		300.00	Fowers Richard D
1559	CV-2013-0006369-OC	2015-11-25		300.00	Fowers Richard D
1560	CV-2013-0006369-OC	2015-11-25		300.00	Fowers Richard D
1561	CV-2013-0006369-OC	2015-11-25		300.00	Fowers Richard D
1562	CV-2013-0006155-OC	2015-12-03		300.00	Gasser Tobe
1563	CV-2013-0006155-OC	2016-04-11		500.00	Gasser Tobe
1564	CV-2013-0006155-OC	2016-08-31		300.00	Gasser Tobe
1565	CV-2013-0006155-OC	2015-12-03		300.00	Gasser Tobe
1566	CV-2013-0006155-OC	2016-04-11		500.00	Gasser Tobe
1567	CV-2013-0006155-OC	2016-08-31		300.00	Gasser Tobe
1568	CV-2013-0006155-OC	2015-12-03		300.00	Gasser Tobe
1569	CV-2013-0006155-OC	2016-04-11		500.00	Gasser Tobe
1570	CV-2013-0006155-OC	2016-08-31		300.00	Gasser Tobe
1571	CV-2013-0006155-OC	2015-12-03		300.00	Gasser Tobe
1572	CV-2013-0006155-OC	2016-04-11		500.00	Gasser Tobe
1573	CV-2013-0006155-OC	2016-08-31		300.00	Gasser Tobe
1574	CV-2013-0006155-OC	2015-12-03		300.00	Gasser Tobe
1575	CV-2013-0006155-OC	2016-04-11		500.00	Gasser Tobe
1576	CV-2013-0006155-OC	2016-08-31		300.00	Gasser Tobe
1577	CV-2013-0006041-OC	2015-12-03		300.00	Hunsaker Tami
1578	CV-2013-0006041-OC	2015-12-03		300.00	Hunsaker Tami
1579	CV-2013-0006041-OC	2015-12-03		300.00	Hunsaker Tami
1580	CV-2013-0006041-OC	2015-12-03		300.00	Hunsaker Tami
1581	CV-2013-0006041-OC	2015-12-03		300.00	Hunsaker Tami
1582	CV-2013-0005994-OC	2015-10-09		903.71	Whipple Duane Jr.
1583	CV-2013-0005994-OC	2015-11-03		910.28	Whipple Duane Jr.
1584	CV-2013-0005994-OC	2015-11-25		903.71	Whipple Duane Jr.
1585	CV-2013-0005994-OC	2015-10-09		903.71	Whipple Duane Jr.
1586	CV-2013-0005994-OC	2015-11-03		910.28	Whipple Duane Jr.
1587	CV-2013-0005994-OC	2015-11-25		903.71	Whipple Duane Jr.
1588	CV-2013-0005994-OC	2015-10-09		903.71	Whipple Duane Jr.
1589	CV-2013-0005994-OC	2015-11-03		910.28	Whipple Duane Jr.
1590	CV-2013-0005994-OC	2015-11-25		903.71	Whipple Duane Jr.
1591	CV-2013-0005994-OC	2015-10-09		903.71	Whipple Duane Jr.
1592	CV-2013-0005994-OC	2015-11-03		910.28	Whipple Duane Jr.
1593	CV-2013-0005994-OC	2015-11-25		903.71	Whipple Duane Jr.
1594	CV-2013-0005994-OC	2015-10-09		903.71	Whipple Duane Jr.
1595	CV-2013-0005994-OC	2015-11-03		910.28	Whipple Duane Jr.
1596	CV-2013-0005994-OC	2015-11-25		903.71	Whipple Duane Jr.
1597	CV-2013-0005959-OC	2017-06-12	Fail to Obey Court Order and appear for Debtor Hearing	300.00	Wood Raymond
1598	CV-2013-0005959-OC	2017-06-12	Fail to Obey Court Order and appear for Debtor Hearing	300.00	Wood Raymond
1599	CV-2013-0005959-OC	2017-06-12	Fail to Obey Court Order and appear for Debtor Hearing	300.00	Wood Raymond
1600	CV-2013-0005959-OC	2017-06-12	Fail to Obey Court Order and appear for Debtor Hearing	300.00	Wood Raymond
1601	CV-2013-0005959-OC	2017-06-12	Fail to Obey Court Order and appear for Debtor Hearing	300.00	Wood Raymond
1602	CV-2013-0005277-OC	2016-03-17		300.00	Francis Stephanie E
1603	CV-2013-0005277-OC	2016-03-17		300.00	Francis Stephanie E
1604	CV-2013-0005277-OC	2016-03-17		300.00	Francis Stephanie E
1605	CV-2013-0005277-OC	2016-03-17		300.00	Francis Stephanie E
1606	CV-2013-0005277-OC	2016-03-17		300.00	Francis Stephanie E
1607	CV-2013-0004578-OC	2015-12-18		300.00	Brink Jeffrey
1608	CV-2013-0004578-OC	2015-12-18		300.00	Brink Jeffrey
1609	CV-2013-0004578-OC	2015-12-18		300.00	Brink Jeffrey
1610	CV-2013-0004578-OC	2015-12-18		300.00	Brink Jeffrey
1611	CV-2013-0004578-OC	2015-12-18		300.00	Brink Jeffrey
1612	CV-2013-0003303-OC	2017-04-19		300.00	Olson Dalena D.
1613	CV-2013-0003303-OC	2017-04-19		300.00	Olson Dalena D.
1614	CV-2013-0003303-OC	2017-04-19		300.00	Olson Dalena D.
1615	CV-2013-0003303-OC	2017-04-19		300.00	Olson Dalena D.
1616	CV-2013-0003303-OC	2017-04-19		300.00	Olson Dalena D.
1617	CV-2013-0003192-OC	2015-09-22		500.00	Swanson Monica
1618	CV-2013-0003192-OC	2015-11-18	(Hearing	0.00	Re Request for Warrant
1619	CV-2013-0003192-OC	2015-12-15	on 12/15/2015 01:30 PM:	0.00	Re Request for Warrant
1620	CV-2013-0003192-OC	2015-09-22		500.00	Swanson Monica
1621	CV-2013-0003192-OC	2015-11-18	(Hearing	0.00	Re Request for Warrant
1622	CV-2013-0003192-OC	2015-12-15	on 12/15/2015 01:30 PM:	0.00	Re Request for Warrant
1623	CV-2013-0003192-OC	2015-09-22		500.00	Swanson Monica
1624	CV-2013-0003192-OC	2015-11-18	(Hearing	0.00	Re Request for Warrant
1625	CV-2013-0003192-OC	2015-12-15	on 12/15/2015 01:30 PM:	0.00	Re Request for Warrant
1626	CV-2013-0003192-OC	2015-09-22		500.00	Swanson Monica
1627	CV-2013-0003192-OC	2015-11-18	(Hearing	0.00	Re Request for Warrant
1628	CV-2013-0003192-OC	2015-12-15	on 12/15/2015 01:30 PM:	0.00	Re Request for Warrant
1629	CV-2013-0003192-OC	2015-09-22		500.00	Swanson Monica
1630	CV-2013-0003192-OC	2015-11-18	(Hearing	0.00	Re Request for Warrant
1631	CV-2013-0003192-OC	2015-12-15	on 12/15/2015 01:30 PM:	0.00	Re Request for Warrant
1632	CV-2013-0002901-OC	2015-12-18		300.00	Trueblood Krystal F
1633	CV-2013-0002901-OC	2015-12-18		300.00	Trueblood Krystal F
1634	CV-2013-0002901-OC	2015-12-18		300.00	Trueblood Krystal F
1635	CV-2013-0002901-OC	2015-12-18		300.00	Trueblood Krystal F
1636	CV-2013-0002901-OC	2015-12-18		300.00	Trueblood Krystal F
1637	CV-2013-0001690-OC	2015-03-09		500.00	Harrington William B
1638	CV-2013-0001690-OC	2015-03-09		500.00	Harrington William B
1639	CV-2013-0001690-OC	2015-03-09		500.00	Harrington William B
1640	CV-2013-0001690-OC	2015-03-09		500.00	Harrington William B
1641	CV-2013-0001690-OC	2015-03-09		500.00	Harrington William B
1642	CV-2013-0000950-OC	2016-02-18		300.00	Hernandez Angel
1643	CV-2013-0000950-OC	2016-02-18		300.00	Hernandez Angel
1644	CV-2013-0000950-OC	2016-02-18		300.00	Hernandez Angel
1645	CV-2013-0000950-OC	2016-02-18		300.00	Hernandez Angel
1646	CV-2013-0000950-OC	2016-02-18		300.00	Hernandez Angel
1647	CV-2012-0006005-OC	2015-01-20		0.00	Johnson Linda M
1648	CV-2012-0006005-OC	2015-01-20		0.00	Johnson Linda M
1649	CV-2012-0006005-OC	2015-01-20		0.00	Johnson Linda M
1650	CV-2012-0006005-OC	2015-01-20		0.00	Johnson Linda M
1651	CV-2012-0006005-OC	2015-01-20		0.00	Johnson Linda M
1652	CV-2012-0005409-OC	2015-02-05		0.00	Waid Brittney Lynn
1653	CV-2012-0005409-OC	2015-02-05		0.00	Waid Brittney Lynn
1654	CV-2012-0005409-OC	2015-02-05		0.00	Waid Brittney Lynn
1655	CV-2012-0005409-OC	2015-02-05		0.00	Waid Brittney Lynn
1656	CV-2012-0005409-OC	2015-02-05		0.00	Waid Brittney Lynn
1657	CV-2012-0003329-OC	2017-02-21		300.00	Hansen Justin
1658	CV-2012-0003329-OC	2017-05-22		300.00	Hansen Justin
1659	CV-2012-0003329-OC	2017-05-26		0.00	Recalled Return of Service - Warrant
1660	CV-2012-0003329-OC	2017-02-21		300.00	Hansen Justin
1661	CV-2012-0003329-OC	2017-05-22		300.00	Hansen Justin
1662	CV-2012-0003329-OC	2017-05-26		0.00	Recalled Return of Service - Warrant
1663	CV-2012-0003329-OC	2017-02-21		300.00	Hansen Justin
1664	CV-2012-0003329-OC	2017-05-22		300.00	Hansen Justin
1665	CV-2012-0003329-OC	2017-05-26		0.00	Recalled Return of Service - Warrant
1666	CV-2012-0003329-OC	2017-02-21		300.00	Hansen Justin
1667	CV-2012-0003329-OC	2017-05-22		300.00	Hansen Justin
1668	CV-2012-0003329-OC	2017-05-26		0.00	Recalled Return of Service - Warrant
1669	CV-2012-0003329-OC	2017-02-21		300.00	Hansen Justin
1670	CV-2012-0003329-OC	2017-05-22		300.00	Hansen Justin
1671	CV-2012-0003329-OC	2017-05-26		0.00	Recalled Return of Service - Warrant
1672	CV-2012-0002242-OC	2016-01-05		300.00	Goodson Rebecca
1673	CV-2012-0002242-OC	2016-01-05		300.00	Goodson Rebecca
1674	CV-2012-0002242-OC	2016-01-05		300.00	Goodson Rebecca
1675	CV-2012-0002242-OC	2016-01-05		300.00	Goodson Rebecca
1676	CV-2012-0002242-OC	2016-01-05		300.00	Goodson Rebecca
1677	CV-2011-0006751-OC	2015-08-26		1348.07	Crane Brooke K.
1678	CV-2011-0006751-OC	2015-10-05		1348.07	Crane Brooke K.
1679	CV-2011-0006751-OC	2015-08-26		1348.07	Crane Brooke K.
1680	CV-2011-0006751-OC	2015-10-05		1348.07	Crane Brooke K.
1681	CV-2011-0006751-OC	2015-08-26		1348.07	Crane Brooke K.
1682	CV-2011-0006751-OC	2015-10-05		1348.07	Crane Brooke K.
1683	CV-2011-0006751-OC	2015-08-26		1348.07	Crane Brooke K.
1684	CV-2011-0006751-OC	2015-10-05		1348.07	Crane Brooke K.
1685	CV-2011-0006751-OC	2015-08-26		1348.07	Crane Brooke K.
1686	CV-2011-0006751-OC	2015-10-05		1348.07	Crane Brooke K.
1687	CV-2011-0006548-OC	2017-06-16		300.00	Trejo Todd
1688	CV-2011-0006548-OC	2017-06-16		300.00	Trejo Todd
1689	CV-2011-0006548-OC	2017-06-16		300.00	Trejo Todd
1690	CV-2011-0006548-OC	2017-06-16		300.00	Trejo Todd
1691	CV-2011-0006548-OC	2017-06-16		300.00	Trejo Todd
1692	CV-2011-0005102-OC	2017-07-24		300.00	Briggs Trisha
1693	CV-2011-0005102-OC	2017-07-24		300.00	Briggs Trisha
1694	CV-2011-0005102-OC	2017-07-24		300.00	Briggs Trisha
1695	CV-2011-0005102-OC	2017-07-24		300.00	Briggs Trisha
1696	CV-2011-0005102-OC	2017-07-24		300.00	Briggs Trisha
1697	CV-2011-0001941-OC	2015-11-30		300.00	Veldkamp Keith
1698	CV-2011-0001941-OC	2015-11-30		300.00	Veldkamp Keith
1699	CV-2011-0001941-OC	2015-11-30		300.00	Veldkamp Keith
1700	CV-2011-0001941-OC	2015-11-30		300.00	Veldkamp Keith
1701	CV-2011-0001941-OC	2015-11-30		300.00	Veldkamp Keith
1702	CV-2011-0000984-OC	2011-10-27		500.00	Shigley Mark
1703	CV-2011-0000984-OC	2011-10-27		500.00	Shigley Mark
1704	CV-2011-0000984-OC	2011-10-27		500.00	Shigley Mark
1705	CV-2011-0000984-OC	2011-10-27		500.00	Shigley Mark
1706	CV-2011-0000984-OC	2011-10-27		500.00	Shigley Mark
1707	CV-2011-0000709-OC	2011-07-06		500.00	Medical Recovery Services LLC
1708	CV-2011-0000709-OC	2011-07-06		500.00	Stuart Stephanie Gail
1709	CV-2011-0000709-OC	2011-07-06		500.00	Medical Recovery Services LLC
1710	CV-2011-0000709-OC	2011-07-06		500.00	Stuart Stephanie Gail
1711	CV-2011-0000709-OC	2011-07-06		500.00	Medical Recovery Services LLC
1712	CV-2011-0000709-OC	2011-07-06		500.00	Stuart Stephanie Gail
1713	CV-2011-0000709-OC	2011-07-06		500.00	Medical Recovery Services LLC
1714	CV-2011-0000709-OC	2011-07-06		500.00	Stuart Stephanie Gail
1715	CV-2011-0000709-OC	2011-07-06		500.00	Medical Recovery Services LLC
1716	CV-2011-0000709-OC	2011-07-06		500.00	Stuart Stephanie Gail
1717	CV-2010-0007011-OC	2011-05-19		500.00	McCracken Charles
1718	CV-2010-0007011-OC	2011-05-19		500.00	McCracken Charles
1719	CV-2010-0007011-OC	2011-05-19		500.00	McCracken Charles
1720	CV-2010-0007011-OC	2011-05-19		500.00	McCracken Charles
1721	CV-2010-0007011-OC	2011-05-19		500.00	McCracken Charles
1722	CV-2010-0006839-OC	2016-05-02		300.00	Sanchez Maria
1723	CV-2010-0006839-OC	2016-05-02		300.00	Sanchez Maria
1724	CV-2010-0006839-OC	2016-05-02		300.00	Sanchez Maria
1725	CV-2010-0006839-OC	2016-05-02		300.00	Sanchez Maria
1726	CV-2010-0006839-OC	2016-05-02		300.00	Sanchez Maria
1727	CV-2010-0006109-OC	2011-03-21		500.00	Bierma Jackielyn
1728	CV-2010-0006109-OC	2011-03-21		500.00	Bierma Jackielyn
1729	CV-2010-0006109-OC	2011-03-21		500.00	Bierma Jackielyn
1730	CV-2010-0006109-OC	2011-03-21		500.00	Bierma Jackielyn
1731	CV-2010-0006109-OC	2011-03-21		500.00	Bierma Jackielyn
1732	CV-2010-0006105-OC	2015-02-05		0.00	Ockerman Mark K
1733	CV-2010-0006105-OC	2015-02-05		0.00	Ockerman Mark K
1734	CV-2010-0006105-OC	2015-02-05		0.00	Ockerman Mark K
1735	CV-2010-0006105-OC	2015-02-05		0.00	Ockerman Mark K
1736	CV-2010-0006105-OC	2015-02-05		0.00	Ockerman Mark K
1737	CV-2010-0005619-OC	2011-03-24		500.00	Resendiz Shawn
1738	CV-2010-0005619-OC	2011-03-24		500.00	Resendiz Shawn
1739	CV-2010-0005619-OC	2011-03-24		500.00	Resendiz Shawn
1740	CV-2010-0005619-OC	2011-03-24		500.00	Resendiz Shawn
1741	CV-2010-0005619-OC	2011-03-24		500.00	Resendiz Shawn
1742	CV-2010-0005615-OC	2011-07-07		500.00	Messick Dustin
1743	CV-2010-0005615-OC	2011-07-07		500.00	Messick Dustin
1744	CV-2010-0005615-OC	2011-07-07		500.00	Messick Dustin
1745	CV-2010-0005615-OC	2011-07-07		500.00	Messick Dustin
1746	CV-2010-0005615-OC	2011-07-07		500.00	Messick Dustin
1747	CV-2010-0004722-OC	2011-01-19		500.00	Medical Recovery Services LLC
1748	CV-2010-0004722-OC	2011-01-19		500.00	Hoffman Robyn
1749	CV-2010-0004722-OC	2011-01-19		500.00	Medical Recovery Services LLC
1750	CV-2010-0004722-OC	2011-01-19		500.00	Hoffman Robyn
1751	CV-2010-0004722-OC	2011-01-19		500.00	Medical Recovery Services LLC
1752	CV-2010-0004722-OC	2011-01-19		500.00	Hoffman Robyn
1753	CV-2010-0004722-OC	2011-01-19		500.00	Medical Recovery Services LLC
1754	CV-2010-0004722-OC	2011-01-19		500.00	Hoffman Robyn
1755	CV-2010-0004722-OC	2011-01-19		500.00	Medical Recovery Services LLC
1756	CV-2010-0004722-OC	2011-01-19		500.00	Hoffman Robyn
1757	CV-2010-0004449-OC	2011-05-17		500.00	Demma Shelly
1758	CV-2010-0004449-OC	2011-05-17		500.00	Demma Shelly
1759	CV-2010-0004449-OC	2011-05-17		500.00	Demma Shelly
1760	CV-2010-0004449-OC	2011-05-17		500.00	Demma Shelly
1761	CV-2010-0004449-OC	2011-05-17		500.00	Demma Shelly
1762	CV-2010-0004265-OC	2011-03-24		500.00	De La Vega Eusebio
1763	CV-2010-0004265-OC	2011-03-24		500.00	De La Vega Eusebio
1764	CV-2010-0004265-OC	2011-03-24		500.00	De La Vega Eusebio
1765	CV-2010-0004265-OC	2011-03-24		500.00	De La Vega Eusebio
1766	CV-2010-0004265-OC	2011-03-24		500.00	De La Vega Eusebio
1767	CV-2010-0004245-OC	2011-02-08		500.00	Tortel Myles B.
1768	CV-2010-0004245-OC	2011-02-08		500.00	Tortel Myles B.
1769	CV-2010-0004245-OC	2011-02-08		500.00	Tortel Myles B.
1770	CV-2010-0004245-OC	2011-02-08		500.00	Tortel Myles B.
1771	CV-2010-0004245-OC	2011-02-08		500.00	Tortel Myles B.
1772	CV-2010-0004046-OC	2011-03-17		500.00	Nielson Zachary Storer
1773	CV-2010-0004046-OC	2011-03-17		500.00	Nielson Zachary Storer
1774	CV-2010-0004046-OC	2011-03-17		500.00	Nielson Zachary Storer
1775	CV-2010-0004046-OC	2011-03-17		500.00	Nielson Zachary Storer
1776	CV-2010-0004046-OC	2011-03-17		500.00	Nielson Zachary Storer
1777	CV-2010-0003975-OC	2011-02-07		500.00	Butchart Karen M
1778	CV-2010-0003975-OC	2011-02-07		500.00	Butchart Karen M
1779	CV-2010-0003975-OC	2011-02-07		500.00	Butchart Karen M
1780	CV-2010-0003975-OC	2011-02-07		500.00	Butchart Karen M
1781	CV-2010-0003975-OC	2011-02-07		500.00	Butchart Karen M
1782	CV-2010-0003523-OC	2011-03-08		500.00	Reed Landen
1783	CV-2010-0003523-OC	2011-03-08		500.00	Reed Landen
1784	CV-2010-0003523-OC	2011-03-08		500.00	Reed Landen
1785	CV-2010-0003523-OC	2011-03-08		500.00	Reed Landen
1786	CV-2010-0003523-OC	2011-03-08		500.00	Reed Landen
1787	CV-2010-0002524-OC	2010-10-18		500.00	Worden Elizabeth
1788	CV-2010-0002524-OC	2010-10-18		500.00	Worden Elizabeth
1789	CV-2010-0002524-OC	2010-10-18		500.00	Worden Elizabeth
1790	CV-2010-0002524-OC	2010-10-18		500.00	Worden Elizabeth
1791	CV-2010-0002524-OC	2010-10-18		500.00	Worden Elizabeth
1792	CV-2010-0002172-OC	2015-10-05		0.00	Charlesworth Glen W
1793	CV-2010-0002172-OC	2015-11-05		7088.13	Charlesworth Glen W
1794	CV-2010-0002172-OC	2015-10-05		0.00	Charlesworth Glen W
1795	CV-2010-0002172-OC	2015-11-05		7088.13	Charlesworth Glen W
1796	CV-2010-0002172-OC	2015-10-05		0.00	Charlesworth Glen W
1797	CV-2010-0002172-OC	2015-11-05		7088.13	Charlesworth Glen W
1798	CV-2010-0002172-OC	2015-10-05		0.00	Charlesworth Glen W
1799	CV-2010-0002172-OC	2015-11-05		7088.13	Charlesworth Glen W
1800	CV-2010-0002172-OC	2015-10-05		0.00	Charlesworth Glen W
1801	CV-2010-0002172-OC	2015-11-05		7088.13	Charlesworth Glen W
1802	CV-2010-0001926-OC	2011-05-19		500.00	Cutler Pat
1803	CV-2010-0001926-OC	2011-05-19		500.00	Cutler Pat
1804	CV-2010-0001926-OC	2011-05-19		500.00	Cutler Pat
1805	CV-2010-0001926-OC	2011-05-19		500.00	Cutler Pat
1806	CV-2010-0001926-OC	2011-05-19		500.00	Cutler Pat
1807	CV-2010-0001787-OC	2011-01-26		500.00	Dashnaw David Sr.
1808	CV-2010-0001787-OC	2011-01-26		500.00	Dashnaw David Sr.
1809	CV-2010-0001787-OC	2011-01-26		500.00	Dashnaw David Sr.
1810	CV-2010-0001787-OC	2011-01-26		500.00	Dashnaw David Sr.
1811	CV-2010-0001787-OC	2011-01-26		500.00	Dashnaw David Sr.
1812	CV-2010-0001779-OC	2011-05-27		500.00	Clarke Nathan W.
1813	CV-2010-0001779-OC	2011-05-27		500.00	Clarke Nathan W.
1814	CV-2010-0001779-OC	2011-05-27		500.00	Clarke Nathan W.
1815	CV-2010-0001779-OC	2011-05-27		500.00	Clarke Nathan W.
1816	CV-2010-0001779-OC	2011-05-27		500.00	Clarke Nathan W.
1817	CV-2010-0001313-OC	2012-01-03		500.00	Jerry Bergeman & Sons
1818	CV-2010-0001313-OC	2012-01-03		500.00	Jerry Bergeman & Sons
1819	CV-2010-0001313-OC	2012-01-03		500.00	Jerry Bergeman & Sons
1820	CV-2010-0001313-OC	2012-01-03		500.00	Jerry Bergeman & Sons
1821	CV-2010-0001313-OC	2012-01-03		500.00	Jerry Bergeman & Sons
1822	CV-2010-0000686-OC	2010-06-28		500.00	Hill Amanda
1823	CV-2010-0000686-OC	2010-06-28		500.00	Hill Amanda
1824	CV-2010-0000686-OC	2010-06-28		500.00	Hill Amanda
1825	CV-2010-0000686-OC	2010-06-28		500.00	Hill Amanda
1826	CV-2010-0000686-OC	2010-06-28		500.00	Hill Amanda
1827	CV-2010-0000484-OC	2011-03-11		0.00	Larsen Linda
1828	CV-2010-0000484-OC	2011-03-11		0.00	Larsen Linda
1829	CV-2010-0000484-OC	2011-03-11		0.00	Larsen Linda
1830	CV-2010-0000484-OC	2011-03-11		0.00	Larsen Linda
1831	CV-2010-0000484-OC	2011-03-11		0.00	Larsen Linda
1832	CV-2010-0000174-OC	2011-04-11		500.00	Ramirez Michael Joseph
1833	CV-2010-0000174-OC	2011-04-11		500.00	Ramirez Michael Joseph
1834	CV-2010-0000174-OC	2011-04-11		500.00	Ramirez Michael Joseph
1835	CV-2010-0000174-OC	2011-04-11		500.00	Ramirez Michael Joseph
1836	CV-2010-0000174-OC	2011-04-11		500.00	Ramirez Michael Joseph
1837	CV-2009-0007582-OC	2011-07-19		500.00	Taylor Tosha
1838	CV-2009-0007582-OC	2011-07-19		500.00	Taylor Tosha
1839	CV-2009-0007582-OC	2011-07-19		500.00	Taylor Tosha
1840	CV-2009-0007582-OC	2011-07-19		500.00	Taylor Tosha
1841	CV-2009-0007582-OC	2011-07-19		500.00	Taylor Tosha
1842	CV-2009-0007469-OC	2010-12-20		500.00	Barrett Brent
1843	CV-2009-0007469-OC	2010-12-20		500.00	Barrett Brent
1844	CV-2009-0007469-OC	2010-12-20		500.00	Barrett Brent
1845	CV-2009-0007469-OC	2010-12-20		500.00	Barrett Brent
1846	CV-2009-0007469-OC	2010-12-20		500.00	Barrett Brent
1847	CV-2009-0007043-OC	2011-11-29		356.57	Dixon Jeanie
1848	CV-2009-0007043-OC	2011-11-29		356.57	Dixon Jeanie
1849	CV-2009-0007043-OC	2011-11-29		356.57	Dixon Jeanie
1850	CV-2009-0007043-OC	2011-11-29		356.57	Dixon Jeanie
1851	CV-2009-0007043-OC	2011-11-29		356.57	Dixon Jeanie
1852	CV-2009-0006463-OC	2010-07-07		500.00	Christensen Camile E.
1853	CV-2009-0006463-OC	2010-12-14		500.00	Christensen Camile E.
1854	CV-2009-0006463-OC	2010-07-07		500.00	Christensen Camile E.
1855	CV-2009-0006463-OC	2010-12-14		500.00	Christensen Camile E.
1856	CV-2009-0006463-OC	2010-07-07		500.00	Christensen Camile E.
1857	CV-2009-0006463-OC	2010-12-14		500.00	Christensen Camile E.
1858	CV-2009-0006463-OC	2010-07-07		500.00	Christensen Camile E.
1859	CV-2009-0006463-OC	2010-12-14		500.00	Christensen Camile E.
1860	CV-2009-0006463-OC	2010-07-07		500.00	Christensen Camile E.
1861	CV-2009-0006463-OC	2010-12-14		500.00	Christensen Camile E.
1862	CV-2009-0006183-OC	2010-02-19		500.00	Walker Lonnie
1863	CV-2009-0006183-OC	2010-02-19		500.00	Walker Lonnie
1864	CV-2009-0006183-OC	2010-02-19		500.00	Walker Lonnie
1865	CV-2009-0006183-OC	2010-02-19		500.00	Walker Lonnie
1866	CV-2009-0006183-OC	2010-02-19		500.00	Walker Lonnie
1867	CV-2009-0005631-OC	2010-08-05		500.00	Brown BurlaJean Baggs
1868	CV-2009-0005631-OC	2010-08-05		500.00	Brown BurlaJean Baggs
1869	CV-2009-0005631-OC	2010-08-05		500.00	Brown BurlaJean Baggs
1870	CV-2009-0005631-OC	2010-08-05		500.00	Brown BurlaJean Baggs
1871	CV-2009-0005631-OC	2010-08-05		500.00	Brown BurlaJean Baggs
1872	CV-2009-0005611-OC	2010-11-16		500.00	Metcalf Matthew C
1873	CV-2009-0005611-OC	2010-11-16		500.00	Metcalf Matthew C
1874	CV-2009-0005611-OC	2010-11-16		500.00	Metcalf Matthew C
1875	CV-2009-0005611-OC	2010-11-16		500.00	Metcalf Matthew C
1876	CV-2009-0005611-OC	2010-11-16		500.00	Metcalf Matthew C
1877	CV-2009-0004929-OC	2010-07-21		500.00	Cartier Todd
1878	CV-2009-0004929-OC	2010-07-21		500.00	Cartier Todd
1879	CV-2009-0004929-OC	2010-07-21		500.00	Cartier Todd
1880	CV-2009-0004929-OC	2010-07-21		500.00	Cartier Todd
1881	CV-2009-0004929-OC	2010-07-21		500.00	Cartier Todd
1882	CV-2009-0004728-OC	2010-06-23		500.00	Nieves Melissa A
1883	CV-2009-0004728-OC	2017-04-17		0.00	Warrant Recall
1884	CV-2009-0004728-OC	2010-06-23		500.00	Nieves Melissa A
1885	CV-2009-0004728-OC	2017-04-17		0.00	Warrant Recall
1886	CV-2009-0004728-OC	2010-06-23		500.00	Nieves Melissa A
1887	CV-2009-0004728-OC	2017-04-17		0.00	Warrant Recall
1888	CV-2009-0004728-OC	2010-06-23		500.00	Nieves Melissa A
1889	CV-2009-0004728-OC	2017-04-17		0.00	Warrant Recall
1890	CV-2009-0004728-OC	2010-06-23		500.00	Nieves Melissa A
1891	CV-2009-0004728-OC	2017-04-17		0.00	Warrant Recall
1892	CV-2009-0003646-OC	2010-01-15		500.00	Brown Lisa M.
1893	CV-2009-0003646-OC	2010-01-15		500.00	Brown Lisa M.
1894	CV-2009-0003646-OC	2010-01-15		500.00	Brown Lisa M.
1895	CV-2009-0003646-OC	2010-01-15		500.00	Brown Lisa M.
1896	CV-2009-0003646-OC	2010-01-15		500.00	Brown Lisa M.
1897	CV-2009-0003222-OC	2009-12-18		500.00	Hosac Gregg Leslie Jr.
1898	CV-2009-0003222-OC	2010-02-02		0.00	Return Of Service - warrant recalled
1899	CV-2009-0003222-OC	2010-09-23		500.00	Hosac Gregg Leslie Jr.
1900	CV-2009-0003222-OC	2009-12-18		500.00	Hosac Gregg Leslie Jr.
1901	CV-2009-0003222-OC	2010-02-02		0.00	Return Of Service - warrant recalled
1902	CV-2009-0003222-OC	2010-09-23		500.00	Hosac Gregg Leslie Jr.
1903	CV-2009-0003222-OC	2009-12-18		500.00	Hosac Gregg Leslie Jr.
1904	CV-2009-0003222-OC	2010-02-02		0.00	Return Of Service - warrant recalled
1905	CV-2009-0003222-OC	2010-09-23		500.00	Hosac Gregg Leslie Jr.
1906	CV-2009-0003222-OC	2009-12-18		500.00	Hosac Gregg Leslie Jr.
1907	CV-2009-0003222-OC	2010-02-02		0.00	Return Of Service - warrant recalled
1908	CV-2009-0003222-OC	2010-09-23		500.00	Hosac Gregg Leslie Jr.
1909	CV-2009-0003222-OC	2009-12-18		500.00	Hosac Gregg Leslie Jr.
1910	CV-2009-0003222-OC	2010-02-02		0.00	Return Of Service - warrant recalled
1911	CV-2009-0003222-OC	2010-09-23		500.00	Hosac Gregg Leslie Jr.
1912	CV-2009-0003178-OC	2009-12-28		500.00	Westfall Kimberly
1913	CV-2009-0003178-OC	2009-12-28		500.00	Westfall Kimberly
1914	CV-2009-0003178-OC	2009-12-28		500.00	Westfall Kimberly
1915	CV-2009-0003178-OC	2009-12-28		500.00	Westfall Kimberly
1916	CV-2009-0003178-OC	2009-12-28		500.00	Westfall Kimberly
1917	CV-2009-0003058-OC	2010-01-15		500.00	Coffman Stella Dawn
1918	CV-2009-0003058-OC	2010-01-15		500.00	Coffman Stella Dawn
1919	CV-2009-0003058-OC	2010-01-15		500.00	Coffman Stella Dawn
1920	CV-2009-0003058-OC	2010-01-15		500.00	Coffman Stella Dawn
1921	CV-2009-0003058-OC	2010-01-15		500.00	Coffman Stella Dawn
1922	CV-2009-0002894-OC	2011-03-21		500.00	Karford Cyndi M
1923	CV-2009-0002894-OC	2011-03-21		500.00	Karford Cyndi M
1924	CV-2009-0002894-OC	2011-03-21		500.00	Karford Cyndi M
1925	CV-2009-0002894-OC	2011-03-21		500.00	Karford Cyndi M
1926	CV-2009-0002894-OC	2011-03-21		500.00	Karford Cyndi M
1927	CV-2009-0002852-OC	2012-09-10		500.00	Thurnwald Amber N.
1928	CV-2009-0002852-OC	2012-09-10		500.00	Thurnwald Amber N.
1929	CV-2009-0002852-OC	2012-09-10		500.00	Thurnwald Amber N.
1930	CV-2009-0002852-OC	2012-09-10		500.00	Thurnwald Amber N.
1931	CV-2009-0002852-OC	2012-09-10		500.00	Thurnwald Amber N.
1932	CV-2009-0002536-OC	2010-02-25		0.00	Return Of Service - Recalled Warrant - Defendant in Jail - Plaintiff met with her at jail and recalled warrant
1933	CV-2009-0002536-OC	2010-02-25		0.00	Return Of Service - Recalled Warrant - Defendant in Jail - Plaintiff met with her at jail and recalled warrant
1934	CV-2009-0002536-OC	2010-02-25		0.00	Return Of Service - Recalled Warrant - Defendant in Jail - Plaintiff met with her at jail and recalled warrant
1935	CV-2009-0002536-OC	2010-02-25		0.00	Return Of Service - Recalled Warrant - Defendant in Jail - Plaintiff met with her at jail and recalled warrant
1936	CV-2009-0002536-OC	2010-02-25		0.00	Return Of Service - Recalled Warrant - Defendant in Jail - Plaintiff met with her at jail and recalled warrant
1937	CV-2009-0002444-OC	2009-12-14		500.00	Welch Heather Lynn
1938	CV-2009-0002444-OC	2009-12-14		500.00	Welch Heather Lynn
1939	CV-2009-0002444-OC	2009-12-14		500.00	Welch Heather Lynn
1940	CV-2009-0002444-OC	2009-12-14		500.00	Welch Heather Lynn
1941	CV-2009-0002444-OC	2009-12-14		500.00	Welch Heather Lynn
1942	CV-2009-0002300-OC	2009-09-08		500.00	Whitfield Michelle M.
1943	CV-2009-0002300-OC	2009-09-08		500.00	Whitfield Michelle M.
1944	CV-2009-0002300-OC	2009-09-08		500.00	Whitfield Michelle M.
1945	CV-2009-0002300-OC	2009-09-08		500.00	Whitfield Michelle M.
1946	CV-2009-0002300-OC	2009-09-08		500.00	Whitfield Michelle M.
1947	CV-2009-0002169-OC	2016-05-24		300.00	Eckley Tiffany Rose
1948	CV-2009-0002169-OC	2016-05-24		300.00	Eckley Tiffany Rose
1949	CV-2009-0002169-OC	2016-05-24		300.00	Eckley Tiffany Rose
1950	CV-2009-0002169-OC	2016-05-24		300.00	Eckley Tiffany Rose
1951	CV-2009-0002169-OC	2016-05-24		300.00	Eckley Tiffany Rose
1952	CV-2009-0001839-OC	2010-11-09		500.00	Smith Barbara
1953	CV-2009-0001839-OC	2010-11-09		500.00	Smith Barbara
1954	CV-2009-0001839-OC	2010-11-09		500.00	Smith Barbara
1955	CV-2009-0001839-OC	2010-11-09		500.00	Smith Barbara
1956	CV-2009-0001839-OC	2010-11-09		500.00	Smith Barbara
1957	CV-2009-0001491-OC	2009-07-28		500.00	Fitch Jason
1958	CV-2009-0001491-OC	2009-07-28		500.00	Fitch Jason
1959	CV-2009-0001491-OC	2009-07-28		500.00	Fitch Jason
1960	CV-2009-0001491-OC	2009-07-28		500.00	Fitch Jason
1961	CV-2009-0001491-OC	2009-07-28		500.00	Fitch Jason
1962	CV-2009-0000887-OC	2009-06-23		500.00	Bird Russell L
1963	CV-2009-0000887-OC	2009-06-23		500.00	Bird Russell L
1964	CV-2009-0000887-OC	2009-06-23		500.00	Bird Russell L
1965	CV-2009-0000887-OC	2009-06-23		500.00	Bird Russell L
1966	CV-2009-0000887-OC	2009-06-23		500.00	Bird Russell L
1967	CV-2009-0000647-OC	2010-12-03		500.00	Watts Kristle Jo
1968	CV-2009-0000647-OC	2011-01-21		0.00	Warrant recalled due to def. being in jail at time of hearing.
1969	CV-2009-0000647-OC	2010-12-03		500.00	Watts Kristle Jo
1970	CV-2009-0000647-OC	2011-01-21		0.00	Warrant recalled due to def. being in jail at time of hearing.
1971	CV-2009-0000647-OC	2010-12-03		500.00	Watts Kristle Jo
1972	CV-2009-0000647-OC	2011-01-21		0.00	Warrant recalled due to def. being in jail at time of hearing.
1973	CV-2009-0000647-OC	2010-12-03		500.00	Watts Kristle Jo
1974	CV-2009-0000647-OC	2011-01-21		0.00	Warrant recalled due to def. being in jail at time of hearing.
1975	CV-2009-0000647-OC	2010-12-03		500.00	Watts Kristle Jo
1976	CV-2009-0000647-OC	2011-01-21		0.00	Warrant recalled due to def. being in jail at time of hearing.
1977	CV-2009-0000517-OC	2009-09-25		500.00	Waggoner Alyssa
1978	CV-2009-0000517-OC	2009-09-25		500.00	Waggoner Alyssa
1979	CV-2009-0000517-OC	2009-09-25		500.00	Waggoner Alyssa
1980	CV-2009-0000517-OC	2009-09-25		500.00	Waggoner Alyssa
1981	CV-2009-0000517-OC	2009-09-25		500.00	Waggoner Alyssa
1982	CV-2008-0007865-OC	2009-05-21		0.00	Return Of Service - Recalled Warrant
1983	CV-2008-0007865-OC	2009-05-21		0.00	Return Of Service - Recalled Warrant
1984	CV-2008-0007865-OC	2009-05-21		0.00	Return Of Service - Recalled Warrant
1985	CV-2008-0007865-OC	2009-05-21		0.00	Return Of Service - Recalled Warrant
1986	CV-2008-0007865-OC	2009-05-21		0.00	Return Of Service - Recalled Warrant
1987	CV-2008-0007859-OC	2009-06-12		100.00	Johnson Myrrian
1988	CV-2008-0007859-OC	2009-06-12		100.00	Johnson Myrrian
1989	CV-2008-0007859-OC	2009-06-12		100.00	Johnson Myrrian
1990	CV-2008-0007859-OC	2009-06-12		100.00	Johnson Myrrian
1991	CV-2008-0007859-OC	2009-06-12		100.00	Johnson Myrrian
1992	CV-2008-0007592-OC	2009-10-19		500.00	Pierson Ryan
1993	CV-2008-0007592-OC	2009-10-19		500.00	Pierson Ryan
1994	CV-2008-0007592-OC	2009-10-19		500.00	Pierson Ryan
1995	CV-2008-0007592-OC	2009-10-19		500.00	Pierson Ryan
1996	CV-2008-0007592-OC	2009-10-19		500.00	Pierson Ryan
1997	CV-2008-0007520-OC	2009-12-18		500.00	Medical Recovery Services LLC
1998	CV-2008-0007520-OC	2009-12-18		500.00	Smith Tracie
1999	CV-2008-0007520-OC	2010-10-20		500.00	Smith Tracie
2000	CV-2008-0007520-OC	2009-12-18		500.00	Medical Recovery Services LLC
2001	CV-2008-0007520-OC	2009-12-18		500.00	Smith Tracie
2002	CV-2008-0007520-OC	2010-10-20		500.00	Smith Tracie
2003	CV-2008-0007520-OC	2009-12-18		500.00	Medical Recovery Services LLC
2004	CV-2008-0007520-OC	2009-12-18		500.00	Smith Tracie
2005	CV-2008-0007520-OC	2010-10-20		500.00	Smith Tracie
2006	CV-2008-0007520-OC	2009-12-18		500.00	Medical Recovery Services LLC
2007	CV-2008-0007520-OC	2009-12-18		500.00	Smith Tracie
2008	CV-2008-0007520-OC	2010-10-20		500.00	Smith Tracie
2009	CV-2008-0007520-OC	2009-12-18		500.00	Medical Recovery Services LLC
2010	CV-2008-0007520-OC	2009-12-18		500.00	Smith Tracie
2011	CV-2008-0007520-OC	2010-10-20		500.00	Smith Tracie
2012	CV-2008-0006996-OC	2009-07-13		500.00	Vazquez Deborah L
2013	CV-2008-0006996-OC	2009-07-13		500.00	Vazquez Deborah L
2014	CV-2008-0006996-OC	2009-07-13		500.00	Vazquez Deborah L
2015	CV-2008-0006996-OC	2009-07-13		500.00	Vazquez Deborah L
2016	CV-2008-0006996-OC	2009-07-13		500.00	Vazquez Deborah L
2017	CV-2008-0006676-OC	2010-01-29		500.00	Lewis Jeremiah
2018	CV-2008-0006676-OC	2010-01-29		500.00	Lewis Jeremiah
2019	CV-2008-0006676-OC	2010-01-29		500.00	Lewis Jeremiah
2020	CV-2008-0006676-OC	2010-01-29		500.00	Lewis Jeremiah
2021	CV-2008-0006676-OC	2010-01-29		500.00	Lewis Jeremiah
2022	CV-2008-0006482-OC	2009-05-19		500.00	Sorenson Tony
2023	CV-2008-0006482-OC	2009-05-19		500.00	Sorenson Tony
2024	CV-2008-0006482-OC	2009-05-19		500.00	Sorenson Tony
2025	CV-2008-0006482-OC	2009-05-19		500.00	Sorenson Tony
2026	CV-2008-0006482-OC	2009-05-19		500.00	Sorenson Tony
2027	CV-2008-0006277-OC	2009-08-19		500.00	Barrow Natalie
2028	CV-2008-0006277-OC	2009-08-19		500.00	Barrow Natalie
2029	CV-2008-0006277-OC	2009-08-19		500.00	Barrow Natalie
2030	CV-2008-0006277-OC	2009-08-19		500.00	Barrow Natalie
2031	CV-2008-0006277-OC	2009-08-19		500.00	Barrow Natalie
2032	CV-2008-0006232-OC	2009-04-01		1949.48	Johnson Aimee Nicole
2033	CV-2008-0006232-OC	2009-04-17		0.00	Return Of Service - warrant - 4/13/09
2034	CV-2008-0006232-OC	2009-04-01		1949.48	Johnson Aimee Nicole
2035	CV-2008-0006232-OC	2009-04-17		0.00	Return Of Service - warrant - 4/13/09
2036	CV-2008-0006232-OC	2009-04-01		1949.48	Johnson Aimee Nicole
2037	CV-2008-0006232-OC	2009-04-17		0.00	Return Of Service - warrant - 4/13/09
2038	CV-2008-0006232-OC	2009-04-01		1949.48	Johnson Aimee Nicole
2039	CV-2008-0006232-OC	2009-04-17		0.00	Return Of Service - warrant - 4/13/09
2040	CV-2008-0006232-OC	2009-04-01		1949.48	Johnson Aimee Nicole
2041	CV-2008-0006232-OC	2009-04-17		0.00	Return Of Service - warrant - 4/13/09
2042	CV-2008-0006174-OC	2010-01-26		611.66	Harrison Serena
2043	CV-2008-0006174-OC	2010-01-26		611.66	Harrison Serena
2044	CV-2008-0006174-OC	2010-01-26		611.66	Harrison Serena
2045	CV-2008-0006174-OC	2010-01-26		611.66	Harrison Serena
2046	CV-2008-0006174-OC	2010-01-26		611.66	Harrison Serena
2047	CV-2008-0005948-OC	2010-02-26		500.00	Medical Recovery Services LLC
2048	CV-2008-0005948-OC	2010-02-26		500.00	Archibald Eileen
2049	CV-2008-0005948-OC	2010-02-26		500.00	Medical Recovery Services LLC
2050	CV-2008-0005948-OC	2010-02-26		500.00	Archibald Eileen
2051	CV-2008-0005948-OC	2010-02-26		500.00	Medical Recovery Services LLC
2052	CV-2008-0005948-OC	2010-02-26		500.00	Archibald Eileen
2053	CV-2008-0005948-OC	2010-02-26		500.00	Medical Recovery Services LLC
2054	CV-2008-0005948-OC	2010-02-26		500.00	Archibald Eileen
2055	CV-2008-0005948-OC	2010-02-26		500.00	Medical Recovery Services LLC
2056	CV-2008-0005948-OC	2010-02-26		500.00	Archibald Eileen
2057	CV-2008-0005653-OC	2011-03-02		0.00	Records indicated they (Sheriff of Bannock County) do not have original warrant
2058	CV-2008-0005653-OC	2011-03-02		0.00	Records indicated they (Sheriff of Bannock County) do not have original warrant
2059	CV-2008-0005653-OC	2011-03-02		0.00	Records indicated they (Sheriff of Bannock County) do not have original warrant
2060	CV-2008-0005653-OC	2011-03-02		0.00	Records indicated they (Sheriff of Bannock County) do not have original warrant
2061	CV-2008-0005653-OC	2011-03-02		0.00	Records indicated they (Sheriff of Bannock County) do not have original warrant
2062	CV-2008-0005523-OC	2010-01-04		500.00	Bartholomaw Jenny
2155	CV-2007-0003867-OC	2009-11-04		500.00	Hawkinson Jason
2063	CV-2008-0005523-OC	2010-09-27	Fail to Appear for Supplemental Hearing 9/10/10 @ 9:00 a.m.	500.00	Bartholomae Jenny
2064	CV-2008-0005523-OC	2010-01-04		500.00	Bartholomaw Jenny
2065	CV-2008-0005523-OC	2010-09-27	Fail to Appear for Supplemental Hearing 9/10/10 @ 9:00 a.m.	500.00	Bartholomae Jenny
2066	CV-2008-0005523-OC	2010-01-04		500.00	Bartholomaw Jenny
2067	CV-2008-0005523-OC	2010-09-27	Fail to Appear for Supplemental Hearing 9/10/10 @ 9:00 a.m.	500.00	Bartholomae Jenny
2068	CV-2008-0005523-OC	2010-01-04		500.00	Bartholomaw Jenny
2069	CV-2008-0005523-OC	2010-09-27	Fail to Appear for Supplemental Hearing 9/10/10 @ 9:00 a.m.	500.00	Bartholomae Jenny
2070	CV-2008-0005523-OC	2010-01-04		500.00	Bartholomaw Jenny
2071	CV-2008-0005523-OC	2010-09-27	Fail to Appear for Supplemental Hearing 9/10/10 @ 9:00 a.m.	500.00	Bartholomae Jenny
2072	CV-2008-0004523-OC	2010-01-04		500.00	Rardin Steven Burton
2073	CV-2008-0004523-OC	2010-01-04		500.00	Rardin Steven Burton
2074	CV-2008-0004523-OC	2010-01-04		500.00	Rardin Steven Burton
2075	CV-2008-0004523-OC	2010-01-04		500.00	Rardin Steven Burton
2076	CV-2008-0004523-OC	2010-01-04		500.00	Rardin Steven Burton
2077	CV-2008-0004521-OC	2010-08-13		500.00	Weaver Shannon
2078	CV-2008-0004521-OC	2010-08-13		500.00	Weaver Shannon
2079	CV-2008-0004521-OC	2010-08-13		500.00	Weaver Shannon
2080	CV-2008-0004521-OC	2010-08-13		500.00	Weaver Shannon
2081	CV-2008-0004521-OC	2010-08-13		500.00	Weaver Shannon
2082	CV-2008-0004394-OC	2009-05-12		3104.73	Rhodes Tom
2083	CV-2008-0004394-OC	2009-05-12		3104.73	Rhodes Tom
2084	CV-2008-0004394-OC	2009-05-12		3104.73	Rhodes Tom
2085	CV-2008-0004394-OC	2009-05-12		3104.73	Rhodes Tom
2086	CV-2008-0004394-OC	2009-05-12		3104.73	Rhodes Tom
2087	CV-2008-0004389-OC	2009-07-13		500.00	Reid Allen
2088	CV-2008-0004389-OC	2009-07-13		500.00	Reid Allen
2089	CV-2008-0004389-OC	2009-07-13		500.00	Reid Allen
2090	CV-2008-0004389-OC	2009-07-13		500.00	Reid Allen
2091	CV-2008-0004389-OC	2009-07-13		500.00	Reid Allen
2092	CV-2008-0004215-OC	2010-04-22		500.00	Yorgensen Julie D.
2093	CV-2008-0004215-OC	2010-04-22		500.00	Yorgensen Julie D.
2094	CV-2008-0004215-OC	2010-04-22		500.00	Yorgensen Julie D.
2095	CV-2008-0004215-OC	2010-04-22		500.00	Yorgensen Julie D.
2096	CV-2008-0004215-OC	2010-04-22		500.00	Yorgensen Julie D.
2097	CV-2008-0003743-OC	2009-05-18		500.00	Gilbert Gwen L
2098	CV-2008-0003743-OC	2009-05-18		500.00	Gilbert Gwen L
2099	CV-2008-0003743-OC	2009-05-18		500.00	Gilbert Gwen L
2100	CV-2008-0003743-OC	2009-05-18		500.00	Gilbert Gwen L
2101	CV-2008-0003743-OC	2009-05-18		500.00	Gilbert Gwen L
2102	CV-2008-0002906-OC	2010-07-01		500.00	Baker James
2103	CV-2008-0002906-OC	2010-07-01		500.00	Baker James
2104	CV-2008-0002906-OC	2010-07-01		500.00	Baker James
2105	CV-2008-0002906-OC	2010-07-01		500.00	Baker James
2106	CV-2008-0002906-OC	2010-07-01		500.00	Baker James
2107	CV-2008-0002357-OC	2010-11-16		500.00	Olson Mike J
2108	CV-2008-0002357-OC	2010-11-16		500.00	Olson Mike J
2109	CV-2008-0002357-OC	2010-11-16		500.00	Olson Mike J
2110	CV-2008-0002357-OC	2010-11-16		500.00	Olson Mike J
2111	CV-2008-0002357-OC	2010-11-16		500.00	Olson Mike J
2112	CV-2008-0002143-OC	2010-02-26		500.00	White Christine N
2113	CV-2008-0002143-OC	2010-02-26		500.00	White Christine N
2114	CV-2008-0002143-OC	2010-02-26		500.00	White Christine N
2115	CV-2008-0002143-OC	2010-02-26		500.00	White Christine N
2116	CV-2008-0002143-OC	2010-02-26		500.00	White Christine N
2117	CV-2008-0001727-OC	2009-08-31		500.00	Lovelace Ashlee Marie
2118	CV-2008-0001727-OC	2009-08-31		500.00	Lovelace Ashlee Marie
2119	CV-2008-0001727-OC	2009-08-31		500.00	Lovelace Ashlee Marie
2120	CV-2008-0001727-OC	2009-08-31		500.00	Lovelace Ashlee Marie
2121	CV-2008-0001727-OC	2009-08-31		500.00	Lovelace Ashlee Marie
2122	CV-2008-0001723-OC	2009-05-05		1870.30	Hanes Celeste
2123	CV-2008-0001723-OC	2009-05-05		1870.30	Hanes Celeste
2124	CV-2008-0001723-OC	2009-05-05		1870.30	Hanes Celeste
2125	CV-2008-0001723-OC	2009-05-05		1870.30	Hanes Celeste
2126	CV-2008-0001723-OC	2009-05-05		1870.30	Hanes Celeste
2127	CV-2007-0006682-OC	2009-07-14		0.00	Curtis Michael David
2128	CV-2007-0006682-OC	2009-07-14		0.00	Curtis Michael David
2129	CV-2007-0006682-OC	2009-07-14		0.00	Curtis Michael David
2130	CV-2007-0006682-OC	2009-07-14		0.00	Curtis Michael David
2131	CV-2007-0006682-OC	2009-07-14		0.00	Curtis Michael David
2132	CV-2007-0006052-OC	2009-12-31		500.00	Moldenhauer Benjamin D.
2133	CV-2007-0006052-OC	2009-12-31		500.00	Moldenhauer Benjamin D.
2134	CV-2007-0006052-OC	2009-12-31		500.00	Moldenhauer Benjamin D.
2135	CV-2007-0006052-OC	2009-12-31		500.00	Moldenhauer Benjamin D.
2136	CV-2007-0006052-OC	2009-12-31		500.00	Moldenhauer Benjamin D.
2137	CV-2007-0005905-OC	2008-05-08		0.00	***Defendant brought in on warrant - attorney Brian Smith talked to him informally****
2138	CV-2007-0005905-OC	2008-05-08		0.00	***Defendant brought in on warrant - attorney Brian Smith talked to him informally****
2139	CV-2007-0005905-OC	2008-05-08		0.00	***Defendant brought in on warrant - attorney Brian Smith talked to him informally****
2140	CV-2007-0005905-OC	2008-05-08		0.00	***Defendant brought in on warrant - attorney Brian Smith talked to him informally****
2141	CV-2007-0005905-OC	2008-05-08		0.00	***Defendant brought in on warrant - attorney Brian Smith talked to him informally****
2142	CV-2007-0005768-OC	2011-11-08		500.00	Bell Bradley
2143	CV-2007-0005768-OC	2011-11-08		500.00	Bell Bradley
2144	CV-2007-0005768-OC	2011-11-08		500.00	Bell Bradley
2145	CV-2007-0005768-OC	2011-11-08		500.00	Bell Bradley
2146	CV-2007-0005768-OC	2011-11-08		500.00	Bell Bradley
2147	CV-2007-0004368-OC	2010-03-19		500.00	Pace Larry L
2148	CV-2007-0004368-OC	2010-03-19		500.00	Pace Larry L
2149	CV-2007-0004368-OC	2010-03-19		500.00	Pace Larry L
2150	CV-2007-0004368-OC	2010-03-19		500.00	Pace Larry L
2151	CV-2007-0004368-OC	2010-03-19		500.00	Pace Larry L
2152	CV-2007-0003867-OC	2009-11-04		500.00	Hawkinson Jason
2153	CV-2007-0003867-OC	2009-11-04		500.00	Hawkinson Jason
2154	CV-2007-0003867-OC	2009-11-04		500.00	Hawkinson Jason
2156	CV-2007-0003867-OC	2009-11-04		500.00	Hawkinson Jason
2157	CV-2007-0003726-OC	2011-11-29		390.11	Blair Robert
2158	CV-2007-0003726-OC	2011-11-29		390.11	Blair Robert
2159	CV-2007-0003726-OC	2011-11-29		390.11	Blair Robert
2160	CV-2007-0003726-OC	2011-11-29		390.11	Blair Robert
2161	CV-2007-0003726-OC	2011-11-29		390.11	Blair Robert
2162	CV-2007-0003236-OC	2011-02-18		500.00	Robinson Joseph F.
2163	CV-2007-0003236-OC	2011-02-18		500.00	Robinson Joseph F.
2164	CV-2007-0003236-OC	2011-02-18		500.00	Robinson Joseph F.
2165	CV-2007-0003236-OC	2011-02-18		500.00	Robinson Joseph F.
2166	CV-2007-0003236-OC	2011-02-18		500.00	Robinson Joseph F.
2167	CV-2007-0002366-OC	2010-12-03		500.00	Wolfe Sadie
2168	CV-2007-0002366-OC	2010-12-03		500.00	Wolfe Sadie
2169	CV-2007-0002366-OC	2010-12-03		500.00	Wolfe Sadie
2170	CV-2007-0002366-OC	2010-12-03		500.00	Wolfe Sadie
2171	CV-2007-0002366-OC	2010-12-03		500.00	Wolfe Sadie
2172	CV-2007-0001933-OC	2010-02-16		500.00	Kelso Curtis
2173	CV-2007-0001933-OC	2010-02-16		500.00	Kelso Curtis
2174	CV-2007-0001933-OC	2010-02-16		500.00	Kelso Curtis
2175	CV-2007-0001933-OC	2010-02-16		500.00	Kelso Curtis
2176	CV-2007-0001933-OC	2010-02-16		500.00	Kelso Curtis
2177	CV-2007-0001465-OC	2009-07-28		500.00	Herrera Larry G.
2178	CV-2007-0001465-OC	2009-07-28		500.00	Herrera Larry G.
2179	CV-2007-0001465-OC	2009-07-28		500.00	Herrera Larry G.
2180	CV-2007-0001465-OC	2009-07-28		500.00	Herrera Larry G.
2181	CV-2007-0001465-OC	2009-07-28		500.00	Herrera Larry G.
2182	CV-2006-0007333-OC	2009-07-28		500.00	James Tiffany Rose
2183	CV-2006-0007333-OC	2009-07-28		500.00	James Tiffany Rose
2184	CV-2006-0007333-OC	2009-07-28		500.00	James Tiffany Rose
2185	CV-2006-0007333-OC	2009-07-28		500.00	James Tiffany Rose
2186	CV-2006-0007333-OC	2009-07-28		500.00	James Tiffany Rose
2187	CV-2006-0004889-OC	2017-08-17		300.00	Gilson Joshua
2188	CV-2006-0004889-OC	2017-08-17		300.00	Gilson Joshua
2189	CV-2006-0004889-OC	2017-08-17		300.00	Gilson Joshua
2190	CV-2006-0004889-OC	2017-08-17		300.00	Gilson Joshua
2191	CV-2006-0004889-OC	2017-08-17		300.00	Gilson Joshua
2192	CV-2006-0004188-OC	2007-02-05	Bond amount: 425.41	425.41	Fail to Appear for Hearing - Debtors Examine Defendant: Carpenter Ted Leroy
2193	CV-2006-0004188-OC	2007-02-05	Bond amount: 425.41	425.41	Fail to Appear for Hearing - Debtors Examine Defendant: Carpenter Ted Leroy
2194	CV-2006-0004188-OC	2007-02-05	Bond amount: 425.41	425.41	Fail to Appear for Hearing - Debtors Examine Defendant: Carpenter Ted Leroy
2195	CV-2006-0004188-OC	2007-02-05	Bond amount: 425.41	425.41	Fail to Appear for Hearing - Debtors Examine Defendant: Carpenter Ted Leroy
2196	CV-2006-0004188-OC	2007-02-05	Bond amount: 425.41	425.41	Fail to Appear for Hearing - Debtors Examine Defendant: Carpenter Ted Leroy
2197	CV-2006-0003791-OC	2009-07-28		500.00	Colby Gennie M.
2198	CV-2006-0003791-OC	2009-07-28		500.00	Colby Gennie M.
2199	CV-2006-0003791-OC	2009-07-28		500.00	Colby Gennie M.
2200	CV-2006-0003791-OC	2009-07-28		500.00	Colby Gennie M.
2201	CV-2006-0003791-OC	2009-07-28		500.00	Colby Gennie M.
2202	CV-2006-0003348-OC	2007-01-17	Bond amount: 1283.98	1283.98	debtors examin on 10/26/06 Defendant: Mills Brian and Carrie
2203	CV-2006-0003348-OC	2007-01-17	Bond amount: 1283.98	1283.98	debtors examin on 10/26/06 Defendant: Mills Brian and Carrie
2204	CV-2006-0003348-OC	2007-01-17	Bond amount: 1283.98	1283.98	debtors examin on 10/26/06 Defendant: Mills Brian and Carrie
2205	CV-2006-0003348-OC	2007-01-17	Bond amount: 1283.98	1283.98	debtors examin on 10/26/06 Defendant: Mills Brian and Carrie
2206	CV-2006-0003348-OC	2007-01-17	Bond amount: 1283.98	1283.98	debtors examin on 10/26/06 Defendant: Mills Brian and Carrie
2207	CV-2006-0003346-OC	2010-02-08		500.00	Jerry Bergman
2208	CV-2006-0003346-OC	2010-02-08		500.00	Jerry Bergman
2209	CV-2006-0003346-OC	2010-02-08		500.00	Jerry Bergman
2210	CV-2006-0003346-OC	2010-02-08		500.00	Jerry Bergman
2211	CV-2006-0003346-OC	2010-02-08		500.00	Jerry Bergman
2212	CV-2006-0003126-OC	2010-11-09		500.00	Christenot Tim
2213	CV-2006-0003126-OC	2010-11-09		500.00	Christenot Tim
2214	CV-2006-0003126-OC	2010-11-09		500.00	Christenot Tim
2215	CV-2006-0003126-OC	2010-11-09		500.00	Christenot Tim
2216	CV-2006-0003126-OC	2010-11-09		500.00	Christenot Tim
2217	CV-2006-0001961-OC	2007-06-14		1243.67	Colvin Joshua
2218	CV-2006-0001961-OC	2007-06-14		1243.67	Colvin Joshua
2219	CV-2006-0001961-OC	2007-06-14		1243.67	Colvin Joshua
2220	CV-2006-0001961-OC	2007-06-14		1243.67	Colvin Joshua
2221	CV-2006-0001961-OC	2007-06-14		1243.67	Colvin Joshua
2222	CV-2006-0000288-OC	2007-06-25		62.72	Loftus Brandy
2223	CV-2006-0000288-OC	2007-06-25		62.72	Loftus Brandy
2224	CV-2006-0000288-OC	2007-06-25		62.72	Loftus Brandy
2225	CV-2006-0000288-OC	2007-06-25		62.72	Loftus Brandy
2226	CV-2006-0000288-OC	2007-06-25		62.72	Loftus Brandy
2227	CV-2005-0002069-OC	2010-11-08		500.00	Cortez Pamela Iris
2228	CV-2005-0002069-OC	2010-11-08		500.00	Cortez Pamela Iris
2229	CV-2005-0002069-OC	2010-11-08		500.00	Cortez Pamela Iris
2230	CV-2005-0002069-OC	2010-11-08		500.00	Cortez Pamela Iris
2231	CV-2005-0002069-OC	2010-11-08		500.00	Cortez Pamela Iris
2232	CV-2004-0004754-OC	2009-07-07		500.00	Thompson Mike L
2233	CV-2004-0004754-OC	2009-07-07		500.00	Thompson Mike L
2234	CV-2004-0004754-OC	2009-07-07		500.00	Thompson Mike L
2235	CV-2004-0004754-OC	2009-07-07		500.00	Thompson Mike L
2236	CV-2004-0004754-OC	2009-07-07		500.00	Thompson Mike L
2237	CV-2004-0002678-OC	2004-11-15		0.00	Application for Civil Arrest Warrant
2238	CV-2004-0002678-OC	2004-11-15		0.00	Civil Warrant Issued - Arrest
2239	CV-2004-0002678-OC	2004-11-15		0.00	Application for Civil Arrest Warrant
2240	CV-2004-0002678-OC	2004-11-15		0.00	Civil Warrant Issued - Arrest
2241	CV-2004-0002678-OC	2004-11-15		0.00	Application for Civil Arrest Warrant
2242	CV-2004-0002678-OC	2004-11-15		0.00	Civil Warrant Issued - Arrest
2243	CV-2004-0002678-OC	2004-11-15		0.00	Application for Civil Arrest Warrant
2244	CV-2004-0002678-OC	2004-11-15		0.00	Civil Warrant Issued - Arrest
2245	CV-2004-0002678-OC	2004-11-15		0.00	Application for Civil Arrest Warrant
2246	CV-2004-0002678-OC	2004-11-15		0.00	Civil Warrant Issued - Arrest
2247	CV-2005-0012696-C	2007-01-30	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell Melissa	200.00	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell Melissa
2248	CV-2005-0012696-C	2007-02-02	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell George S	200.00	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell George S
2249	CV-2005-0012696-C	2008-10-02		0.00	Warrant Recall
2250	CV-2005-0012696-C	2007-01-30	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell Melissa	200.00	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell Melissa
2251	CV-2005-0012696-C	2007-02-02	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell George S	200.00	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell George S
2252	CV-2005-0012696-C	2008-10-02		0.00	Warrant Recall
2253	CV-2005-0012696-C	2007-01-30	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell Melissa	200.00	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell Melissa
2254	CV-2005-0012696-C	2007-02-02	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell George S	200.00	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell George S
2255	CV-2005-0012696-C	2008-10-02		0.00	Warrant Recall
2256	CV-2005-0012696-C	2007-01-30	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell Melissa	200.00	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell Melissa
2257	CV-2005-0012696-C	2007-02-02	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell George S	200.00	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell George S
2258	CV-2005-0012696-C	2008-10-02		0.00	Warrant Recall
2259	CV-2005-0012696-C	2007-01-30	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell Melissa	200.00	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell Melissa
2260	CV-2005-0012696-C	2007-02-02	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell George S	200.00	Bond amount: 200.00 cash or $2000 Surety Failure to Appear Defendant: Mcdowell George S
2261	CV-2005-0012696-C	2008-10-02		0.00	Warrant Recall
2262	CV-2003-0002189-C	2003-11-06		0.00	Submitted request for Warrant
2263	CV-2003-0002189-C	2003-11-14		0.00	Warrant incorrect - ret'd to pl
2264	CV-2003-0002189-C	2003-11-06		0.00	Submitted request for Warrant
2265	CV-2003-0002189-C	2003-11-14		0.00	Warrant incorrect - ret'd to pl
2266	CV-2003-0002189-C	2003-11-06		0.00	Submitted request for Warrant
2267	CV-2003-0002189-C	2003-11-14		0.00	Warrant incorrect - ret'd to pl
2268	CV-2003-0002189-C	2003-11-06		0.00	Submitted request for Warrant
2269	CV-2003-0002189-C	2003-11-14		0.00	Warrant incorrect - ret'd to pl
2270	CV-2003-0002189-C	2003-11-06		0.00	Submitted request for Warrant
2271	CV-2003-0002189-C	2003-11-14		0.00	Warrant incorrect - ret'd to pl
2272	CV-2014-0000092	2014-09-17	\N	40000.00	McStay, Michele H Mcstay, Bruce G
2273	CV-2006-0000022	2010-10-06	\N	0.00	Chandler Steven & Marsha
2274	CV-2014-0000134	2014-10-14	\N	0.00	Doe, Jane Robbins, Kenneth
2275	CV-2013-0000181	2013-10-03	\N	0.00	Doe, John Pace, Carol
2276	CV-2013-0000180	2013-10-03	\N	0.00	King, Angie King, Kollin C
2277	CV-2012-0000723	2013-03-13	\N	0.00	Clark, Christopher Clark, Stephanie
2278	CV-2014-0000276	2014-11-13	\N	500.00	Doe, Jane Mangan, Martin A
2279	CV-2013-0001039	2014-06-17	\N	0.00	Andrew, Mike Jane Doe
2280	CV-2013-0000272	2013-11-19	\N	0.00	Schell, Jane Doe Schell, John
2281	CV-2013-0000239	2014-03-17	\N	0.00	Parker, Brent Parker, Kristine B
2282	CV-2013-0000033	2015-04-14	\N	0.00	Linares, Brittany Jo Linares, Jacinto J
2283	CV-2012-0000875	2014-11-13	\N	0.00	Smith, Rachel Smith, Shane Eldon
2284	CV-2012-0000713	2014-03-17	\N	0.00	Fillmore, Craig Lynn
2285	CV-2012-0000664	2014-07-22	\N	0.00	Convington, Jane Doe Covington, Jory T
2286	CV-2012-0000619	2013-06-18	\N	0.00	Christensen, Amanda N Christensen, Josh
2287	CV-2012-0000166	2013-05-01	\N	0.00	Bowcutt, Jane Doe Bowcutt, Quentin K
2288	CV-2010-0001277	2012-02-24	\N	0.00	Davis, J Alan Davis, Jennifer
2289	CV-2010-0001065	2011-07-26	\N	0.00	James, Jodi Dee
2290	CV-2010-0000845	2012-01-31	\N	0.00	Wilde, John Doe Wilde, Shelly
2291	CV-2010-0000703	2011-01-14	\N	0.00	Barber, Dawn Barber, Lance D
2292	CV-2010-0000522	2012-12-21	\N	0.00	Williams, Wendy Williams, Wes E
2293	CV-2010-0000238	2010-09-15	\N	0.00	Coles, Holly M Coles, Jeffrey Lloyd
2294	CV-2009-0001047	2011-06-30	\N	0.00	Oler, Deena Lynn Oler, John Doe
2295	CV-2009-0000234	2011-01-14	\N	0.00	Layton, Brent Layton, Shawntell
2296	CV-2009-0000151	2010-11-10	\N	0.00	Doe, John Stowers, Rebecca Ann
2297	CV-2008-0001058	2015-04-30	\N	0.00	Doe, John Sakan, Karla R
2298	CV-2008-0001024	2009-05-19	\N	0.00	John, Doe Thompson, Sheri
2299	CV-2008-0000963	2009-07-23	\N	0.00	Graham, Dennis Graham, Marcia
2300	CV-2008-0000892	2010-05-05	\N	0.00	Baler, John Doe Baler, Nikki
2301	CV-2008-0000836	2009-04-16	\N	0.00	Wakley, Charity Ann Waley, John Doe
2302	CV-2008-0000831	2009-04-16	\N	0.00	Acor, Kevin T Acor, Tiffany
2303	CV-2008-0000738	2010-05-05	\N	0.00	Roberts, Corry Roberts, Jessica Helene
2304	CV-2008-0000367	2011-05-10	\N	0.00	Coffey, Tyanna Daylene Wellard, Matthew J
2305	CV-2007-0000381	2008-07-03	\N	0.00	Estrada, Jaime A Estrade, Maria D
2306	CV-2007-0000294	2008-02-14	\N	0.00	Gonzalez, Juatigui Gonzalez, Reyna
2307	CV-2007-0000293	2010-03-24	\N	0.00	Rogers, Gale Wayne Rogers, Melanie Mobley
2308	CV-2007-0000181	2007-08-28	\N	0.00	Patterson, Brenda Jolyn Patterson, Shane Brian
2309	CV-2007-0000152	2008-02-28	\N	0.00	Baker, Jennie M Baker, Matthew L
2310	CV-2007-0000026	2007-11-06	\N	0.00	Owens, Jane Doe Owens, Steven
2311	CV-2006-0000984	2008-11-26	\N	0.00	Morgan, Jennifer Lou Morgan, John Doe
2312	CV-2006-0000963	2008-02-29	\N	0.00	Landon, Jane Doe Landon, Jared Daniel
2313	CV-2006-0000581	2007-04-10	\N	0.00	Carter, Jane Doe Carter, Jeffrey Dean
2314	CV-2006-0000006	2007-04-19	\N	0.00	Burns, Brent Bary Burns, Deana
2315	CV-2013-0000709	2014-10-14	\N	0.00	Jane Doe, Justesen, Roger
2316	CV-2013-0000577	2014-06-03	\N	0.00	Bryd, Douglas Byrd, Wendi
2317	CV-2013-0000576	2014-05-15	\N	0.00	Wilburn, Jason
2318	CV-2012-0000903	2013-08-15	\N	500.00	Jane Doe, Jones, Brenden
2319	CV-2012-0000848	2014-06-25	\N	0.00	Stark, James E Stark, Kelly
2320	CV-2011-0000610	2014-02-03	\N	0.00	Bell, Nicole Bell, Travis
2321	CV-2011-0000324	2012-08-22	\N	0.00	Bradley, Cody J Bradely, Krista
2322	Cv-2010-0000304	2010-09-14	\N	0.00	Andra, Katie Andra, Travis
2323	CV-2010-0000280	2012-06-11	\N	0.00	Callier, Josh Callier, Mistie
2324	CV-2010-0000013	2010-11-18	\N	0.00	Brockman, Casey J Brockman, Sharon
2325	CV-2009-0000921	2010-10-07	\N	0.00	Jane Doe, Luekenga, Antone
2326	CV-2009-0000828	2010-09-07	\N	0.00	Wheeless, Bellia Wheeless, Wesley A
2327	CV-2009-0000279	2011-06-08	\N	0.00	John Doe, Kelly, Adrianna R
2328	CV-2008-0000255	2011-04-14	\N	0.00	John Doe, Knetzger, Heather N
2329	CV-2008-0000024	2009-05-11	\N	0.00	Garcia, Anthony Garcia, carol A
2330	CV-2007-00000884	2008-07-18	\N	0.00	Price, David Price, Teri
2331	CV-2007-00000821	2009-09-03	\N	0.00	John Doe, Nelson, Brittany
2332	CV-2007-00000485	2009-04-14	\N	0.00	John Doe, Russon, Lisa
2333	CV-2007-00000295	2008-08-21	\N	0.00	Jane Doe, Keele, Trent R
2334	CV-2007-00000260	2008-01-25	\N	0.00	John Doe, Pence, Amy N
2335	CV-2005-00000658	2008-01-10	\N	0.00	John Doe, Zufelt, Stephanie, D
2336	CV-2014-0000110	2014-09-02	\N	0.00	Olmos, Claudia Olmos, Jose
2337	CV-2014-0000095	2014-10-28	\N	0.00	Abrams, Kristy L Doe, John
2338	CV-2013-0000250	2013-11-04	\N	500.00	Oliver, Derek Oliver, Penny Jeanne
2339	CV-2013-0000067	2015-01-22	\N	0.00	Hansen, Ann Hansen, Roger
2340	CV-2014-0000084	2015-05-28	\N	0.00	John Doe, Valdez, Krista D
2341	CV-2013-0000297	2014-07-01		1500.00	Daniels Brittney A.
2342	CV-2014-0000374	2014-09-29		0.00	Motion for Warrant for Attatchemnt of Judgment Debtor
2343	CV-2014-0000374	2014-10-02		500.00	Covington Wende Ardell
2344	CV-2011-0000412	2012-04-12		500.00	Henderson Scotty Glenn
2345	CV-2013-0000877	2014-09-18		0.00	Warrant Issued (Shalayne Hill)
2346	CV-2013-0000078	2013-07-25		0.00	Motion For Warrant For Attachement Of Judgment Debtor - Todd Erikson
\.


--
-- Name: warrants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mehrotra
--

SELECT pg_catalog.setval('warrants_id_seq', 2346, true);


--
-- Data for Name: warrants_returned; Type: TABLE DATA; Schema: public; Owner: Mehrotra
--

COPY warrants_returned (id, case_number, defendant, returned, reason) FROM stdin;
385	CV-2016-0000601-OC	Original warrant returned.	2017-01-04	Failed to Appear
386	CV-2016-0000601-OC	Original warrant returned.	2017-01-04	Failed to Appear
387	CV-2016-0000601-OC	Original warrant returned.	2017-01-04	Failed to Appear
388	CV-2016-0000601-OC	Original warrant returned.	2017-01-04	Failed to Appear
389	CV-2016-0000601-OC	Original warrant returned.	2017-01-04	Failed to Appear
390	CV-2015-0003701-OC	Powell Julie Ann. served upon dfdt on 10-14-16 by BCSO. original warrant returned to file	2016-10-14	Failed to Appear
391	CV-2015-0003701-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO AMANDA	2016-11-10	
392	CV-2015-0003701-OC	Powell Julie Ann. served upon dfdt on 10-14-16 by BCSO. original warrant returned to file	2016-10-14	Failed to Appear
393	CV-2015-0003701-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO AMANDA	2016-11-10	
394	CV-2015-0003701-OC	Powell Julie Ann. served upon dfdt on 10-14-16 by BCSO. original warrant returned to file	2016-10-14	Failed to Appear
395	CV-2015-0003701-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO AMANDA	2016-11-10	
396	CV-2015-0003701-OC	Powell Julie Ann. served upon dfdt on 10-14-16 by BCSO. original warrant returned to file	2016-10-14	Failed to Appear
397	CV-2015-0003701-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO AMANDA	2016-11-10	
398	CV-2015-0003701-OC	Powell Julie Ann. served upon dfdt on 10-14-16 by BCSO. original warrant returned to file	2016-10-14	Failed to Appear
399	CV-2015-0003701-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO AMANDA	2016-11-10	
400	CV-2015-0003107-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQUESTED BY; ROSIE.	2017-06-01	
401	CV-2015-0003107-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQUESTED BY; ROSIE.	2017-06-01	
402	CV-2015-0003107-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQUESTED BY; ROSIE.	2017-06-01	
403	CV-2015-0003107-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQUESTED BY; ROSIE.	2017-06-01	
404	CV-2015-0003107-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQUESTED BY; ROSIE.	2017-06-01	
405	CV-2015-0002546-OC	Wilson Craig Allen: ORIGINAL WARRANT RETURNED REQUESTED BY; Amanda	2016-05-04	Failed to Appear
406	CV-2015-0002546-OC	Wilson Craig Allen: ORIGINAL WARRANT RETURNED REQUESTED BY; Amanda	2016-05-04	Failed to Appear
407	CV-2015-0002546-OC	Wilson Craig Allen: ORIGINAL WARRANT RETURNED REQUESTED BY; Amanda	2016-05-04	Failed to Appear
408	CV-2015-0002546-OC	Wilson Craig Allen: ORIGINAL WARRANT RETURNED REQUESTED BY; Amanda	2016-05-04	Failed to Appear
409	CV-2015-0002546-OC	Wilson Craig Allen: ORIGINAL WARRANT RETURNED REQUESTED BY; Amanda	2016-05-04	Failed to Appear
410	CV-2015-0001070-OC	Lacy Joseph T; ORIGINAL WARRANT RETURNED SERVED BY PPD 9-23-16; TO AMANDA	2016-09-26	Failed to Appear
411	CV-2015-0001070-OC	Lacy Joseph T; ORIGINAL WARRANT RETURNED SERVED BY PPD 9-23-16; TO AMANDA	2016-09-26	Failed to Appear
412	CV-2015-0001070-OC	Lacy Joseph T; ORIGINAL WARRANT RETURNED SERVED BY PPD 9-23-16; TO AMANDA	2016-09-26	Failed to Appear
413	CV-2015-0001070-OC	Lacy Joseph T; ORIGINAL WARRANT RETURNED SERVED BY PPD 9-23-16; TO AMANDA	2016-09-26	Failed to Appear
414	CV-2015-0001070-OC	Lacy Joseph T; ORIGINAL WARRANT RETURNED SERVED BY PPD 9-23-16; TO AMANDA	2016-09-26	Failed to Appear
415	CV-2015-0000987-OC	Wiebelhaus Sky E; ORIGINAL WARRANT RETURNED SERVED BY; ISP on 2-29-16. To: Nicole	2016-03-01	Violation of Court Order
416	CV-2015-0000987-OC	Wiebelhaus Sky E; ORIGINAL WARRANT RETURNED SERVED BY; ISP on 2-29-16. To: Nicole	2016-03-01	Violation of Court Order
417	CV-2015-0000987-OC	Wiebelhaus Sky E; ORIGINAL WARRANT RETURNED SERVED BY; ISP on 2-29-16. To: Nicole	2016-03-01	Violation of Court Order
418	CV-2015-0000987-OC	Wiebelhaus Sky E; ORIGINAL WARRANT RETURNED SERVED BY; ISP on 2-29-16. To: Nicole	2016-03-01	Violation of Court Order
419	CV-2015-0000987-OC	Wiebelhaus Sky E; ORIGINAL WARRANT RETURNED SERVED BY; ISP on 2-29-16. To: Nicole	2016-03-01	Violation of Court Order
420	CV-2015-0000412-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO CARNAROLI- DEBTORS EXAM CONDUCTED VIA TELEPHONE	2017-05-01	
421	CV-2015-0000412-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO CARNAROLI- DEBTORS EXAM CONDUCTED VIA TELEPHONE	2017-05-01	
422	CV-2015-0000412-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO CARNAROLI- DEBTORS EXAM CONDUCTED VIA TELEPHONE	2017-05-01	
423	CV-2015-0000412-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO CARNAROLI- DEBTORS EXAM CONDUCTED VIA TELEPHONE	2017-05-01	
424	CV-2015-0000412-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO CARNAROLI- DEBTORS EXAM CONDUCTED VIA TELEPHONE	2017-05-01	
425	CV-2014-0004864-OC	Myler Joshua David	2016-01-25	Failed to Appear
426	CV-2014-0004864-OC	Myler Joshua David	2016-01-25	Failed to Appear
427	CV-2014-0004864-OC	Myler Joshua David	2016-01-25	Failed to Appear
428	CV-2014-0004864-OC	Myler Joshua David	2016-01-25	Failed to Appear
429	CV-2014-0004864-OC	Myler Joshua David	2016-01-25	Failed to Appear
430	CV-2014-0004515-OC	Morrison Mistie; ORIGINAL WARRANT RETURNED SERVED BY BCSO 2-22-16; TO AMANDA	2016-02-23	Failed to Appear
431	CV-2014-0004515-OC	Morrison Mistie; ORIGINAL WARRANT RETURNED SERVED BY BCSO 2-22-16; TO AMANDA	2016-02-23	Failed to Appear
432	CV-2014-0004515-OC	Morrison Mistie; ORIGINAL WARRANT RETURNED SERVED BY BCSO 2-22-16; TO AMANDA	2016-02-23	Failed to Appear
433	CV-2014-0004515-OC	Morrison Mistie; ORIGINAL WARRANT RETURNED SERVED BY BCSO 2-22-16; TO AMANDA	2016-02-23	Failed to Appear
434	CV-2014-0004515-OC	Morrison Mistie; ORIGINAL WARRANT RETURNED SERVED BY BCSO 2-22-16; TO AMANDA	2016-02-23	Failed to Appear
435	CV-2014-0001722-OC	Arrants Harley H III: ORIGINAL WARRANT RETURNED SERVED BY; BCSO on 3-10-16. To: Nichole	2016-03-10	Failed to Appear
436	CV-2014-0001722-OC	Arrants Harley H III: ORIGINAL WARRANT RETURNED SERVED BY; BCSO on 3-10-16. To: Nichole	2016-03-10	Failed to Appear
437	CV-2014-0001722-OC	Arrants Harley H III: ORIGINAL WARRANT RETURNED SERVED BY; BCSO on 3-10-16. To: Nichole	2016-03-10	Failed to Appear
438	CV-2014-0001722-OC	Arrants Harley H III: ORIGINAL WARRANT RETURNED SERVED BY; BCSO on 3-10-16. To: Nichole	2016-03-10	Failed to Appear
439	CV-2014-0001722-OC	Arrants Harley H III: ORIGINAL WARRANT RETURNED SERVED BY; BCSO on 3-10-16. To: Nichole	2016-03-10	Failed to Appear
498	CV-2011-0003472-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO ROSIE	2013-05-06	
440	CV-2014-0001248-OC	Olsen Christopher M: ORIGINAL WARRANT RETURNED REQUESTED BY; BRYAN N. ZOLLINGER ATTORNEY FOR PLNTFS.	2016-01-20	Failed to Appear
441	CV-2014-0001248-OC	Olsen Christopher M: ORIGINAL WARRANT RETURNED REQUESTED BY; BRYAN N. ZOLLINGER ATTORNEY FOR PLNTFS.	2016-01-20	Failed to Appear
442	CV-2014-0001248-OC	Olsen Christopher M: ORIGINAL WARRANT RETURNED REQUESTED BY; BRYAN N. ZOLLINGER ATTORNEY FOR PLNTFS.	2016-01-20	Failed to Appear
443	CV-2014-0001248-OC	Olsen Christopher M: ORIGINAL WARRANT RETURNED REQUESTED BY; BRYAN N. ZOLLINGER ATTORNEY FOR PLNTFS.	2016-01-20	Failed to Appear
444	CV-2014-0001248-OC	Olsen Christopher M: ORIGINAL WARRANT RETURNED REQUESTED BY; BRYAN N. ZOLLINGER ATTORNEY FOR PLNTFS.	2016-01-20	Failed to Appear
445	CV-2014-0001129-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQESTED BY; Nichole	2016-08-10	
446	CV-2014-0001129-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQESTED BY; Nichole	2016-08-10	
447	CV-2014-0001129-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQESTED BY; Nichole	2016-08-10	
448	CV-2014-0001129-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQESTED BY; Nichole	2016-08-10	
449	CV-2014-0001129-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQESTED BY; Nichole	2016-08-10	
450	CV-2013-0004196-OC	Warrant Returned; ORIGNAL WARRANT RETURNED BY REQUEST; TO PAULA	2015-11-06	
451	CV-2013-0004196-OC	Warrant Returned; ORIGNAL WARRANT RETURNED BY REQUEST; TO PAULA	2015-11-06	
452	CV-2013-0004196-OC	Warrant Returned; ORIGNAL WARRANT RETURNED BY REQUEST; TO PAULA	2015-11-06	
453	CV-2013-0004196-OC	Warrant Returned; ORIGNAL WARRANT RETURNED BY REQUEST; TO PAULA	2015-11-06	
454	CV-2013-0004196-OC	Warrant Returned; ORIGNAL WARRANT RETURNED BY REQUEST; TO PAULA	2015-11-06	
455	CV-2013-0001469-OC	Dickman Frank Loreen; ORIGINAL WARRANT RETURNED SERVED BY BCSO 1-24-16; TO NICHOLE	2016-01-25	Failed to Appear
456	CV-2013-0001469-OC	Dickman Frank Loreen; ORIGINAL WARRANT RETURNED SERVED BY BCSO 1-24-16; TO NICHOLE	2016-01-25	Failed to Appear
457	CV-2013-0001469-OC	Dickman Frank Loreen; ORIGINAL WARRANT RETURNED SERVED BY BCSO 1-24-16; TO NICHOLE	2016-01-25	Failed to Appear
458	CV-2013-0001469-OC	Dickman Frank Loreen; ORIGINAL WARRANT RETURNED SERVED BY BCSO 1-24-16; TO NICHOLE	2016-01-25	Failed to Appear
459	CV-2013-0001469-OC	Dickman Frank Loreen; ORIGINAL WARRANT RETURNED SERVED BY BCSO 1-24-16; TO NICHOLE	2016-01-25	Failed to Appear
460	CV-2012-0004021-OC	Neubacher Beth; ORIGINAL WARRANT RETURNED BY REQUEST; TO PAULA	2014-09-25	Failed to Appear
461	CV-2012-0004021-OC	Neubacher Beth; ORIGINAL WARRANT RETURNED BY REQUEST; TO PAULA	2014-09-25	Failed to Appear
462	CV-2012-0004021-OC	Neubacher Beth; ORIGINAL WARRANT RETURNED BY REQUEST; TO PAULA	2014-09-25	Failed to Appear
463	CV-2012-0004021-OC	Neubacher Beth; ORIGINAL WARRANT RETURNED BY REQUEST; TO PAULA	2014-09-25	Failed to Appear
464	CV-2012-0004021-OC	Neubacher Beth; ORIGINAL WARRANT RETURNED BY REQUEST; TO PAULA	2014-09-25	Failed to Appear
465	CV-2012-0003180-OC	Bacon Anissa M: ORIGINAL WARRANT RETURNED SERVED BY; PPD ON 5-18-15. TO; Amanda	2015-05-19	Failed to Appear
466	CV-2012-0003180-OC	Bacon Anissa M: ORIGINAL WARRANT RETURNED SERVED BY; PPD ON 5-18-15. TO; Amanda	2015-05-19	Failed to Appear
467	CV-2012-0003180-OC	Bacon Anissa M: ORIGINAL WARRANT RETURNED SERVED BY; PPD ON 5-18-15. TO; Amanda	2015-05-19	Failed to Appear
468	CV-2012-0003180-OC	Bacon Anissa M: ORIGINAL WARRANT RETURNED SERVED BY; PPD ON 5-18-15. TO; Amanda	2015-05-19	Failed to Appear
469	CV-2012-0003180-OC	Bacon Anissa M: ORIGINAL WARRANT RETURNED SERVED BY; PPD ON 5-18-15. TO; Amanda	2015-05-19	Failed to Appear
470	CV-2012-0000747-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQUESTED by: Chantelle	2015-10-20	
471	CV-2012-0000747-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQUESTED by: Chantelle	2015-10-20	
472	CV-2012-0000747-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQUESTED by: Chantelle	2015-10-20	
473	CV-2012-0000747-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQUESTED by: Chantelle	2015-10-20	
474	CV-2012-0000747-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQUESTED by: Chantelle	2015-10-20	
475	CV-2012-0000408-OC	Bybee Laurie J; ORIGINAL WARRANT RETURNED BY REQUEST; TO AMANDA	2014-05-01	Failed to Appear
476	CV-2012-0000408-OC	Bybee Laurie J; ORIGINAL WARRANT RETURNED BY REQUEST; TO AMANDA	2014-05-01	Failed to Appear
477	CV-2012-0000408-OC	Bybee Laurie J; ORIGINAL WARRANT RETURNED BY REQUEST; TO AMANDA	2014-05-01	Failed to Appear
478	CV-2012-0000408-OC	Bybee Laurie J; ORIGINAL WARRANT RETURNED BY REQUEST; TO AMANDA	2014-05-01	Failed to Appear
479	CV-2012-0000408-OC	Bybee Laurie J; ORIGINAL WARRANT RETURNED BY REQUEST; TO AMANDA	2014-05-01	Failed to Appear
480	CV-2011-0005533-OC	Served by PPD on 5/9/13	2013-05-09	Failed to Appear
481	CV-2011-0005533-OC	Served by PPD on 5/9/13	2013-05-09	Failed to Appear
482	CV-2011-0005533-OC	Served by PPD on 5/9/13	2013-05-09	Failed to Appear
483	CV-2011-0005533-OC	Served by PPD on 5/9/13	2013-05-09	Failed to Appear
484	CV-2011-0005533-OC	Served by PPD on 5/9/13	2013-05-09	Failed to Appear
485	CV-2011-0004911-OC	Davis Renee N; ORIGINAL WARRANT RETURNED SERVED BY PPD 11-19-12; TO ROSIE	2012-11-20	Failed to Appear
486	CV-2011-0004911-OC	Warrant Returned; Original warrant returned requested by; Rosie	2016-11-22	
487	CV-2011-0004911-OC	Davis Renee N; ORIGINAL WARRANT RETURNED SERVED BY PPD 11-19-12; TO ROSIE	2012-11-20	Failed to Appear
488	CV-2011-0004911-OC	Warrant Returned; Original warrant returned requested by; Rosie	2016-11-22	
489	CV-2011-0004911-OC	Davis Renee N; ORIGINAL WARRANT RETURNED SERVED BY PPD 11-19-12; TO ROSIE	2012-11-20	Failed to Appear
490	CV-2011-0004911-OC	Warrant Returned; Original warrant returned requested by; Rosie	2016-11-22	
491	CV-2011-0004911-OC	Davis Renee N; ORIGINAL WARRANT RETURNED SERVED BY PPD 11-19-12; TO ROSIE	2012-11-20	Failed to Appear
492	CV-2011-0004911-OC	Warrant Returned; Original warrant returned requested by; Rosie	2016-11-22	
493	CV-2011-0004911-OC	Davis Renee N; ORIGINAL WARRANT RETURNED SERVED BY PPD 11-19-12; TO ROSIE	2012-11-20	Failed to Appear
494	CV-2011-0004911-OC	Warrant Returned; Original warrant returned requested by; Rosie	2016-11-22	
495	CV-2011-0003472-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO ROSIE	2013-05-06	
496	CV-2011-0003472-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO ROSIE	2013-05-06	
497	CV-2011-0003472-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO ROSIE	2013-05-06	
499	CV-2011-0003472-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO ROSIE	2013-05-06	
500	CV-2011-0003323-OC	Warrant Returned; ORIGINAL WARRNAT RETURNED BY REQUEST; TO NICHOLE	2013-08-13	
501	CV-2011-0003323-OC	Warrant Returned; ORIGINAL WARRNAT RETURNED BY REQUEST; TO NICHOLE	2013-08-13	
502	CV-2011-0003323-OC	Warrant Returned; ORIGINAL WARRNAT RETURNED BY REQUEST; TO NICHOLE	2013-08-13	
503	CV-2011-0003323-OC	Warrant Returned; ORIGINAL WARRNAT RETURNED BY REQUEST; TO NICHOLE	2013-08-13	
504	CV-2011-0003323-OC	Warrant Returned; ORIGINAL WARRNAT RETURNED BY REQUEST; TO NICHOLE	2013-08-13	
505	CV-2011-0002966-OC	Warrant Returned; ORIGINALWARRANT RETURNED BY REQUEST; TO CRT REC	2012-09-21	
506	CV-2011-0002966-OC	Warrant Returned; ORIGINALWARRANT RETURNED BY REQUEST; TO CRT REC	2012-09-21	
507	CV-2011-0002966-OC	Warrant Returned; ORIGINALWARRANT RETURNED BY REQUEST; TO CRT REC	2012-09-21	
508	CV-2011-0002966-OC	Warrant Returned; ORIGINALWARRANT RETURNED BY REQUEST; TO CRT REC	2012-09-21	
509	CV-2011-0002966-OC	Warrant Returned; ORIGINALWARRANT RETURNED BY REQUEST; TO CRT REC	2012-09-21	
510	CV-2011-0002871-OC	Guthrie Kasey- spokw with deputy Holt; original warrant shall be returned- original warrant returned 7-3-12.	2012-07-02	Failed to Appear
511	CV-2011-0002871-OC	Guthrie Kasey- spokw with deputy Holt; original warrant shall be returned- original warrant returned 7-3-12.	2012-07-02	Failed to Appear
512	CV-2011-0002871-OC	Guthrie Kasey- spokw with deputy Holt; original warrant shall be returned- original warrant returned 7-3-12.	2012-07-02	Failed to Appear
513	CV-2011-0002871-OC	Guthrie Kasey- spokw with deputy Holt; original warrant shall be returned- original warrant returned 7-3-12.	2012-07-02	Failed to Appear
514	CV-2011-0002871-OC	Guthrie Kasey- spokw with deputy Holt; original warrant shall be returned- original warrant returned 7-3-12.	2012-07-02	Failed to Appear
515	CV-2011-0002819-OC	Dueling Todd; ORIGINAL WARRANT RETURNED SERVED BY ISP 9-25-12; TO AMANDA	2012-09-26	Failed to Appear
516	CV-2011-0002819-OC	Dueling Todd; ORIGINAL WARRANT RETURNED SERVED BY ISP 9-25-12; TO AMANDA	2012-09-26	Failed to Appear
517	CV-2011-0002819-OC	Dueling Todd; ORIGINAL WARRANT RETURNED SERVED BY ISP 9-25-12; TO AMANDA	2012-09-26	Failed to Appear
518	CV-2011-0002819-OC	Dueling Todd; ORIGINAL WARRANT RETURNED SERVED BY ISP 9-25-12; TO AMANDA	2012-09-26	Failed to Appear
519	CV-2011-0002819-OC	Dueling Todd; ORIGINAL WARRANT RETURNED SERVED BY ISP 9-25-12; TO AMANDA	2012-09-26	Failed to Appear
520	CV-2011-0002374-OC	on 6-10-17. To: Amanda	2017-06-12	Failed to Appear
521	CV-2011-0002374-OC	on 6-10-17. To: Amanda	2017-06-12	Failed to Appear
522	CV-2011-0002374-OC	on 6-10-17. To: Amanda	2017-06-12	Failed to Appear
523	CV-2011-0002374-OC	on 6-10-17. To: Amanda	2017-06-12	Failed to Appear
524	CV-2011-0002374-OC	on 6-10-17. To: Amanda	2017-06-12	Failed to Appear
525	CV-2011-0002320-OC	Belew Laurel	2014-12-02	Failed to Appear
526	CV-2011-0002320-OC	Belew Laurel	2014-12-02	Failed to Appear
527	CV-2011-0002320-OC	Belew Laurel	2014-12-02	Failed to Appear
528	CV-2011-0002320-OC	Belew Laurel	2014-12-02	Failed to Appear
529	CV-2011-0002320-OC	Belew Laurel	2014-12-02	Failed to Appear
530	CV-2011-0001910-OC	Ridley Darrin L- original warrant returned served 2-17-13.	2013-02-19	Failed to Appear
531	CV-2011-0001910-OC	Ridley Darrin L- original warrant returned served 2-17-13.	2013-02-19	Failed to Appear
532	CV-2011-0001910-OC	Ridley Darrin L- original warrant returned served 2-17-13.	2013-02-19	Failed to Appear
533	CV-2011-0001910-OC	Ridley Darrin L- original warrant returned served 2-17-13.	2013-02-19	Failed to Appear
534	CV-2011-0001910-OC	Ridley Darrin L- original warrant returned served 2-17-13.	2013-02-19	Failed to Appear
535	CV-2011-0000225-OC	Warrant Returned- original warrant returned served in Bingham County	2014-09-11	
536	CV-2011-0000225-OC	Warrant Returned- original warrant returned served in Bingham County	2014-09-11	
537	CV-2011-0000225-OC	Warrant Returned- original warrant returned served in Bingham County	2014-09-11	
538	CV-2011-0000225-OC	Warrant Returned- original warrant returned served in Bingham County	2014-09-11	
539	CV-2011-0000225-OC	Warrant Returned- original warrant returned served in Bingham County	2014-09-11	
540	CV-2010-0003812-OC	Original warrant in file	2012-07-26	Failed to Appear
541	CV-2010-0003812-OC	Original warrant in file	2012-07-26	Failed to Appear
542	CV-2010-0003812-OC	Original warrant in file	2012-07-26	Failed to Appear
543	CV-2010-0003812-OC	Original warrant in file	2012-07-26	Failed to Appear
544	CV-2010-0003812-OC	Original warrant in file	2012-07-26	Failed to Appear
545	CV-2010-0003811-OC	Johns Darin Michael; original warrant returned served by BCSO 10-6-11; to nichole	2011-10-07	Failed to Appear
546	CV-2010-0003811-OC	Johns Darin Michael; original warrant returned served by BCSO 10-6-11; to nichole	2011-10-07	Failed to Appear
547	CV-2010-0003811-OC	Johns Darin Michael; original warrant returned served by BCSO 10-6-11; to nichole	2011-10-07	Failed to Appear
548	CV-2010-0003811-OC	Johns Darin Michael; original warrant returned served by BCSO 10-6-11; to nichole	2011-10-07	Failed to Appear
549	CV-2010-0003811-OC	Johns Darin Michael; original warrant returned served by BCSO 10-6-11; to nichole	2011-10-07	Failed to Appear
550	CV-2010-0003427-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO NICHOLE	2012-10-24	
551	CV-2010-0003427-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO NICHOLE	2012-10-24	
552	CV-2010-0003427-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO NICHOLE	2012-10-24	
553	CV-2010-0003427-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO NICHOLE	2012-10-24	
554	CV-2010-0003427-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO NICHOLE	2012-10-24	
555	CV-2010-0003133-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO NICHOLE	2012-05-02	
556	CV-2010-0003133-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO NICHOLE	2012-05-02	
557	CV-2010-0003133-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO NICHOLE	2012-05-02	
558	CV-2010-0003133-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO NICHOLE	2012-05-02	
559	CV-2010-0003133-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO NICHOLE	2012-05-02	
560	CV-2010-0001408-OC	McMahen Trent A; ORIGINAL WARRANT RETURNED SERVED BY PPD 2-22-11; TO NICHOLE	2011-02-23	Failed to Appear
561	CV-2010-0001408-OC	McMahen Trent A; ORIGINAL WARRANT RETURNED SERVED BY PPD 1-25-12; TO NICHOLE	2012-01-26	Failed to Appear
562	CV-2010-0001408-OC	McMahen Trent A; ORIGINAL WARRANT RETURNED SERVED BY PPD 2-22-11; TO NICHOLE	2011-02-23	Failed to Appear
563	CV-2010-0001408-OC	McMahen Trent A; ORIGINAL WARRANT RETURNED SERVED BY PPD 1-25-12; TO NICHOLE	2012-01-26	Failed to Appear
564	CV-2010-0001408-OC	McMahen Trent A; ORIGINAL WARRANT RETURNED SERVED BY PPD 2-22-11; TO NICHOLE	2011-02-23	Failed to Appear
565	CV-2010-0001408-OC	McMahen Trent A; ORIGINAL WARRANT RETURNED SERVED BY PPD 1-25-12; TO NICHOLE	2012-01-26	Failed to Appear
566	CV-2010-0001408-OC	McMahen Trent A; ORIGINAL WARRANT RETURNED SERVED BY PPD 2-22-11; TO NICHOLE	2011-02-23	Failed to Appear
567	CV-2010-0001408-OC	McMahen Trent A; ORIGINAL WARRANT RETURNED SERVED BY PPD 1-25-12; TO NICHOLE	2012-01-26	Failed to Appear
568	CV-2010-0001408-OC	McMahen Trent A; ORIGINAL WARRANT RETURNED SERVED BY PPD 2-22-11; TO NICHOLE	2011-02-23	Failed to Appear
569	CV-2010-0001408-OC	McMahen Trent A; ORIGINAL WARRANT RETURNED SERVED BY PPD 1-25-12; TO NICHOLE	2012-01-26	Failed to Appear
570	CV-2010-0000837-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST ; TO AMANDA	2014-03-06	
571	CV-2010-0000837-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST ; TO AMANDA	2014-03-06	
572	CV-2010-0000837-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST ; TO AMANDA	2014-03-06	
573	CV-2010-0000837-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST ; TO AMANDA	2014-03-06	
574	CV-2010-0000837-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST ; TO AMANDA	2014-03-06	
575	CV-2010-0000767-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO PAULA	2011-02-14	
576	CV-2010-0000767-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO PAULA	2011-02-14	
577	CV-2010-0000767-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO PAULA	2011-02-14	
578	CV-2010-0000767-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO PAULA	2011-02-14	
579	CV-2010-0000767-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO PAULA	2011-02-14	
580	CV-2010-0000482-OC	Rogers Adam; served by CHPD by 02-20-11 original warrant returned to court	2011-02-22	Failed to Appear
581	CV-2010-0000482-OC	Rogers Adam; served by CHPD by 02-20-11 original warrant returned to court	2011-02-22	Failed to Appear
582	CV-2010-0000482-OC	Rogers Adam; served by CHPD by 02-20-11 original warrant returned to court	2011-02-22	Failed to Appear
583	CV-2010-0000482-OC	Rogers Adam; served by CHPD by 02-20-11 original warrant returned to court	2011-02-22	Failed to Appear
584	CV-2010-0000482-OC	Rogers Adam; served by CHPD by 02-20-11 original warrant returned to court	2011-02-22	Failed to Appear
585	CV-2009-0003428-OC	Warrant Returned; ORIGINAL WARRNAT RETURNED BY REQUEST; TO ROSIE	2011-01-05	
586	CV-2009-0003428-OC	Warrant Returned; ORIGINAL WARRNAT RETURNED BY REQUEST; TO ROSIE	2011-01-05	
587	CV-2009-0003428-OC	Warrant Returned; ORIGINAL WARRNAT RETURNED BY REQUEST; TO ROSIE	2011-01-05	
588	CV-2009-0003428-OC	Warrant Returned; ORIGINAL WARRNAT RETURNED BY REQUEST; TO ROSIE	2011-01-05	
589	CV-2009-0003428-OC	Warrant Returned; ORIGINAL WARRNAT RETURNED BY REQUEST; TO ROSIE	2011-01-05	
590	CV-2009-0002517-OC	Leading Mark	2010-02-16	Failed to Appear
591	CV-2009-0002517-OC	Leading Mark	2010-02-16	Failed to Appear
592	CV-2009-0002517-OC	Leading Mark	2010-02-16	Failed to Appear
593	CV-2009-0002517-OC	Leading Mark	2010-02-16	Failed to Appear
594	CV-2009-0002517-OC	Leading Mark	2010-02-16	Failed to Appear
595	CV-2009-0002074-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQUESTE BY; ROSIE	2016-08-15	
596	CV-2009-0002074-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQUESTE BY; ROSIE	2016-08-15	
597	CV-2009-0002074-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQUESTE BY; ROSIE	2016-08-15	
598	CV-2009-0002074-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQUESTE BY; ROSIE	2016-08-15	
599	CV-2009-0002074-OC	Warrant Returned: ORIGINAL WARRANT RETURNED REQUESTE BY; ROSIE	2016-08-15	
600	CV-2008-0004674-OC	CH	2009-10-28	Failed to Appear
601	CV-2008-0004674-OC	CH	2009-10-28	Failed to Appear
602	CV-2008-0004674-OC	CH	2009-10-28	Failed to Appear
603	CV-2008-0004674-OC	CH	2009-10-28	Failed to Appear
604	CV-2008-0004674-OC	CH	2009-10-28	Failed to Appear
605	CV-2008-0003859-OC	Rowberry Jeremy- original warrant returned served 11-21-12.	2012-11-23	Failed to Appear
606	CV-2008-0003859-OC	Rowberry Jeremy- original warrant returned served 11-21-12.	2012-11-23	Failed to Appear
607	CV-2008-0003859-OC	Rowberry Jeremy- original warrant returned served 11-21-12.	2012-11-23	Failed to Appear
608	CV-2008-0003859-OC	Rowberry Jeremy- original warrant returned served 11-21-12.	2012-11-23	Failed to Appear
609	CV-2008-0003859-OC	Rowberry Jeremy- original warrant returned served 11-21-12.	2012-11-23	Failed to Appear
610	CV-2008-0003809-OC	Alonso Carrie J.; ORIGINAL WARRANT RETURNED SERVED BY CPD 8-6-10; TO NICHOLE	2010-08-09	Failed to Appear
611	CV-2008-0003809-OC	Alonso Carrie J.; ORIGINAL WARRANT RETURNED SERVED BY CPD 8-6-10; TO NICHOLE	2010-08-09	Failed to Appear
612	CV-2008-0003809-OC	Alonso Carrie J.; ORIGINAL WARRANT RETURNED SERVED BY CPD 8-6-10; TO NICHOLE	2010-08-09	Failed to Appear
613	CV-2008-0003809-OC	Alonso Carrie J.; ORIGINAL WARRANT RETURNED SERVED BY CPD 8-6-10; TO NICHOLE	2010-08-09	Failed to Appear
614	CV-2008-0003809-OC	Alonso Carrie J.; ORIGINAL WARRANT RETURNED SERVED BY CPD 8-6-10; TO NICHOLE	2010-08-09	Failed to Appear
615	CV-2008-0003191-OC	Stark Justin D- original warrant returned served 5-20-11.	2011-05-23	Failed to Appear
616	CV-2008-0003191-OC	Stark Justin D- original warrant returned served 5-20-11.	2011-05-23	Failed to Appear
617	CV-2008-0003191-OC	Stark Justin D- original warrant returned served 5-20-11.	2011-05-23	Failed to Appear
618	CV-2008-0003191-OC	Stark Justin D- original warrant returned served 5-20-11.	2011-05-23	Failed to Appear
619	CV-2008-0003191-OC	Stark Justin D- original warrant returned served 5-20-11.	2011-05-23	Failed to Appear
620	CV-2008-0002942-OC	Heath Arthur Sr; ORIGINAL WARRANT RETURNED SERVED BY BCSO 4-12-09; TO NICHOLE	2009-04-13	Failed to Appear to Exam of Debtor hearing
621	CV-2008-0002942-OC	Heath Peggy; ORIGINAL WARRANT RETURNED SERVED BY BCSO 4-12-09; TO NICHOLE	2009-04-13	Failed to Appear to Exam of Debtor hearing
622	CV-2008-0002942-OC	Heath Arthur Sr; ORIGINAL WARRANT RETURNED SERVED BY BCSO 4-12-09; TO NICHOLE	2009-04-13	Failed to Appear to Exam of Debtor hearing
623	CV-2008-0002942-OC	Heath Peggy; ORIGINAL WARRANT RETURNED SERVED BY BCSO 4-12-09; TO NICHOLE	2009-04-13	Failed to Appear to Exam of Debtor hearing
624	CV-2008-0002942-OC	Heath Arthur Sr; ORIGINAL WARRANT RETURNED SERVED BY BCSO 4-12-09; TO NICHOLE	2009-04-13	Failed to Appear to Exam of Debtor hearing
625	CV-2008-0002942-OC	Heath Peggy; ORIGINAL WARRANT RETURNED SERVED BY BCSO 4-12-09; TO NICHOLE	2009-04-13	Failed to Appear to Exam of Debtor hearing
626	CV-2008-0002942-OC	Heath Arthur Sr; ORIGINAL WARRANT RETURNED SERVED BY BCSO 4-12-09; TO NICHOLE	2009-04-13	Failed to Appear to Exam of Debtor hearing
627	CV-2008-0002942-OC	Heath Peggy; ORIGINAL WARRANT RETURNED SERVED BY BCSO 4-12-09; TO NICHOLE	2009-04-13	Failed to Appear to Exam of Debtor hearing
628	CV-2008-0002942-OC	Heath Arthur Sr; ORIGINAL WARRANT RETURNED SERVED BY BCSO 4-12-09; TO NICHOLE	2009-04-13	Failed to Appear to Exam of Debtor hearing
629	CV-2008-0002942-OC	Heath Peggy; ORIGINAL WARRANT RETURNED SERVED BY BCSO 4-12-09; TO NICHOLE	2009-04-13	Failed to Appear to Exam of Debtor hearing
630	CV-2008-0002939-OC	Warrant Returned; original civil warrant returned to court	2009-07-17	
631	CV-2008-0002939-OC	Warrant Returned; original civil warrant returned to court	2009-07-17	
632	CV-2008-0002939-OC	Warrant Returned; original civil warrant returned to court	2009-07-17	
633	CV-2008-0002939-OC	Warrant Returned; original civil warrant returned to court	2009-07-17	
634	CV-2008-0002939-OC	Warrant Returned; original civil warrant returned to court	2009-07-17	
635	CV-2008-0002938-OC	Palmer James- original warrant returned served 10-28-10.	2010-10-29	Failed to Appear for Order to Show Cause 02-09-09
636	CV-2008-0002938-OC	Palmer James- original warrant returned served 10-28-10.	2010-10-29	Failed to Appear for Order to Show Cause 02-09-09
637	CV-2008-0002938-OC	Palmer James- original warrant returned served 10-28-10.	2010-10-29	Failed to Appear for Order to Show Cause 02-09-09
638	CV-2008-0002938-OC	Palmer James- original warrant returned served 10-28-10.	2010-10-29	Failed to Appear for Order to Show Cause 02-09-09
639	CV-2008-0002938-OC	Palmer James- original warrant returned served 10-28-10.	2010-10-29	Failed to Appear for Order to Show Cause 02-09-09
640	CV-2007-0004453-OC	Lane Martin P; served by PPD original warrant returned to court	2009-05-18	Failed to Appear at Debtor's Exam
641	CV-2007-0004453-OC	Lane Martin P. SV'd 9/21/10. Faxed copy of warrant in file for arraignment purposes	2010-09-21	Failed to Appear
642	CV-2007-0004453-OC	Lane Martin P; served by PPD original warrant returned to court	2009-05-18	Failed to Appear at Debtor's Exam
643	CV-2007-0004453-OC	Lane Martin P. SV'd 9/21/10. Faxed copy of warrant in file for arraignment purposes	2010-09-21	Failed to Appear
644	CV-2007-0004453-OC	Lane Martin P; served by PPD original warrant returned to court	2009-05-18	Failed to Appear at Debtor's Exam
645	CV-2007-0004453-OC	Lane Martin P. SV'd 9/21/10. Faxed copy of warrant in file for arraignment purposes	2010-09-21	Failed to Appear
646	CV-2007-0004453-OC	Lane Martin P; served by PPD original warrant returned to court	2009-05-18	Failed to Appear at Debtor's Exam
647	CV-2007-0004453-OC	Lane Martin P. SV'd 9/21/10. Faxed copy of warrant in file for arraignment purposes	2010-09-21	Failed to Appear
648	CV-2007-0004453-OC	Lane Martin P; served by PPD original warrant returned to court	2009-05-18	Failed to Appear at Debtor's Exam
649	CV-2007-0004453-OC	Lane Martin P. SV'd 9/21/10. Faxed copy of warrant in file for arraignment purposes	2010-09-21	Failed to Appear
650	CV-2007-0004301-OC	Warrant Returned; ORIGINAL WARRATN RETURNED SERVED BY CPD 1-25-12; TO NICHOLE	2012-01-26	
651	CV-2007-0004301-OC	Warrant Returned; ORIGINAL WARRATN RETURNED SERVED BY CPD 1-25-12; TO NICHOLE	2012-01-26	
652	CV-2007-0004301-OC	Warrant Returned; ORIGINAL WARRATN RETURNED SERVED BY CPD 1-25-12; TO NICHOLE	2012-01-26	
653	CV-2007-0004301-OC	Warrant Returned; ORIGINAL WARRATN RETURNED SERVED BY CPD 1-25-12; TO NICHOLE	2012-01-26	
654	CV-2007-0004301-OC	Warrant Returned; ORIGINAL WARRATN RETURNED SERVED BY CPD 1-25-12; TO NICHOLE	2012-01-26	
655	CV-2007-0002171-OC	Warrant Returned; original warrant of attachment returned to court (Rosemarie McDonald)	2009-06-23	
656	CV-2007-0002171-OC	Warrant Returned; original warrant of attachment returned to court (Michael McDonald)	2009-06-23	
657	CV-2007-0002171-OC	Urquhart Rosemarrie Jean: ORIGINAL WARRANT RETURNED SERVED BY; PPD on 5-31-17. To: Paula	2017-06-01	Failed to Appear for Examination of Judgment/Debtor Hearing on February 22 2010 at 2:30 pm
658	CV-2007-0002171-OC	Warrant Returned; original warrant of attachment returned to court (Rosemarie McDonald)	2009-06-23	
659	CV-2007-0002171-OC	Warrant Returned; original warrant of attachment returned to court (Michael McDonald)	2009-06-23	
660	CV-2007-0002171-OC	Urquhart Rosemarrie Jean: ORIGINAL WARRANT RETURNED SERVED BY; PPD on 5-31-17. To: Paula	2017-06-01	Failed to Appear for Examination of Judgment/Debtor Hearing on February 22 2010 at 2:30 pm
661	CV-2007-0002171-OC	Warrant Returned; original warrant of attachment returned to court (Rosemarie McDonald)	2009-06-23	
662	CV-2007-0002171-OC	Warrant Returned; original warrant of attachment returned to court (Michael McDonald)	2009-06-23	
663	CV-2007-0002171-OC	Urquhart Rosemarrie Jean: ORIGINAL WARRANT RETURNED SERVED BY; PPD on 5-31-17. To: Paula	2017-06-01	Failed to Appear for Examination of Judgment/Debtor Hearing on February 22 2010 at 2:30 pm
664	CV-2007-0002171-OC	Warrant Returned; original warrant of attachment returned to court (Rosemarie McDonald)	2009-06-23	
665	CV-2007-0002171-OC	Warrant Returned; original warrant of attachment returned to court (Michael McDonald)	2009-06-23	
666	CV-2007-0002171-OC	Urquhart Rosemarrie Jean: ORIGINAL WARRANT RETURNED SERVED BY; PPD on 5-31-17. To: Paula	2017-06-01	Failed to Appear for Examination of Judgment/Debtor Hearing on February 22 2010 at 2:30 pm
667	CV-2007-0002171-OC	Warrant Returned; original warrant of attachment returned to court (Rosemarie McDonald)	2009-06-23	
668	CV-2007-0002171-OC	Warrant Returned; original warrant of attachment returned to court (Michael McDonald)	2009-06-23	
669	CV-2007-0002171-OC	Urquhart Rosemarrie Jean: ORIGINAL WARRANT RETURNED SERVED BY; PPD on 5-31-17. To: Paula	2017-06-01	Failed to Appear for Examination of Judgment/Debtor Hearing on February 22 2010 at 2:30 pm
670	CV-2006-0004975-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO NICHOLE	2012-05-02	
671	CV-2006-0004975-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO NICHOLE	2012-05-02	
672	CV-2006-0004975-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO NICHOLE	2012-05-02	
673	CV-2006-0004975-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO NICHOLE	2012-05-02	
674	CV-2006-0004975-OC	Warrant Returned; ORIGINAL WARRANT RETURNED BY REQUEST; TO NICHOLE	2012-05-02	
675	CV-2006-0002383-OC	Elder Donald E - retured by BCSO - warrant expired	2007-05-17	Failed to Appear
676	CV-2006-0002383-OC	Elder Donald E	2009-04-21	Failed to Appear
677	CV-2006-0002383-OC	Elder Donald E - retured by BCSO - warrant expired	2007-05-17	Failed to Appear
678	CV-2006-0002383-OC	Elder Donald E	2009-04-21	Failed to Appear
679	CV-2006-0002383-OC	Elder Donald E - retured by BCSO - warrant expired	2007-05-17	Failed to Appear
680	CV-2006-0002383-OC	Elder Donald E	2009-04-21	Failed to Appear
681	CV-2006-0002383-OC	Elder Donald E - retured by BCSO - warrant expired	2007-05-17	Failed to Appear
682	CV-2006-0002383-OC	Elder Donald E	2009-04-21	Failed to Appear
683	CV-2006-0002383-OC	Elder Donald E - retured by BCSO - warrant expired	2007-05-17	Failed to Appear
684	CV-2006-0002383-OC	Elder Donald E	2009-04-21	Failed to Appear
685	CV-2006-0002382-OC	Cluff Alan- original warrant returned 10-18-07.	2007-10-15	Failed to Appear Debtor exam
686	CV-2006-0002382-OC	Cluff Alan- original warrant returned 10-18-07.	2007-10-15	Failed to Appear Debtor exam
687	CV-2006-0002382-OC	Cluff Alan- original warrant returned 10-18-07.	2007-10-15	Failed to Appear Debtor exam
688	CV-2006-0002382-OC	Cluff Alan- original warrant returned 10-18-07.	2007-10-15	Failed to Appear Debtor exam
689	CV-2006-0002382-OC	Cluff Alan- original warrant returned 10-18-07.	2007-10-15	Failed to Appear Debtor exam
690	CV-2015-0001081	Conan Jamie Dean	2016-06-30	Failure to Appear
691	CV-2015-0000587	Buck Weston	2016-03-18	Failure to Appear - for Debtor's Exam
692	CV-2014-0001875	Smith Melonie D	2017-01-03	Failure to Appear - at Debtor's Exam
693	CV-2015-0000672	Jones Kimberly B	2016-06-12	Fail to Appear
694	CV-2015-0000672	Warrant Returned unserved	2017-08-21	
695	CV-2016-0000297	Rothman Jeffrey Michael	2017-06-05	Failed to Appear
696	CV-2015-0000424	Romo Joseph Michael	2016-08-30	Failed to Appear for Examination of Judgment Debtor Hearing
697	CV-2014-0000600	Mcdonald Fred T	2015-12-14	Failed to Appear On a Debtor's Exam
698	CV-2014-0000636	Varela Luis	2015-11-05	Failure to Appear for Debtor's Exam on 04/17/2015 @ 1:30 PM and Motion for Contempt on 07/08/2015 @ 2:45 PM
699	CV-2014-0000276	Mangan Martin A	2015-01-20	Failure to Appear for Debtors Exam on 10/24/2014 @ 1:30 PM
700	CV-2014-0000059	Sorensen Cherie	2016-01-25	Failure to Appear for Debtors Examination of 08/14/2015 @ 1:30 PM
701	CV-2013-0000705	Hernandez Leticia	2014-07-29	Failure to Appear on May 2 2014 at 1:30pm for Order of Examination
702	CV-2013-0000653	Barrientos Francesca	2014-05-12	Failure to Appear-Contempt Nov 6 2013
703	CV-2013-0000615	Graham Brittney	2014-03-14	Failure to Appear-Contempt
704	CV-2013-0000272	Schell John	2014-05-02	Failure to Appear Complaint per I.C. 19-3901
705	CV-2013-0000239	Parker Kristine B	2014-04-08	Failure to Appear at the 12/20/2013 hearing at 9:30 AM
706	CV-2013-0000233	Linares Brittany Jo	2015-05-11	Failure to Appear on March 27 2015 for Debtor's Exam
707	CV-2013-0000123	Stibal Tyrel L	2013-10-03	Failure to Appear for Arraignment
708	CV-2012-0001026	Robbins Jeff J	2015-01-13	Failure to Appear for Debtors Exam on 10/24/2014 @ 1:30 PM
709	CV-2012-0000967	Warrant Returned No Service	2017-02-21	
710	CV-2012-0000967	Dortch Jimmy T	2017-02-21	Failure to Appear on October 26 2016 at 9:00 am for Examination of Judgment Debtor Hearing
711	CV-2012-0000879	Lopez Joe	2013-08-19	Failure to Appear-Contempt
712	CV-2012-0000875	Smith Rachel	2014-12-10	Failure to Appear on October 24 2014 at 1:30pm for Debtor's Exam
713	CV-2012-0000713	Fillmore Michelle Rae	2014-04-09	Failure to Appearfor a Hearing on 12/20/2013 @ 9:30
714	CV-2012-0000664	Covington Jory T	2014-07-31	Failure to Appear for Debtors Examine on 05/30/2014 @ 9:30 AM
715	CV-2012-0000603	Morton Skipper T	2015-11-16	Failure to Appear for Debtor Exam on 08/14/2015 @ 1:30 PM
716	CV-2010-0001277	Davis Alan	2012-06-25	Failure to Appear for Debtor's exam on November 18 2011 @ 9:00am in Bonneville County Courthouse
717	CV-2010-0000703	Barber Lance	2011-02-02	Failure to Appear for Debtor Exam on 1/7/2011 at 9:30am
718	CV-2010-0000613	Williams Curtis Martin	2011-02-03	Failure to Appear for Debters Exam on 12/17/2010 9:30am
719	CV-2010-0000613	Williams Curtis Martin	2011-04-21	Failure to Appear for Debtors Examination on 12/17/2010
720	CV-2010-0000238	Coles Holly M	2010-10-15	Failure to Appear for Debtors Exam on 08/27/2010 @ 9:30 AM
721	CV-2009-0001047	Oler Deena Lynn	2011-07-12	Failure to Appear for Debtors Examine on 06/03/2011 @ 9:30 AM
722	CV-2009-0000234	Layton Brent	2011-02-03	Failure to Appear for Debtors Exam on 1/7/11 at 9:30am
723	CV-2009-0000151	Stowers Rebecca	2011-01-05	Failure to Appear for Debtors Exam on 11/05/2010 @ 9:30 AM
724	CV-2008-0001058	Sakan Karla R	2015-02-12	Failure to Appear on March 21 2014 at 9:00am for Debtor's Exam
725	CV-2008-0001024	Thompson Sheri	2009-06-09	Failure to Appear at Debtors Exam on March 6. 2009 in Bonneville County
726	CV-2008-0000963	Graham Marcia	2009-08-03	Failure to Appeqr for Debtr's Exam on 07/10/09 at 9:30 am
727	CV-2008-0000836	Wakley Charity	2009-06-19	Failure to Appear at Debtor's Exam on 2/26/09
728	CV-2008-0000367	Wellard Matthew J	2011-07-21	Failure to Appear for Debtor Examination on April 29 2011 at 9:30
729	CV-2007-0000293	Rogers Gale Wayne	2010-04-28	Failure to Appear for Debtors Examine on 03/12/2010 @ 9:00 AM
730	CV-2007-0000026	Owens Steven	2008-02-04	Failure to Appear for Debotrs Exam on 10/31/2007 @ 9:00 AM
731	CV-2006-0000963	Landon Jared Daniel	2008-03-19	Failure to Appear for Debtors Exam on 02/25/2008 @ 2:00 PM
732	CV-2012-0000550	Warrant Returned - served 05/31/2013	2013-06-03	
733	CV-2014-0000215	Medical Recovery Services LLC	2015-11-23	Failed to Appear at the time and place ordered by this court.
734	CV-2014-0002795-OC	WARRANT RETURNED; ORIGINAL WARRANT RETURNED REQUESTED BY; AMANDA	2016-08-10	
735	CV-2014-0000263	Warrant Returned	2016-11-07	
736	CV-2014-0003144	Jenkins Megan S	2015-08-09	Failure to Appear For Hearing
737	CV-2014-0000818	Bell Dustin J	2016-01-19	failure to appear
738	CV-2008-0000183	Warrant Returned/Sheriff's Office Return of Service	2011-08-05	
739	CV-2008-0000183	Varner Michael J Jr	2011-08-05	Failed to Appear for Judgment Debtor Hearing on 6/21/2011\\r\\ncourthouse hours only warrant
740	CV-2008-0000183	Varner Tiffany M	2011-08-05	Failed to Appear for Judgment Debtor Hearing on 6/21/2011\\r\\ncourthouse hours only warrant
741	CV-2008-0000183	Warrant Returned/Sheriff's Office Return of Service	2011-08-05	
742	CV-2008-0000183	Varner Michael J Jr	2011-08-05	Failed to Appear for Judgment Debtor Hearing on 6/21/2011\\r\\ncourthouse hours only warrant
743	CV-2008-0000183	Varner Tiffany M	2011-08-05	Failed to Appear for Judgment Debtor Hearing on 6/21/2011\\r\\ncourthouse hours only warrant
744	CV-2008-0000183	Warrant Returned/Sheriff's Office Return of Service	2011-08-05	
745	CV-2008-0000183	Varner Michael J Jr	2011-08-05	Failed to Appear for Judgment Debtor Hearing on 6/21/2011\\r\\ncourthouse hours only warrant
746	CV-2008-0000183	Varner Tiffany M	2011-08-05	Failed to Appear for Judgment Debtor Hearing on 6/21/2011\\r\\ncourthouse hours only warrant
747	CV-2016-0003472-OC	Chester Dawna Lynn	2017-06-29	Fail to Obey Court Order
748	CV-2016-0003472-OC	Chester Dawna Lynn	2017-06-29	Fail to Obey Court Order
749	CV-2016-0003472-OC	Chester Dawna Lynn	2017-06-29	Fail to Obey Court Order
750	CV-2016-0003472-OC	Chester Dawna Lynn	2017-06-29	Fail to Obey Court Order
751	CV-2016-0003472-OC	Chester Dawna Lynn	2017-06-29	Fail to Obey Court Order
752	CV-2016-0002920-OC	Thomas Tammy	2017-05-30	Fail to Appear for Hearing
753	CV-2016-0002920-OC	Thomas Tammy	2017-05-30	Fail to Appear for Hearing
754	CV-2016-0002920-OC	Thomas Tammy	2017-05-30	Fail to Appear for Hearing
755	CV-2016-0002920-OC	Thomas Tammy	2017-05-30	Fail to Appear for Hearing
756	CV-2016-0002920-OC	Thomas Tammy	2017-05-30	Fail to Appear for Hearing
757	CV-2016-0002301-OC	Maxey Patrick Armon	2017-07-05	Fail to Apper For Debtor Examine
758	CV-2016-0002301-OC	Maxey Patrick Armon	2017-07-05	Fail to Apper For Debtor Examine
759	CV-2016-0002301-OC	Maxey Patrick Armon	2017-07-05	Fail to Apper For Debtor Examine
760	CV-2016-0002301-OC	Maxey Patrick Armon	2017-07-05	Fail to Apper For Debtor Examine
761	CV-2016-0002301-OC	Maxey Patrick Armon	2017-07-05	Fail to Apper For Debtor Examine
762	CV-2016-0001141-OC	Barraza Monica	2017-05-26	Fail to Appear for Hearing (supplemental hearing 8-5-16 @ 9:00 AM)
763	CV-2016-0001141-OC	Barraza Monica	2017-05-26	Fail to Appear for Hearing (supplemental hearing 8-5-16 @ 9:00 AM)
764	CV-2016-0001141-OC	Barraza Monica	2017-05-26	Fail to Appear for Hearing (supplemental hearing 8-5-16 @ 9:00 AM)
765	CV-2016-0001141-OC	Barraza Monica	2017-05-26	Fail to Appear for Hearing (supplemental hearing 8-5-16 @ 9:00 AM)
766	CV-2016-0001141-OC	Barraza Monica	2017-05-26	Fail to Appear for Hearing (supplemental hearing 8-5-16 @ 9:00 AM)
767	CV-2015-0005659-OC	Rasmussen Tyler Michael	2016-06-28	Fail to Appear for Debtor's Exam 3.18.16 @ 1:30 p.m.
768	CV-2015-0005659-OC	Rasmussen Tyler Michael	2016-09-29	Fail to Appear for Examination Of Judgment Debtor Hearing on March 18 2016 @ 1:30 PM
769	CV-2015-0005659-OC	Rasmussen Tyler Michael	2016-06-28	Fail to Appear for Debtor's Exam 3.18.16 @ 1:30 p.m.
770	CV-2015-0005659-OC	Rasmussen Tyler Michael	2016-09-29	Fail to Appear for Examination Of Judgment Debtor Hearing on March 18 2016 @ 1:30 PM
771	CV-2015-0005659-OC	Rasmussen Tyler Michael	2016-06-28	Fail to Appear for Debtor's Exam 3.18.16 @ 1:30 p.m.
772	CV-2015-0005659-OC	Rasmussen Tyler Michael	2016-09-29	Fail to Appear for Examination Of Judgment Debtor Hearing on March 18 2016 @ 1:30 PM
773	CV-2015-0005659-OC	Rasmussen Tyler Michael	2016-06-28	Fail to Appear for Debtor's Exam 3.18.16 @ 1:30 p.m.
774	CV-2015-0005659-OC	Rasmussen Tyler Michael	2016-09-29	Fail to Appear for Examination Of Judgment Debtor Hearing on March 18 2016 @ 1:30 PM
775	CV-2015-0005659-OC	Rasmussen Tyler Michael	2016-06-28	Fail to Appear for Debtor's Exam 3.18.16 @ 1:30 p.m.
776	CV-2015-0005659-OC	Rasmussen Tyler Michael	2016-09-29	Fail to Appear for Examination Of Judgment Debtor Hearing on March 18 2016 @ 1:30 PM
777	CV-2015-0005293-OC	Ephrem Kent	2017-02-02	Fail to Appear for Examination
778	CV-2015-0005293-OC	Ephrem Kent	2017-02-02	Fail to Appear for Examination
779	CV-2015-0005293-OC	Ephrem Kent	2017-02-02	Fail to Appear for Examination
780	CV-2015-0005293-OC	Ephrem Kent	2017-02-02	Fail to Appear for Examination
781	CV-2015-0005293-OC	Ephrem Kent	2017-02-02	Fail to Appear for Examination
782	CV-2015-0004463-OC	Allison Julie K	2016-05-24	Fail to Obey Court Order
783	CV-2015-0004463-OC	Allison Julie K	2016-05-24	Fail to Obey Court Order
784	CV-2015-0004463-OC	Allison Julie K	2016-05-24	Fail to Obey Court Order
785	CV-2015-0004463-OC	Allison Julie K	2016-05-24	Fail to Obey Court Order
786	CV-2015-0004463-OC	Allison Julie K	2016-05-24	Fail to Obey Court Order
787	CV-2015-0004201-OC	Widerburg Ryan Lane	2016-06-22	Fail to Appear for Hearing 2/19/16 @ 9:00 AM
788	CV-2015-0004201-OC	Widerburg Ryan Lane	2016-06-22	Fail to Appear for Hearing 2/19/16 @ 9:00 AM
789	CV-2015-0004201-OC	Widerburg Ryan Lane	2016-06-22	Fail to Appear for Hearing 2/19/16 @ 9:00 AM
790	CV-2015-0004201-OC	Widerburg Ryan Lane	2016-06-22	Fail to Appear for Hearing 2/19/16 @ 9:00 AM
791	CV-2015-0004201-OC	Widerburg Ryan Lane	2016-06-22	Fail to Appear for Hearing 2/19/16 @ 9:00 AM
792	CV-2015-0003256-OC	Potter Angela Dawn	2016-03-24	Fail to Appear for Debtor's Exam Hearing 12/4/15
793	CV-2015-0003256-OC	Potter Angela Dawn	2016-03-24	Fail to Appear for Debtor's Exam Hearing 12/4/15
794	CV-2015-0003256-OC	Potter Angela Dawn	2016-03-24	Fail to Appear for Debtor's Exam Hearing 12/4/15
795	CV-2015-0003256-OC	Potter Angela Dawn	2016-03-24	Fail to Appear for Debtor's Exam Hearing 12/4/15
796	CV-2015-0003256-OC	Potter Angela Dawn	2016-03-24	Fail to Appear for Debtor's Exam Hearing 12/4/15
797	CV-2015-0002573-OC	Terry John W	2016-02-29	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
798	CV-2015-0002573-OC	Terry John W	2016-02-29	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
799	CV-2015-0002573-OC	Terry John W	2016-02-29	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
800	CV-2015-0002573-OC	Terry John W	2016-02-29	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
801	CV-2015-0002573-OC	Terry John W	2016-02-29	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
802	CV-2015-0002498-OC	Curzon Blaine	2016-06-16	Fail to Appear for Debtor's Exam Hearing 1/20/16
803	CV-2015-0002498-OC	Curzon Blaine	2016-06-16	Fail to Appear for Debtor's Exam Hearing 1/20/16
804	CV-2015-0002498-OC	Curzon Blaine	2016-06-16	Fail to Appear for Debtor's Exam Hearing 1/20/16
805	CV-2015-0002498-OC	Curzon Blaine	2016-06-16	Fail to Appear for Debtor's Exam Hearing 1/20/16
806	CV-2015-0002498-OC	Curzon Blaine	2016-06-16	Fail to Appear for Debtor's Exam Hearing 1/20/16
807	CV-2015-0002314-OC	Malott Demi R	2016-05-19	Fail to Appear for Hearing (Examination of Judgment Debtor Hearing)
808	CV-2015-0002314-OC	Malott Demi R	2016-05-19	Fail to Appear for Hearing (Examination of Judgment Debtor Hearing)
809	CV-2015-0002314-OC	Malott Demi R	2016-05-19	Fail to Appear for Hearing (Examination of Judgment Debtor Hearing)
810	CV-2015-0002314-OC	Malott Demi R	2016-05-19	Fail to Appear for Hearing (Examination of Judgment Debtor Hearing)
811	CV-2015-0002314-OC	Malott Demi R	2016-05-19	Fail to Appear for Hearing (Examination of Judgment Debtor Hearing)
812	CV-2015-0002119-OC	Rentelman Tabitha Ineez	2016-10-06	Fail to Appear for Hearing for Examination of Judgment
813	CV-2015-0002119-OC	Rentelman Tabitha Ineez	2016-10-06	Fail to Appear for Hearing for Examination of Judgment
814	CV-2015-0002119-OC	Rentelman Tabitha Ineez	2016-10-06	Fail to Appear for Hearing for Examination of Judgment
815	CV-2015-0002119-OC	Rentelman Tabitha Ineez	2016-10-06	Fail to Appear for Hearing for Examination of Judgment
816	CV-2015-0002119-OC	Rentelman Tabitha Ineez	2016-10-06	Fail to Appear for Hearing for Examination of Judgment
817	CV-2015-0002091-OC	Sanchez Letesha Marie	2016-12-13	Fail to Obey Court Order
818	CV-2015-0002091-OC	Sanchez Letesha Marie	2016-12-13	Fail to Obey Court Order
819	CV-2015-0002091-OC	Sanchez Letesha Marie	2016-12-13	Fail to Obey Court Order
820	CV-2015-0002091-OC	Sanchez Letesha Marie	2016-12-13	Fail to Obey Court Order
821	CV-2015-0002091-OC	Sanchez Letesha Marie	2016-12-13	Fail to Obey Court Order
822	CV-2015-0001925-OC	Ramirez Gabriel	2017-07-05	Fail to Appear for Debtor Examination
823	CV-2015-0001925-OC	Ramirez Gabriel	2017-07-05	Fail to Appear for Debtor Examination
824	CV-2015-0001925-OC	Ramirez Gabriel	2017-07-05	Fail to Appear for Debtor Examination
825	CV-2015-0001925-OC	Ramirez Gabriel	2017-07-05	Fail to Appear for Debtor Examination
826	CV-2015-0001925-OC	Ramirez Gabriel	2017-07-05	Fail to Appear for Debtor Examination
827	CV-2015-0001808-OC	Gonzalez Luis M	2017-07-17	Fail to Appear for Debtor Examine
828	CV-2015-0001808-OC	Gonzalez Luis M	2017-07-17	Fail to Appear for Debtor Examine
829	CV-2015-0001808-OC	Gonzalez Luis M	2017-07-17	Fail to Appear for Debtor Examine
830	CV-2015-0001808-OC	Gonzalez Luis M	2017-07-17	Fail to Appear for Debtor Examine
831	CV-2015-0001808-OC	Gonzalez Luis M	2017-07-17	Fail to Appear for Debtor Examine
832	CV-2015-0001597-OC	Bird Bryan	2017-03-30	Fail to Appear for Hearing (Supplemental hearing 9-2-16 @ 9:00 AM)
833	CV-2015-0001597-OC	Bird Bryan	2017-03-30	Fail to Appear for Hearing (Supplemental hearing 9-2-16 @ 9:00 AM)
834	CV-2015-0001597-OC	Bird Bryan	2017-03-30	Fail to Appear for Hearing (Supplemental hearing 9-2-16 @ 9:00 AM)
835	CV-2015-0001597-OC	Bird Bryan	2017-03-30	Fail to Appear for Hearing (Supplemental hearing 9-2-16 @ 9:00 AM)
836	CV-2015-0001597-OC	Bird Bryan	2017-03-30	Fail to Appear for Hearing (Supplemental hearing 9-2-16 @ 9:00 AM)
837	CV-2015-0000614-OC	Higgins Kevin	2015-12-03	Fail to Appear for Examination of Judgment of Debtor August 5 2015 at 9:00 a.m.
838	CV-2015-0000614-OC	Higgins Kevin	2017-02-02	Fail to Appear for Examination Of Judgment Debtor
839	CV-2015-0000614-OC	Higgins Kevin	2015-12-03	Fail to Appear for Examination of Judgment of Debtor August 5 2015 at 9:00 a.m.
840	CV-2015-0000614-OC	Higgins Kevin	2017-02-02	Fail to Appear for Examination Of Judgment Debtor
841	CV-2015-0000614-OC	Higgins Kevin	2015-12-03	Fail to Appear for Examination of Judgment of Debtor August 5 2015 at 9:00 a.m.
842	CV-2015-0000614-OC	Higgins Kevin	2017-02-02	Fail to Appear for Examination Of Judgment Debtor
843	CV-2015-0000614-OC	Higgins Kevin	2015-12-03	Fail to Appear for Examination of Judgment of Debtor August 5 2015 at 9:00 a.m.
844	CV-2015-0000614-OC	Higgins Kevin	2017-02-02	Fail to Appear for Examination Of Judgment Debtor
845	CV-2015-0000614-OC	Higgins Kevin	2015-12-03	Fail to Appear for Examination of Judgment of Debtor August 5 2015 at 9:00 a.m.
846	CV-2015-0000614-OC	Higgins Kevin	2017-02-02	Fail to Appear for Examination Of Judgment Debtor
847	CV-2014-0006856-OC	Albertson Danial Burton	2016-06-16	Fail to Appear for Hearing- Examination Of Judgment Debtor Hearing 2/10/2016 @ 9:45 AM
848	CV-2014-0006856-OC	Albertson Sara	2017-04-17	Fail to Appear for Debtor Examination
849	CV-2014-0006856-OC	Albertson Danial Burton	2016-06-16	Fail to Appear for Hearing- Examination Of Judgment Debtor Hearing 2/10/2016 @ 9:45 AM
850	CV-2014-0006856-OC	Albertson Sara	2017-04-17	Fail to Appear for Debtor Examination
851	CV-2014-0006856-OC	Albertson Danial Burton	2016-06-16	Fail to Appear for Hearing- Examination Of Judgment Debtor Hearing 2/10/2016 @ 9:45 AM
852	CV-2014-0006856-OC	Albertson Sara	2017-04-17	Fail to Appear for Debtor Examination
853	CV-2014-0006856-OC	Albertson Danial Burton	2016-06-16	Fail to Appear for Hearing- Examination Of Judgment Debtor Hearing 2/10/2016 @ 9:45 AM
854	CV-2014-0006856-OC	Albertson Sara	2017-04-17	Fail to Appear for Debtor Examination
855	CV-2014-0006856-OC	Albertson Danial Burton	2016-06-16	Fail to Appear for Hearing- Examination Of Judgment Debtor Hearing 2/10/2016 @ 9:45 AM
856	CV-2014-0006856-OC	Albertson Sara	2017-04-17	Fail to Appear for Debtor Examination
857	CV-2014-0006816-OC	Andra Travis	2016-03-24	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
858	CV-2014-0006816-OC	Andra Travis	2016-03-24	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
859	CV-2014-0006816-OC	Andra Travis	2016-03-24	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
860	CV-2014-0006816-OC	Andra Travis	2016-03-24	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
861	CV-2014-0006816-OC	Andra Travis	2016-03-24	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
862	CV-2014-0006179-OC	Peterson Saleena	2017-05-05	Fail to Appear for Hearing
863	CV-2014-0006179-OC	Peterson Saleena	2017-05-05	Fail to Appear for Hearing
864	CV-2014-0006179-OC	Peterson Saleena	2017-05-05	Fail to Appear for Hearing
865	CV-2014-0006179-OC	Peterson Saleena	2017-05-05	Fail to Appear for Hearing
866	CV-2014-0006179-OC	Peterson Saleena	2017-05-05	Fail to Appear for Hearing
867	CV-2014-0006085-OC	Merrill Kelli	2016-03-28	Fail to Obey Court Order by failing to appear for examination of judgment debtor-
868	CV-2014-0006085-OC	Merrill Kelli	2016-03-28	Fail to Obey Court Order by failing to appear for examination of judgment debtor-
869	CV-2014-0006085-OC	Merrill Kelli	2016-03-28	Fail to Obey Court Order by failing to appear for examination of judgment debtor-
870	CV-2014-0006085-OC	Merrill Kelli	2016-03-28	Fail to Obey Court Order by failing to appear for examination of judgment debtor-
871	CV-2014-0006085-OC	Merrill Kelli	2016-03-28	Fail to Obey Court Order by failing to appear for examination of judgment debtor-
872	CV-2014-0005765-OC	Chapin Benjamin	2016-07-22	Fail to Appear for Hearing (Examination of Judgment Debtor Hearing)\\n***Warrant Recalled***
873	CV-2014-0005765-OC	Chapin Benjamin	2016-07-22	Fail to Appear for Hearing (Examination of Judgment Debtor Hearing)\\n***Warrant Recalled***
874	CV-2014-0005765-OC	Chapin Benjamin	2016-07-22	Fail to Appear for Hearing (Examination of Judgment Debtor Hearing)\\n***Warrant Recalled***
875	CV-2014-0005765-OC	Chapin Benjamin	2016-07-22	Fail to Appear for Hearing (Examination of Judgment Debtor Hearing)\\n***Warrant Recalled***
876	CV-2014-0005765-OC	Chapin Benjamin	2016-07-22	Fail to Appear for Hearing (Examination of Judgment Debtor Hearing)\\n***Warrant Recalled***
877	CV-2014-0005451-OC	Salinas Jesus	2016-01-29	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
878	CV-2014-0005451-OC	Salinas Jesus	2016-04-22	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
879	CV-2014-0005451-OC	Salinas Jesus	2016-01-29	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
880	CV-2014-0005451-OC	Salinas Jesus	2016-04-22	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
881	CV-2014-0005451-OC	Salinas Jesus	2016-01-29	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
882	CV-2014-0005451-OC	Salinas Jesus	2016-04-22	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
883	CV-2014-0005451-OC	Salinas Jesus	2016-01-29	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
884	CV-2014-0005451-OC	Salinas Jesus	2016-04-22	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
885	CV-2014-0005451-OC	Salinas Jesus	2016-01-29	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
886	CV-2014-0005451-OC	Salinas Jesus	2016-04-22	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
887	CV-2014-0005372-OC	Deblase Jamen Cory	2015-10-21	Fail to Appear for Hearing- debtors examination
888	CV-2014-0005372-OC	Deblase Jamen Cory	2015-10-21	Fail to Appear for Hearing- debtors examination
889	CV-2014-0005372-OC	Deblase Jamen Cory	2015-10-21	Fail to Appear for Hearing- debtors examination
890	CV-2014-0005372-OC	Deblase Jamen Cory	2015-10-21	Fail to Appear for Hearing- debtors examination
891	CV-2014-0005372-OC	Deblase Jamen Cory	2015-10-21	Fail to Appear for Hearing- debtors examination
892	CV-2014-0004592-OC	Benson Lisa Dawn	2016-03-25	Fail to Appear for Hearing-Examination of Judgment Debtor Hearing 7/10/2015 @ 9:00 AM
893	CV-2014-0004592-OC	Benson Lisa Dawn	2016-03-25	Fail to Appear for Hearing-Examination of Judgment Debtor Hearing 7/10/2015 @ 9:00 AM
894	CV-2014-0004592-OC	Benson Lisa Dawn	2016-03-25	Fail to Appear for Hearing-Examination of Judgment Debtor Hearing 7/10/2015 @ 9:00 AM
895	CV-2014-0004592-OC	Benson Lisa Dawn	2016-03-25	Fail to Appear for Hearing-Examination of Judgment Debtor Hearing 7/10/2015 @ 9:00 AM
896	CV-2014-0004592-OC	Benson Lisa Dawn	2016-03-25	Fail to Appear for Hearing-Examination of Judgment Debtor Hearing 7/10/2015 @ 9:00 AM
897	CV-2014-0001515-OC	Kirchner Standley	2016-03-28	Fail to Appear for Hearing - Examination of Judgment Debtor Hearing August 7 2015 at 9:00 a.m.
898	CV-2014-0001515-OC	Kirchner Standley	2016-03-28	Fail to Appear for Hearing - Examination of Judgment Debtor Hearing August 7 2015 at 9:00 a.m.
899	CV-2014-0001515-OC	Kirchner Standley	2016-03-28	Fail to Appear for Hearing - Examination of Judgment Debtor Hearing August 7 2015 at 9:00 a.m.
900	CV-2014-0001515-OC	Kirchner Standley	2016-03-28	Fail to Appear for Hearing - Examination of Judgment Debtor Hearing August 7 2015 at 9:00 a.m.
901	CV-2014-0001515-OC	Kirchner Standley	2016-03-28	Fail to Appear for Hearing - Examination of Judgment Debtor Hearing August 7 2015 at 9:00 a.m.
902	CV-2014-0000613-OC	Matthews Jami L	2016-04-29	Fail to Appear for Debtor's Exam Hearing 9/25/15 @ 9:00 a.m.
903	CV-2014-0000613-OC	Matthews Jami L	2016-04-29	Fail to Appear for Debtor's Exam Hearing 9/25/15 @ 9:00 a.m.
904	CV-2014-0000613-OC	Matthews Jami L	2016-04-29	Fail to Appear for Debtor's Exam Hearing 9/25/15 @ 9:00 a.m.
905	CV-2014-0000613-OC	Matthews Jami L	2016-04-29	Fail to Appear for Debtor's Exam Hearing 9/25/15 @ 9:00 a.m.
906	CV-2014-0000613-OC	Matthews Jami L	2016-04-29	Fail to Appear for Debtor's Exam Hearing 9/25/15 @ 9:00 a.m.
907	CV-2013-0006681-OC	Rodriguez Krystal	2016-04-27	Fail to Appear for Debtor's Exam Hearing 1/27/16
908	CV-2013-0006681-OC	Rodriguez Krystal	2016-04-27	Fail to Appear for Debtor's Exam Hearing 1/27/16
909	CV-2013-0006681-OC	Rodriguez Krystal	2016-04-27	Fail to Appear for Debtor's Exam Hearing 1/27/16
910	CV-2013-0006681-OC	Rodriguez Krystal	2016-04-27	Fail to Appear for Debtor's Exam Hearing 1/27/16
911	CV-2013-0006681-OC	Rodriguez Krystal	2016-04-27	Fail to Appear for Debtor's Exam Hearing 1/27/16
912	CV-2013-0006155-OC	Gasser Tobe	2016-03-28	Fail to Appear for Hearing-Examination of Judgment Debtor Hearing 9/11/2015 @ 9:00 AM
913	CV-2013-0006155-OC	Gasser Tobe	2016-07-28	Fail to Appear for Hearing- Examination Of Judgment Debtor Hearing-September 11 2015 @ 9:00 AM\\n***Warrant Returned Not Found****
914	CV-2013-0006155-OC	Gasser Tobe	2016-12-15	Fail to Appear for Examination of Judgment Debtor Hearing 9-11-15 at 9:00 a.m.
915	CV-2013-0006155-OC	Gasser Tobe	2016-03-28	Fail to Appear for Hearing-Examination of Judgment Debtor Hearing 9/11/2015 @ 9:00 AM
916	CV-2013-0006155-OC	Gasser Tobe	2016-07-28	Fail to Appear for Hearing- Examination Of Judgment Debtor Hearing-September 11 2015 @ 9:00 AM\\n***Warrant Returned Not Found****
917	CV-2013-0006155-OC	Gasser Tobe	2016-12-15	Fail to Appear for Examination of Judgment Debtor Hearing 9-11-15 at 9:00 a.m.
918	CV-2013-0006155-OC	Gasser Tobe	2016-03-28	Fail to Appear for Hearing-Examination of Judgment Debtor Hearing 9/11/2015 @ 9:00 AM
919	CV-2013-0006155-OC	Gasser Tobe	2016-07-28	Fail to Appear for Hearing- Examination Of Judgment Debtor Hearing-September 11 2015 @ 9:00 AM\\n***Warrant Returned Not Found****
920	CV-2013-0006155-OC	Gasser Tobe	2016-12-15	Fail to Appear for Examination of Judgment Debtor Hearing 9-11-15 at 9:00 a.m.
921	CV-2013-0006155-OC	Gasser Tobe	2016-03-28	Fail to Appear for Hearing-Examination of Judgment Debtor Hearing 9/11/2015 @ 9:00 AM
922	CV-2013-0006155-OC	Gasser Tobe	2016-07-28	Fail to Appear for Hearing- Examination Of Judgment Debtor Hearing-September 11 2015 @ 9:00 AM\\n***Warrant Returned Not Found****
923	CV-2013-0006155-OC	Gasser Tobe	2016-12-15	Fail to Appear for Examination of Judgment Debtor Hearing 9-11-15 at 9:00 a.m.
924	CV-2013-0006155-OC	Gasser Tobe	2016-03-28	Fail to Appear for Hearing-Examination of Judgment Debtor Hearing 9/11/2015 @ 9:00 AM
925	CV-2013-0006155-OC	Gasser Tobe	2016-07-28	Fail to Appear for Hearing- Examination Of Judgment Debtor Hearing-September 11 2015 @ 9:00 AM\\n***Warrant Returned Not Found****
926	CV-2013-0006155-OC	Gasser Tobe	2016-12-15	Fail to Appear for Examination of Judgment Debtor Hearing 9-11-15 at 9:00 a.m.
927	CV-2013-0005994-OC	Whipple Duane Jr.	2016-02-29	Fail to Appear for Examination of Judgment of Debtor May 14 2015 at 9:00 a.m. (Original warrant went back to Bryan Zollinger's office)
928	CV-2013-0005994-OC	Whipple Duane Jr.	2016-02-29	Fail to Appear for Examination of Judgment of Debtor May 14 2015 at 9:00 a.m. (Original warrant went back to Bryan Zollinger's office)
929	CV-2013-0005994-OC	Whipple Duane Jr.	2016-02-29	Fail to Appear for Examination of Judgment of Debtor May 14 2015 at 9:00 a.m. (Original warrant went back to Bryan Zollinger's office)
930	CV-2013-0005994-OC	Whipple Duane Jr.	2016-02-29	Fail to Appear for Examination of Judgment of Debtor May 14 2015 at 9:00 a.m. (Original warrant went back to Bryan Zollinger's office)
931	CV-2013-0005994-OC	Whipple Duane Jr.	2016-02-29	Fail to Appear for Examination of Judgment of Debtor May 14 2015 at 9:00 a.m. (Original warrant went back to Bryan Zollinger's office)
932	CV-2013-0005959-OC	Wood Raymond	2017-07-03	Fail to Obey Court Order and appear for Debtor Hearing
933	CV-2013-0005959-OC	Wood Raymond	2017-07-03	Fail to Obey Court Order and appear for Debtor Hearing
934	CV-2013-0005959-OC	Wood Raymond	2017-07-03	Fail to Obey Court Order and appear for Debtor Hearing
935	CV-2013-0005959-OC	Wood Raymond	2017-07-03	Fail to Obey Court Order and appear for Debtor Hearing
936	CV-2013-0005959-OC	Wood Raymond	2017-07-03	Fail to Obey Court Order and appear for Debtor Hearing
937	CV-2013-0005277-OC	Francis Stephanie E	2016-03-31	Fail to Appear for Debtor's Exam Hearing 12/28/15 (LEMHI COUNTY)
938	CV-2013-0005277-OC	Francis Stephanie E	2016-03-31	Fail to Appear for Debtor's Exam Hearing 12/28/15 (LEMHI COUNTY)
939	CV-2013-0005277-OC	Francis Stephanie E	2016-03-31	Fail to Appear for Debtor's Exam Hearing 12/28/15 (LEMHI COUNTY)
940	CV-2013-0005277-OC	Francis Stephanie E	2016-03-31	Fail to Appear for Debtor's Exam Hearing 12/28/15 (LEMHI COUNTY)
941	CV-2013-0005277-OC	Francis Stephanie E	2016-03-31	Fail to Appear for Debtor's Exam Hearing 12/28/15 (LEMHI COUNTY)
942	CV-2013-0004578-OC	Brink Jeff	2016-03-28	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
943	CV-2013-0004578-OC	Brink Jeff	2016-03-28	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
944	CV-2013-0004578-OC	Brink Jeff	2016-03-28	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
945	CV-2013-0004578-OC	Brink Jeff	2016-03-28	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
946	CV-2013-0004578-OC	Brink Jeff	2016-03-28	Fail to Appear for Debtor's Exam Hearing 9/23/15 @ 9:00 a.m.
947	CV-2013-0003192-OC	Swanson Monica	2015-10-27	Fail to Appear for Hearing- Examination of Judgment Debtor Hearing 5/18/2015 @ 9:00 AM
948	CV-2013-0003192-OC	Swanson Monica	2015-10-27	Fail to Appear for Hearing- Examination of Judgment Debtor Hearing 5/18/2015 @ 9:00 AM
949	CV-2013-0003192-OC	Swanson Monica	2015-10-27	Fail to Appear for Hearing- Examination of Judgment Debtor Hearing 5/18/2015 @ 9:00 AM
950	CV-2013-0003192-OC	Swanson Monica	2015-10-27	Fail to Appear for Hearing- Examination of Judgment Debtor Hearing 5/18/2015 @ 9:00 AM
951	CV-2013-0003192-OC	Swanson Monica	2015-10-27	Fail to Appear for Hearing- Examination of Judgment Debtor Hearing 5/18/2015 @ 9:00 AM
952	CV-2013-0002901-OC	Trueblood Krystal F	2016-03-28	Fail to Appear for Debtor's Exam Hearing 9/18/15 @ 9:00 a.m.
953	CV-2013-0002901-OC	Trueblood Krystal F	2016-03-28	Fail to Appear for Debtor's Exam Hearing 9/18/15 @ 9:00 a.m.
954	CV-2013-0002901-OC	Trueblood Krystal F	2016-03-28	Fail to Appear for Debtor's Exam Hearing 9/18/15 @ 9:00 a.m.
955	CV-2013-0002901-OC	Trueblood Krystal F	2016-03-28	Fail to Appear for Debtor's Exam Hearing 9/18/15 @ 9:00 a.m.
956	CV-2013-0002901-OC	Trueblood Krystal F	2016-03-28	Fail to Appear for Debtor's Exam Hearing 9/18/15 @ 9:00 a.m.
957	CV-2013-0000950-OC	Hernandez Angel Ruth	2016-04-29	Fail to Appear for Hearing- Examination of Debtor
958	CV-2013-0000950-OC	Hernandez Angel Ruth	2016-04-29	Fail to Appear for Hearing- Examination of Debtor
959	CV-2013-0000950-OC	Hernandez Angel Ruth	2016-04-29	Fail to Appear for Hearing- Examination of Debtor
960	CV-2013-0000950-OC	Hernandez Angel Ruth	2016-04-29	Fail to Appear for Hearing- Examination of Debtor
961	CV-2013-0000950-OC	Hernandez Angel Ruth	2016-04-29	Fail to Appear for Hearing- Examination of Debtor
962	CV-2012-0006005-OC	Johnson Linda M	2015-01-29	Fail to Appear for Hearing- Supplemental Examination 6/27/2014 @ 9:00 AM
963	CV-2012-0006005-OC	Johnson Linda M	2015-01-29	Fail to Appear for Hearing- Supplemental Examination 6/27/2014 @ 9:00 AM
964	CV-2012-0006005-OC	Johnson Linda M	2015-01-29	Fail to Appear for Hearing- Supplemental Examination 6/27/2014 @ 9:00 AM
965	CV-2012-0006005-OC	Johnson Linda M	2015-01-29	Fail to Appear for Hearing- Supplemental Examination 6/27/2014 @ 9:00 AM
966	CV-2012-0006005-OC	Johnson Linda M	2015-01-29	Fail to Appear for Hearing- Supplemental Examination 6/27/2014 @ 9:00 AM
967	CV-2012-0005409-OC	Waid Brittney Lynn	2015-06-01	Fail to Appear for Hearing-Debtor's Exam 11/20/2014
968	CV-2012-0005409-OC	Waid Brittney Lynn	2015-06-01	Fail to Appear for Hearing-Debtor's Exam 11/20/2014
969	CV-2012-0005409-OC	Waid Brittney Lynn	2015-06-01	Fail to Appear for Hearing-Debtor's Exam 11/20/2014
970	CV-2012-0005409-OC	Waid Brittney Lynn	2015-06-01	Fail to Appear for Hearing-Debtor's Exam 11/20/2014
971	CV-2012-0005409-OC	Waid Brittney Lynn	2015-06-01	Fail to Appear for Hearing-Debtor's Exam 11/20/2014
972	CV-2012-0003329-OC	Hansen Justin	2017-05-22	Fail to Appear for Hearing
973	CV-2012-0003329-OC	Hansen Justin	2017-05-26	Fail to Appear for Hearing/ Examination of Judgment Debtor Hearing
974	CV-2012-0003329-OC	Hansen Justin	2017-05-22	Fail to Appear for Hearing
975	CV-2012-0003329-OC	Hansen Justin	2017-05-26	Fail to Appear for Hearing/ Examination of Judgment Debtor Hearing
976	CV-2012-0003329-OC	Hansen Justin	2017-05-22	Fail to Appear for Hearing
977	CV-2012-0003329-OC	Hansen Justin	2017-05-26	Fail to Appear for Hearing/ Examination of Judgment Debtor Hearing
978	CV-2012-0003329-OC	Hansen Justin	2017-05-22	Fail to Appear for Hearing
979	CV-2012-0003329-OC	Hansen Justin	2017-05-26	Fail to Appear for Hearing/ Examination of Judgment Debtor Hearing
980	CV-2012-0003329-OC	Hansen Justin	2017-05-22	Fail to Appear for Hearing
981	CV-2012-0003329-OC	Hansen Justin	2017-05-26	Fail to Appear for Hearing/ Examination of Judgment Debtor Hearing
982	CV-2012-0002242-OC	Goodson Rebecca	2016-02-29	Fail to Appear for Hearing- Examination of Judgment Debtor Hearing 5/13/15 @ 9:00 AM
983	CV-2012-0002242-OC	Goodson Rebecca	2016-02-29	Fail to Appear for Hearing- Examination of Judgment Debtor Hearing 5/13/15 @ 9:00 AM
984	CV-2012-0002242-OC	Goodson Rebecca	2016-02-29	Fail to Appear for Hearing- Examination of Judgment Debtor Hearing 5/13/15 @ 9:00 AM
985	CV-2012-0002242-OC	Goodson Rebecca	2016-02-29	Fail to Appear for Hearing- Examination of Judgment Debtor Hearing 5/13/15 @ 9:00 AM
986	CV-2012-0002242-OC	Goodson Rebecca	2016-02-29	Fail to Appear for Hearing- Examination of Judgment Debtor Hearing 5/13/15 @ 9:00 AM
987	CV-2011-0001941-OC	Veldkamp Keith	2013-05-09	Fail to Appear for Hearing - Supplemental proceeding - 9/28/11 - BODY ATTACHMENT
988	CV-2011-0001941-OC	Veldkamp Keith	2016-03-28	Fail to Obey Court Order-Failed to Appear for Examination of Judgment Debtor Hearing 8/26/2015 at 9:00
989	CV-2011-0001941-OC	Veldkamp Keith	2013-05-09	Fail to Appear for Hearing - Supplemental proceeding - 9/28/11 - BODY ATTACHMENT
990	CV-2011-0001941-OC	Veldkamp Keith	2016-03-28	Fail to Obey Court Order-Failed to Appear for Examination of Judgment Debtor Hearing 8/26/2015 at 9:00
991	CV-2011-0001941-OC	Veldkamp Keith	2013-05-09	Fail to Appear for Hearing - Supplemental proceeding - 9/28/11 - BODY ATTACHMENT
992	CV-2011-0001941-OC	Veldkamp Keith	2016-03-28	Fail to Obey Court Order-Failed to Appear for Examination of Judgment Debtor Hearing 8/26/2015 at 9:00
993	CV-2011-0001941-OC	Veldkamp Keith	2013-05-09	Fail to Appear for Hearing - Supplemental proceeding - 9/28/11 - BODY ATTACHMENT
994	CV-2011-0001941-OC	Veldkamp Keith	2016-03-28	Fail to Obey Court Order-Failed to Appear for Examination of Judgment Debtor Hearing 8/26/2015 at 9:00
995	CV-2011-0001941-OC	Veldkamp Keith	2013-05-09	Fail to Appear for Hearing - Supplemental proceeding - 9/28/11 - BODY ATTACHMENT
996	CV-2011-0001941-OC	Veldkamp Keith	2016-03-28	Fail to Obey Court Order-Failed to Appear for Examination of Judgment Debtor Hearing 8/26/2015 at 9:00
997	CV-2011-0000984-OC	Shigley Mark	2012-02-09	Fail to Appear for Supplemental Hearing 10/7/11 @ 9:00 a.m.
998	CV-2011-0000984-OC	Shigley Mark	2012-02-09	Fail to Appear for Supplemental Hearing 10/7/11 @ 9:00 a.m.
999	CV-2011-0000984-OC	Shigley Mark	2012-02-09	Fail to Appear for Supplemental Hearing 10/7/11 @ 9:00 a.m.
1000	CV-2011-0000984-OC	Shigley Mark	2012-02-09	Fail to Appear for Supplemental Hearing 10/7/11 @ 9:00 a.m.
1001	CV-2011-0000984-OC	Shigley Mark	2012-02-09	Fail to Appear for Supplemental Hearing 10/7/11 @ 9:00 a.m.
1002	CV-2011-0000709-OC	Stuart Stephanie Gail	2011-07-12	Fail to Appear for Hearing - Failure to appear to examination
1003	CV-2011-0000709-OC	Stuart Stephanie Gail	2011-07-12	Fail to Appear for Hearing - Failure to appear to examination
1004	CV-2011-0000709-OC	Stuart Stephanie Gail	2011-07-12	Fail to Appear for Hearing - Failure to appear to examination
1005	CV-2011-0000709-OC	Stuart Stephanie Gail	2011-07-12	Fail to Appear for Hearing - Failure to appear to examination
1006	CV-2011-0000709-OC	Stuart Stephanie Gail	2011-07-12	Fail to Appear for Hearing - Failure to appear to examination
1007	CV-2010-0006839-OC	Sanchez Maria	2016-06-16	Fail to Appear for Hearing- 2-12-16 @ 9:00 AM
1008	CV-2010-0006839-OC	Sanchez Maria	2016-06-16	Fail to Appear for Hearing- 2-12-16 @ 9:00 AM
1009	CV-2010-0006839-OC	Sanchez Maria	2016-06-16	Fail to Appear for Hearing- 2-12-16 @ 9:00 AM
1010	CV-2010-0006839-OC	Sanchez Maria	2016-06-16	Fail to Appear for Hearing- 2-12-16 @ 9:00 AM
1011	CV-2010-0006839-OC	Sanchez Maria	2016-06-16	Fail to Appear for Hearing- 2-12-16 @ 9:00 AM
1012	CV-2010-0006109-OC	Bierma Jackielyn	2011-03-22	Fail to Appear for Hearing
1013	CV-2010-0006109-OC	Bierma Jackielyn	2011-03-22	Fail to Appear for Hearing
1014	CV-2010-0006109-OC	Bierma Jackielyn	2011-03-22	Fail to Appear for Hearing
1015	CV-2010-0006109-OC	Bierma Jackielyn	2011-03-22	Fail to Appear for Hearing
1016	CV-2010-0006109-OC	Bierma Jackielyn	2011-03-22	Fail to Appear for Hearing
1017	CV-2010-0006105-OC	Ockerman Mark K - Writ Of Body Attachment Returned	2015-02-18	Fail to Appear for Hearing- Debtor's Exam 11/11/2014
1018	CV-2010-0006105-OC	Ockerman Mark K - Writ Of Body Attachment Returned	2015-02-18	Fail to Appear for Hearing- Debtor's Exam 11/11/2014
1019	CV-2010-0006105-OC	Ockerman Mark K - Writ Of Body Attachment Returned	2015-02-18	Fail to Appear for Hearing- Debtor's Exam 11/11/2014
1020	CV-2010-0006105-OC	Ockerman Mark K - Writ Of Body Attachment Returned	2015-02-18	Fail to Appear for Hearing- Debtor's Exam 11/11/2014
1021	CV-2010-0006105-OC	Ockerman Mark K - Writ Of Body Attachment Returned	2015-02-18	Fail to Appear for Hearing- Debtor's Exam 11/11/2014
1022	CV-2010-0005619-OC	Resendiz Shawn	2011-04-06	Fail to Appear for Supplementary Hearing 3/11/11 @ 9:00 a.m.
1023	CV-2010-0005619-OC	Resendiz Shawn	2011-04-06	Fail to Appear for Supplementary Hearing 3/11/11 @ 9:00 a.m.
1024	CV-2010-0005619-OC	Resendiz Shawn	2011-04-06	Fail to Appear for Supplementary Hearing 3/11/11 @ 9:00 a.m.
1025	CV-2010-0005619-OC	Resendiz Shawn	2011-04-06	Fail to Appear for Supplementary Hearing 3/11/11 @ 9:00 a.m.
1026	CV-2010-0005619-OC	Resendiz Shawn	2011-04-06	Fail to Appear for Supplementary Hearing 3/11/11 @ 9:00 a.m.
1027	CV-2010-0004722-OC	Hoffman Robyn	2011-03-01	Fail to Appear for Hearing
1028	CV-2010-0004722-OC	Hoffman Robyn	2011-03-01	Fail to Appear for Hearing
1029	CV-2010-0004722-OC	Hoffman Robyn	2011-03-01	Fail to Appear for Hearing
1030	CV-2010-0004722-OC	Hoffman Robyn	2011-03-01	Fail to Appear for Hearing
1031	CV-2010-0004722-OC	Hoffman Robyn	2011-03-01	Fail to Appear for Hearing
1032	CV-2010-0004449-OC	Returned by Attorney	2011-05-19	Fail to Appear for Supplemental Hearing 5/11/11 @ 9:00 a.m.
1033	CV-2010-0004449-OC	Returned by Attorney	2011-05-19	Fail to Appear for Supplemental Hearing 5/11/11 @ 9:00 a.m.
1034	CV-2010-0004449-OC	Returned by Attorney	2011-05-19	Fail to Appear for Supplemental Hearing 5/11/11 @ 9:00 a.m.
1035	CV-2010-0004449-OC	Returned by Attorney	2011-05-19	Fail to Appear for Supplemental Hearing 5/11/11 @ 9:00 a.m.
1036	CV-2010-0004449-OC	Returned by Attorney	2011-05-19	Fail to Appear for Supplemental Hearing 5/11/11 @ 9:00 a.m.
1037	CV-2010-0004265-OC	De La Vega Eusebio	2011-04-07	Fail to Appear for Supplementary Hearing 3/11/11 @ 9:00 a.m.
1038	CV-2010-0004265-OC	De La Vega Eusebio	2011-04-07	Fail to Appear for Supplementary Hearing 3/11/11 @ 9:00 a.m.
1039	CV-2010-0004265-OC	De La Vega Eusebio	2011-04-07	Fail to Appear for Supplementary Hearing 3/11/11 @ 9:00 a.m.
1040	CV-2010-0004265-OC	De La Vega Eusebio	2011-04-07	Fail to Appear for Supplementary Hearing 3/11/11 @ 9:00 a.m.
1041	CV-2010-0004265-OC	De La Vega Eusebio	2011-04-07	Fail to Appear for Supplementary Hearing 3/11/11 @ 9:00 a.m.
1042	CV-2010-0004245-OC	NOT SERVED	2011-02-10	Fail to Obey Court Order - Order of Examination
1043	CV-2010-0004245-OC	NOT SERVED	2011-02-10	Fail to Obey Court Order - Order of Examination
1044	CV-2010-0004245-OC	NOT SERVED	2011-02-10	Fail to Obey Court Order - Order of Examination
1045	CV-2010-0004245-OC	NOT SERVED	2011-02-10	Fail to Obey Court Order - Order of Examination
1046	CV-2010-0004245-OC	NOT SERVED	2011-02-10	Fail to Obey Court Order - Order of Examination
1047	CV-2010-0004046-OC	Nielson Zachary Storer	2011-04-12	Fail to Appear for Hearing
1048	CV-2010-0004046-OC	Nielson Zachary Storer	2011-04-12	Fail to Appear for Hearing
1049	CV-2010-0004046-OC	Nielson Zachary Storer	2011-04-12	Fail to Appear for Hearing
1050	CV-2010-0004046-OC	Nielson Zachary Storer	2011-04-12	Fail to Appear for Hearing
1051	CV-2010-0004046-OC	Nielson Zachary Storer	2011-04-12	Fail to Appear for Hearing
1052	CV-2010-0003523-OC	Reed Landen	2011-03-11	Fail to Appear for Supplemental Hearing 3/4/11 @ 9:00 a.m.
1053	CV-2010-0003523-OC	Reed Landen	2011-03-11	Fail to Appear for Supplemental Hearing 3/4/11 @ 9:00 a.m.
1054	CV-2010-0003523-OC	Reed Landen	2011-03-11	Fail to Appear for Supplemental Hearing 3/4/11 @ 9:00 a.m.
1055	CV-2010-0003523-OC	Reed Landen	2011-03-11	Fail to Appear for Supplemental Hearing 3/4/11 @ 9:00 a.m.
1056	CV-2010-0003523-OC	Reed Landen	2011-03-11	Fail to Appear for Supplemental Hearing 3/4/11 @ 9:00 a.m.
1057	CV-2010-0002524-OC	Worden Elizabeth	2011-02-07	Fail to Appear 8-19-10 -$500.00 cash bond
1058	CV-2010-0002524-OC	Worden Elizabeth	2011-02-07	Fail to Appear 8-19-10 -$500.00 cash bond
1059	CV-2010-0002524-OC	Worden Elizabeth	2011-02-07	Fail to Appear 8-19-10 -$500.00 cash bond
1060	CV-2010-0002524-OC	Worden Elizabeth	2011-02-07	Fail to Appear 8-19-10 -$500.00 cash bond
1061	CV-2010-0002524-OC	Worden Elizabeth	2011-02-07	Fail to Appear 8-19-10 -$500.00 cash bond
1062	CV-2010-0002172-OC	Warrant Returned	2015-12-10	
1063	CV-2010-0002172-OC	Charlesworth Glen W	2015-12-10	Fail to Appear for Examination of Judgment Debtor Hearing May 15 2015 (Orig. warrant sent back to Bryan Zollinger's office)
1064	CV-2010-0002172-OC	Warrant Returned	2015-12-10	
1065	CV-2010-0002172-OC	Charlesworth Glen W	2015-12-10	Fail to Appear for Examination of Judgment Debtor Hearing May 15 2015 (Orig. warrant sent back to Bryan Zollinger's office)
1066	CV-2010-0002172-OC	Warrant Returned	2015-12-10	
1067	CV-2010-0002172-OC	Charlesworth Glen W	2015-12-10	Fail to Appear for Examination of Judgment Debtor Hearing May 15 2015 (Orig. warrant sent back to Bryan Zollinger's office)
1068	CV-2010-0002172-OC	Warrant Returned	2015-12-10	
1069	CV-2010-0002172-OC	Charlesworth Glen W	2015-12-10	Fail to Appear for Examination of Judgment Debtor Hearing May 15 2015 (Orig. warrant sent back to Bryan Zollinger's office)
1070	CV-2010-0002172-OC	Warrant Returned	2015-12-10	
1071	CV-2010-0002172-OC	Charlesworth Glen W	2015-12-10	Fail to Appear for Examination of Judgment Debtor Hearing May 15 2015 (Orig. warrant sent back to Bryan Zollinger's office)
1072	CV-2010-0001926-OC	Cutler Pat	2011-06-08	Fail to Obey Court Order - Attend Order of Examination on 5/4/11 @ 1:30 pm in Custer Co.
1073	CV-2010-0001926-OC	Cutler Pat	2011-06-08	Fail to Obey Court Order - Attend Order of Examination on 5/4/11 @ 1:30 pm in Custer Co.
1074	CV-2010-0001926-OC	Cutler Pat	2011-06-08	Fail to Obey Court Order - Attend Order of Examination on 5/4/11 @ 1:30 pm in Custer Co.
1075	CV-2010-0001926-OC	Cutler Pat	2011-06-08	Fail to Obey Court Order - Attend Order of Examination on 5/4/11 @ 1:30 pm in Custer Co.
1076	CV-2010-0001926-OC	Cutler Pat	2011-06-08	Fail to Obey Court Order - Attend Order of Examination on 5/4/11 @ 1:30 pm in Custer Co.
1077	CV-2010-0001787-OC	Dashnaw David Sr.	2011-04-13	Fail to Appear for Supplemental Hearing 1/21/11 @ 9:00 a.m.
1078	CV-2010-0001787-OC	Dashnaw David Sr.	2011-04-13	Fail to Appear for Supplemental Hearing 1/21/11 @ 9:00 a.m.
1079	CV-2010-0001787-OC	Dashnaw David Sr.	2011-04-13	Fail to Appear for Supplemental Hearing 1/21/11 @ 9:00 a.m.
1080	CV-2010-0001787-OC	Dashnaw David Sr.	2011-04-13	Fail to Appear for Supplemental Hearing 1/21/11 @ 9:00 a.m.
1081	CV-2010-0001787-OC	Dashnaw David Sr.	2011-04-13	Fail to Appear for Supplemental Hearing 1/21/11 @ 9:00 a.m.
1082	CV-2010-0001779-OC	***NOT FOUND***	2011-10-27	Fail to Appear for Supplemental Hearing 5/13/11 @ 9:00 a.m.
1083	CV-2010-0001779-OC	***NOT FOUND***	2011-10-27	Fail to Appear for Supplemental Hearing 5/13/11 @ 9:00 a.m.
1084	CV-2010-0001779-OC	***NOT FOUND***	2011-10-27	Fail to Appear for Supplemental Hearing 5/13/11 @ 9:00 a.m.
1085	CV-2010-0001779-OC	***NOT FOUND***	2011-10-27	Fail to Appear for Supplemental Hearing 5/13/11 @ 9:00 a.m.
1086	CV-2010-0001779-OC	***NOT FOUND***	2011-10-27	Fail to Appear for Supplemental Hearing 5/13/11 @ 9:00 a.m.
1087	CV-2010-0001313-OC	Jerry Bergeman & Sons	2012-01-19	Fail to Appear for Supplemental Hearing
1088	CV-2010-0001313-OC	Jerry Bergeman & Sons	2012-01-19	Fail to Appear for Supplemental Hearing
1089	CV-2010-0001313-OC	Jerry Bergeman & Sons	2012-01-19	Fail to Appear for Supplemental Hearing
1090	CV-2010-0001313-OC	Jerry Bergeman & Sons	2012-01-19	Fail to Appear for Supplemental Hearing
1091	CV-2010-0001313-OC	Jerry Bergeman & Sons	2012-01-19	Fail to Appear for Supplemental Hearing
1092	CV-2010-0000686-OC	Hill Amanda	2010-07-30	Fail to Appear on or about April 30 2010
1093	CV-2010-0000686-OC	Hill Amanda	2010-07-30	Fail to Appear on or about April 30 2010
1094	CV-2010-0000686-OC	Hill Amanda	2010-07-30	Fail to Appear on or about April 30 2010
1095	CV-2010-0000686-OC	Hill Amanda	2010-07-30	Fail to Appear on or about April 30 2010
1096	CV-2010-0000686-OC	Hill Amanda	2010-07-30	Fail to Appear on or about April 30 2010
1097	CV-2010-0000484-OC	4-4-11	2011-04-11	Fail to Obey Court Order
1098	CV-2010-0000484-OC	4-4-11	2011-04-11	Fail to Obey Court Order
1099	CV-2010-0000484-OC	4-4-11	2011-04-11	Fail to Obey Court Order
1100	CV-2010-0000484-OC	4-4-11	2011-04-11	Fail to Obey Court Order
1101	CV-2010-0000484-OC	4-4-11	2011-04-11	Fail to Obey Court Order
1102	CV-2010-0000174-OC	Ramirez Michael Joseph	2011-07-11	Fail to Appear for Supplemental Hearing 3/3/11 @ 9:00 a.m.
1103	CV-2010-0000174-OC	Ramirez Michael Joseph	2011-07-11	Fail to Appear for Supplemental Hearing 3/3/11 @ 9:00 a.m.
1104	CV-2010-0000174-OC	Ramirez Michael Joseph	2011-07-11	Fail to Appear for Supplemental Hearing 3/3/11 @ 9:00 a.m.
1105	CV-2010-0000174-OC	Ramirez Michael Joseph	2011-07-11	Fail to Appear for Supplemental Hearing 3/3/11 @ 9:00 a.m.
1106	CV-2010-0000174-OC	Ramirez Michael Joseph	2011-07-11	Fail to Appear for Supplemental Hearing 3/3/11 @ 9:00 a.m.
1107	CV-2009-0007582-OC	Taylor Tosha	2011-08-10	Fail to Appear for Hearing
1108	CV-2009-0007582-OC	Taylor Tosha	2011-08-10	Fail to Appear for Hearing
1109	CV-2009-0007582-OC	Taylor Tosha	2011-08-10	Fail to Appear for Hearing
1110	CV-2009-0007582-OC	Taylor Tosha	2011-08-10	Fail to Appear for Hearing
1111	CV-2009-0007582-OC	Taylor Tosha	2011-08-10	Fail to Appear for Hearing
1112	CV-2009-0007469-OC	Barrett Brent	2011-02-24	Fail to Appear for Supplemental Hearing 12/3/10 @ 9:00 a.m.
1113	CV-2009-0007469-OC	Barrett Brent	2011-02-24	Fail to Appear for Supplemental Hearing 12/3/10 @ 9:00 a.m.
1114	CV-2009-0007469-OC	Barrett Brent	2011-02-24	Fail to Appear for Supplemental Hearing 12/3/10 @ 9:00 a.m.
1115	CV-2009-0007469-OC	Barrett Brent	2011-02-24	Fail to Appear for Supplemental Hearing 12/3/10 @ 9:00 a.m.
1116	CV-2009-0007469-OC	Barrett Brent	2011-02-24	Fail to Appear for Supplemental Hearing 12/3/10 @ 9:00 a.m.
1117	CV-2009-0006463-OC	Christensen Camile E.	2010-09-08	Fail to Appear for Supplemental
1118	CV-2009-0006463-OC	Christensen Camile E.	2011-01-07	Fail to Appear for Supplemental
1119	CV-2009-0006463-OC	Christensen Camile E.	2010-09-08	Fail to Appear for Supplemental
1120	CV-2009-0006463-OC	Christensen Camile E.	2011-01-07	Fail to Appear for Supplemental
1121	CV-2009-0006463-OC	Christensen Camile E.	2010-09-08	Fail to Appear for Supplemental
1122	CV-2009-0006463-OC	Christensen Camile E.	2011-01-07	Fail to Appear for Supplemental
1123	CV-2009-0006463-OC	Christensen Camile E.	2010-09-08	Fail to Appear for Supplemental
1124	CV-2009-0006463-OC	Christensen Camile E.	2011-01-07	Fail to Appear for Supplemental
1125	CV-2009-0006463-OC	Christensen Camile E.	2010-09-08	Fail to Appear for Supplemental
1126	CV-2009-0006463-OC	Christensen Camile E.	2011-01-07	Fail to Appear for Supplemental
1127	CV-2009-0006183-OC	Walker Lonnie	2010-05-03	Fail to Appear for Supplemental Hearing 2/5/10 @ 9:00 a.m.
1128	CV-2009-0006183-OC	Walker Lonnie	2010-05-03	Fail to Appear for Supplemental Hearing 2/5/10 @ 9:00 a.m.
1129	CV-2009-0006183-OC	Walker Lonnie	2010-05-03	Fail to Appear for Supplemental Hearing 2/5/10 @ 9:00 a.m.
1130	CV-2009-0006183-OC	Walker Lonnie	2010-05-03	Fail to Appear for Supplemental Hearing 2/5/10 @ 9:00 a.m.
1131	CV-2009-0006183-OC	Walker Lonnie	2010-05-03	Fail to Appear for Supplemental Hearing 2/5/10 @ 9:00 a.m.
1132	CV-2009-0005631-OC	Brown Burlajean B	2011-05-25	Fail to Appear for Supplemental Hearing on 7/23/10 @ 9:00 a.m.
1133	CV-2009-0005631-OC	Brown Burlajean B	2011-05-25	Fail to Appear for Supplemental Hearing on 7/23/10 @ 9:00 a.m.
1134	CV-2009-0005631-OC	Brown Burlajean B	2011-05-25	Fail to Appear for Supplemental Hearing on 7/23/10 @ 9:00 a.m.
1135	CV-2009-0005631-OC	Brown Burlajean B	2011-05-25	Fail to Appear for Supplemental Hearing on 7/23/10 @ 9:00 a.m.
1136	CV-2009-0005631-OC	Brown Burlajean B	2011-05-25	Fail to Appear for Supplemental Hearing on 7/23/10 @ 9:00 a.m.
1137	CV-2009-0005611-OC	Metcalf Matthew C	2010-12-06	Fail to Appear for Supplemental Hearing 11/3/10 @ 9:00 a.m.
1138	CV-2009-0005611-OC	Metcalf Matthew C	2010-12-06	Fail to Appear for Supplemental Hearing 11/3/10 @ 9:00 a.m.
1139	CV-2009-0005611-OC	Metcalf Matthew C	2010-12-06	Fail to Appear for Supplemental Hearing 11/3/10 @ 9:00 a.m.
1140	CV-2009-0005611-OC	Metcalf Matthew C	2010-12-06	Fail to Appear for Supplemental Hearing 11/3/10 @ 9:00 a.m.
1141	CV-2009-0005611-OC	Metcalf Matthew C	2010-12-06	Fail to Appear for Supplemental Hearing 11/3/10 @ 9:00 a.m.
1142	CV-2009-0004929-OC	Cartier Todd	2011-06-21	Fail to Appear for Supplemental Hearing 7/14/10 @ 9:00 a.m.
1143	CV-2009-0004929-OC	Cartier Todd	2011-06-21	Fail to Appear for Supplemental Hearing 7/14/10 @ 9:00 a.m.
1144	CV-2009-0004929-OC	Cartier Todd	2011-06-21	Fail to Appear for Supplemental Hearing 7/14/10 @ 9:00 a.m.
1145	CV-2009-0004929-OC	Cartier Todd	2011-06-21	Fail to Appear for Supplemental Hearing 7/14/10 @ 9:00 a.m.
1146	CV-2009-0004929-OC	Cartier Todd	2011-06-21	Fail to Appear for Supplemental Hearing 7/14/10 @ 9:00 a.m.
1147	CV-2009-0003646-OC	Brown Lisa M.	2010-06-01	Fail to Appear for Hearing - Supplemental Hearing on 11/30/2009
1148	CV-2009-0003646-OC	Brown Lisa M.	2010-06-01	Fail to Appear for Hearing - Supplemental Hearing on 11/30/2009
1149	CV-2009-0003646-OC	Brown Lisa M.	2010-06-01	Fail to Appear for Hearing - Supplemental Hearing on 11/30/2009
1150	CV-2009-0003646-OC	Brown Lisa M.	2010-06-01	Fail to Appear for Hearing - Supplemental Hearing on 11/30/2009
1151	CV-2009-0003646-OC	Brown Lisa M.	2010-06-01	Fail to Appear for Hearing - Supplemental Hearing on 11/30/2009
1152	CV-2009-0003222-OC	Hosac Gregg Leslie Jr.	2010-01-29	Fail to Appear 8-27-09
1153	CV-2009-0003222-OC	Hosac Gregg Leslie Jr.	2010-09-24	Fail to Appear 7-21-10
1154	CV-2009-0003222-OC	Hosac Gregg Leslie Jr.	2010-01-29	Fail to Appear 8-27-09
1155	CV-2009-0003222-OC	Hosac Gregg Leslie Jr.	2010-09-24	Fail to Appear 7-21-10
1156	CV-2009-0003222-OC	Hosac Gregg Leslie Jr.	2010-01-29	Fail to Appear 8-27-09
1157	CV-2009-0003222-OC	Hosac Gregg Leslie Jr.	2010-09-24	Fail to Appear 7-21-10
1158	CV-2009-0003222-OC	Hosac Gregg Leslie Jr.	2010-01-29	Fail to Appear 8-27-09
1159	CV-2009-0003222-OC	Hosac Gregg Leslie Jr.	2010-09-24	Fail to Appear 7-21-10
1160	CV-2009-0003222-OC	Hosac Gregg Leslie Jr.	2010-01-29	Fail to Appear 8-27-09
1161	CV-2009-0003222-OC	Hosac Gregg Leslie Jr.	2010-09-24	Fail to Appear 7-21-10
1162	CV-2009-0003058-OC	(NOT FOUND)	2010-01-29	Fail to Appear for Hearing -Supplemental Hearing 11/30/2009
1163	CV-2009-0003058-OC	(NOT FOUND)	2010-01-29	Fail to Appear for Hearing -Supplemental Hearing 11/30/2009
1164	CV-2009-0003058-OC	(NOT FOUND)	2010-01-29	Fail to Appear for Hearing -Supplemental Hearing 11/30/2009
1165	CV-2009-0003058-OC	(NOT FOUND)	2010-01-29	Fail to Appear for Hearing -Supplemental Hearing 11/30/2009
1166	CV-2009-0003058-OC	(NOT FOUND)	2010-01-29	Fail to Appear for Hearing -Supplemental Hearing 11/30/2009
1167	CV-2009-0002894-OC	Karford Cyndi M	2011-04-07	Fail to Appear for Hearing
1168	CV-2009-0002894-OC	Karford Cyndi M	2011-04-07	Fail to Appear for Hearing
1169	CV-2009-0002894-OC	Karford Cyndi M	2011-04-07	Fail to Appear for Hearing
1170	CV-2009-0002894-OC	Karford Cyndi M	2011-04-07	Fail to Appear for Hearing
1171	CV-2009-0002894-OC	Karford Cyndi M	2011-04-07	Fail to Appear for Hearing
1172	CV-2009-0002852-OC	Thurnwald Amber N.	2012-09-18	Fail to Appear for Hearing - Examination of a Judgment Debtor 7/23/12 @ 3:00 p.m.
1173	CV-2009-0002852-OC	Thurnwald Amber N.	2012-09-18	Fail to Appear for Hearing - Examination of a Judgment Debtor 7/23/12 @ 3:00 p.m.
1174	CV-2009-0002852-OC	Thurnwald Amber N.	2012-09-18	Fail to Appear for Hearing - Examination of a Judgment Debtor 7/23/12 @ 3:00 p.m.
1175	CV-2009-0002852-OC	Thurnwald Amber N.	2012-09-18	Fail to Appear for Hearing - Examination of a Judgment Debtor 7/23/12 @ 3:00 p.m.
1176	CV-2009-0002852-OC	Thurnwald Amber N.	2012-09-18	Fail to Appear for Hearing - Examination of a Judgment Debtor 7/23/12 @ 3:00 p.m.
1177	CV-2009-0002536-OC	Smith Kimberly Jo	2010-02-25	Fail to Appear for Hearing - Body Attachment
1178	CV-2009-0002536-OC	Smith Kimberly Jo	2010-02-25	Fail to Appear for Hearing - Body Attachment
1179	CV-2009-0002536-OC	Smith Kimberly Jo	2010-02-25	Fail to Appear for Hearing - Body Attachment
1180	CV-2009-0002536-OC	Smith Kimberly Jo	2010-02-25	Fail to Appear for Hearing - Body Attachment
1181	CV-2009-0002536-OC	Smith Kimberly Jo	2010-02-25	Fail to Appear for Hearing - Body Attachment
1182	CV-2009-0002300-OC	Whitfield Michelle M.	2010-03-19	Fail to Obey Court Order 7-15-09
1183	CV-2009-0002300-OC	Whitfield Michelle M.	2010-03-19	Fail to Obey Court Order 7-15-09
1184	CV-2009-0002300-OC	Whitfield Michelle M.	2010-03-19	Fail to Obey Court Order 7-15-09
1185	CV-2009-0002300-OC	Whitfield Michelle M.	2010-03-19	Fail to Obey Court Order 7-15-09
1186	CV-2009-0002300-OC	Whitfield Michelle M.	2010-03-19	Fail to Obey Court Order 7-15-09
1187	CV-2009-0002169-OC	Eckley Tiffany Rose	2016-06-03	Fail to Appear for Debtor's Exam
1188	CV-2009-0002169-OC	Eckley Tiffany Rose	2016-06-03	Fail to Appear for Debtor's Exam
1189	CV-2009-0002169-OC	Eckley Tiffany Rose	2016-06-03	Fail to Appear for Debtor's Exam
1190	CV-2009-0002169-OC	Eckley Tiffany Rose	2016-06-03	Fail to Appear for Debtor's Exam
1191	CV-2009-0002169-OC	Eckley Tiffany Rose	2016-06-03	Fail to Appear for Debtor's Exam
1192	CV-2009-0001839-OC	Smith Barbara	2010-12-30	Failed to Appear for Supplemental Hearing 10/27/10 @ 9:00 a.m.
1193	CV-2009-0001839-OC	Smith Barbara	2010-12-30	Failed to Appear for Supplemental Hearing 10/27/10 @ 9:00 a.m.
1194	CV-2009-0001839-OC	Smith Barbara	2010-12-30	Failed to Appear for Supplemental Hearing 10/27/10 @ 9:00 a.m.
1195	CV-2009-0001839-OC	Smith Barbara	2010-12-30	Failed to Appear for Supplemental Hearing 10/27/10 @ 9:00 a.m.
1196	CV-2009-0001839-OC	Smith Barbara	2010-12-30	Failed to Appear for Supplemental Hearing 10/27/10 @ 9:00 a.m.
1197	CV-2009-0001491-OC	Fitch Jason Spencer	2009-08-27	Fail to Appear for Supplemental Hearing 7/17/09 @ 9:00 a.m.
1198	CV-2009-0001491-OC	Fitch Jason Spencer	2009-08-27	Fail to Appear for Supplemental Hearing 7/17/09 @ 9:00 a.m.
1199	CV-2009-0001491-OC	Fitch Jason Spencer	2009-08-27	Fail to Appear for Supplemental Hearing 7/17/09 @ 9:00 a.m.
1200	CV-2009-0001491-OC	Fitch Jason Spencer	2009-08-27	Fail to Appear for Supplemental Hearing 7/17/09 @ 9:00 a.m.
1201	CV-2009-0001491-OC	Fitch Jason Spencer	2009-08-27	Fail to Appear for Supplemental Hearing 7/17/09 @ 9:00 a.m.
1202	CV-2009-0000887-OC	SERVED	2009-08-14	Fail to Appear on 4-30-09 $500.00 Bond (Cash or Surety)
1203	CV-2009-0000887-OC	SERVED	2009-08-14	Fail to Appear on 4-30-09 $500.00 Bond (Cash or Surety)
1204	CV-2009-0000887-OC	SERVED	2009-08-14	Fail to Appear on 4-30-09 $500.00 Bond (Cash or Surety)
1205	CV-2009-0000887-OC	SERVED	2009-08-14	Fail to Appear on 4-30-09 $500.00 Bond (Cash or Surety)
1206	CV-2009-0000887-OC	SERVED	2009-08-14	Fail to Appear on 4-30-09 $500.00 Bond (Cash or Surety)
1207	CV-2009-0000517-OC	SERVED	2009-12-01	Fail to Appear 7-29-09
1208	CV-2009-0000517-OC	SERVED	2009-12-01	Fail to Appear 7-29-09
1209	CV-2009-0000517-OC	SERVED	2009-12-01	Fail to Appear 7-29-09
1210	CV-2009-0000517-OC	SERVED	2009-12-01	Fail to Appear 7-29-09
1211	CV-2009-0000517-OC	SERVED	2009-12-01	Fail to Appear 7-29-09
1212	CV-2008-0007865-OC	Salgado Andy	2009-05-21	Fail to Appear for Hearing
1213	CV-2008-0007865-OC	Salgado Andy	2009-05-21	Fail to Appear for Hearing
1214	CV-2008-0007865-OC	Salgado Andy	2009-05-21	Fail to Appear for Hearing
1215	CV-2008-0007865-OC	Salgado Andy	2009-05-21	Fail to Appear for Hearing
1216	CV-2008-0007865-OC	Salgado Andy	2009-05-21	Fail to Appear for Hearing
1217	CV-2008-0007859-OC	Johnson Myrrian	2009-06-17	Fail to Appear for Supplemental Hearing
1218	CV-2008-0007859-OC	SERVED	2009-08-31	Fail to Appear for Supplemental Hearing
1219	CV-2008-0007859-OC	Johnson Myrrian	2009-06-17	Fail to Appear for Supplemental Hearing
1220	CV-2008-0007859-OC	SERVED	2009-08-31	Fail to Appear for Supplemental Hearing
1221	CV-2008-0007859-OC	Johnson Myrrian	2009-06-17	Fail to Appear for Supplemental Hearing
1222	CV-2008-0007859-OC	SERVED	2009-08-31	Fail to Appear for Supplemental Hearing
1223	CV-2008-0007859-OC	Johnson Myrrian	2009-06-17	Fail to Appear for Supplemental Hearing
1224	CV-2008-0007859-OC	SERVED	2009-08-31	Fail to Appear for Supplemental Hearing
1225	CV-2008-0007859-OC	Johnson Myrrian	2009-06-17	Fail to Appear for Supplemental Hearing
1226	CV-2008-0007859-OC	SERVED	2009-08-31	Fail to Appear for Supplemental Hearing
1227	CV-2008-0007592-OC	Pierson Ryan	2009-11-16	Fail to Appear 8-24-09 (Cash Bond)
1228	CV-2008-0007592-OC	Pierson Ryan	2009-11-16	Fail to Appear 8-24-09 (Cash Bond)
1229	CV-2008-0007592-OC	Pierson Ryan	2009-11-16	Fail to Appear 8-24-09 (Cash Bond)
1230	CV-2008-0007592-OC	Pierson Ryan	2009-11-16	Fail to Appear 8-24-09 (Cash Bond)
1231	CV-2008-0007592-OC	Pierson Ryan	2009-11-16	Fail to Appear 8-24-09 (Cash Bond)
1232	CV-2008-0007520-OC	(Not Served)	2010-02-09	Fail to Appear 10-29-09
1233	CV-2008-0007520-OC	Smith Tracie	2012-01-13	Fail to Appear 8-20-10 (500 cash or surety bond)
1234	CV-2008-0007520-OC	(Not Served)	2010-02-09	Fail to Appear 10-29-09
1235	CV-2008-0007520-OC	Smith Tracie	2012-01-13	Fail to Appear 8-20-10 (500 cash or surety bond)
1236	CV-2008-0007520-OC	(Not Served)	2010-02-09	Fail to Appear 10-29-09
1237	CV-2008-0007520-OC	Smith Tracie	2012-01-13	Fail to Appear 8-20-10 (500 cash or surety bond)
1238	CV-2008-0007520-OC	(Not Served)	2010-02-09	Fail to Appear 10-29-09
1239	CV-2008-0007520-OC	Smith Tracie	2012-01-13	Fail to Appear 8-20-10 (500 cash or surety bond)
1240	CV-2008-0007520-OC	(Not Served)	2010-02-09	Fail to Appear 10-29-09
1241	CV-2008-0007520-OC	Smith Tracie	2012-01-13	Fail to Appear 8-20-10 (500 cash or surety bond)
1242	CV-2008-0006996-OC	RETURN OF SERVICE WAS SENT TO SMITH DRISCOLL RATHER THAN THE COURT; ATTY OFFICE WILL SEND ORIGINAL TO THE COURT.	2009-08-07	Fail to Appear for Hearing - Supplemental Proceeding on June 19 2009
1243	CV-2008-0006996-OC	RETURN OF SERVICE WAS SENT TO SMITH DRISCOLL RATHER THAN THE COURT; ATTY OFFICE WILL SEND ORIGINAL TO THE COURT.	2009-08-07	Fail to Appear for Hearing - Supplemental Proceeding on June 19 2009
1244	CV-2008-0006996-OC	RETURN OF SERVICE WAS SENT TO SMITH DRISCOLL RATHER THAN THE COURT; ATTY OFFICE WILL SEND ORIGINAL TO THE COURT.	2009-08-07	Fail to Appear for Hearing - Supplemental Proceeding on June 19 2009
1245	CV-2008-0006996-OC	RETURN OF SERVICE WAS SENT TO SMITH DRISCOLL RATHER THAN THE COURT; ATTY OFFICE WILL SEND ORIGINAL TO THE COURT.	2009-08-07	Fail to Appear for Hearing - Supplemental Proceeding on June 19 2009
1246	CV-2008-0006996-OC	RETURN OF SERVICE WAS SENT TO SMITH DRISCOLL RATHER THAN THE COURT; ATTY OFFICE WILL SEND ORIGINAL TO THE COURT.	2009-08-07	Fail to Appear for Hearing - Supplemental Proceeding on June 19 2009
1247	CV-2008-0006482-OC	SERVED	2009-07-23	Fail to Appear
1248	CV-2008-0006482-OC	SERVED	2009-07-23	Fail to Appear
1249	CV-2008-0006482-OC	SERVED	2009-07-23	Fail to Appear
1250	CV-2008-0006482-OC	SERVED	2009-07-23	Fail to Appear
1251	CV-2008-0006482-OC	SERVED	2009-07-23	Fail to Appear
1252	CV-2008-0006277-OC	RETURNED NOT SERVED	2009-08-20	Fail to Appear for Supplemental Hearing 8/5/09 @ 9:00 a.m.
1253	CV-2008-0006277-OC	RETURNED NOT SERVED	2009-08-20	Fail to Appear for Supplemental Hearing 8/5/09 @ 9:00 a.m.
1254	CV-2008-0006277-OC	RETURNED NOT SERVED	2009-08-20	Fail to Appear for Supplemental Hearing 8/5/09 @ 9:00 a.m.
1255	CV-2008-0006277-OC	RETURNED NOT SERVED	2009-08-20	Fail to Appear for Supplemental Hearing 8/5/09 @ 9:00 a.m.
1256	CV-2008-0006277-OC	RETURNED NOT SERVED	2009-08-20	Fail to Appear for Supplemental Hearing 8/5/09 @ 9:00 a.m.
1257	CV-2008-0006232-OC	Johnson Aimee Nicole	2009-04-17	Fail to Appear for Hearing
1258	CV-2008-0006232-OC	Johnson Aimee Nicole	2009-04-17	Fail to Appear for Hearing
1259	CV-2008-0006232-OC	Johnson Aimee Nicole	2009-04-17	Fail to Appear for Hearing
1260	CV-2008-0006232-OC	Johnson Aimee Nicole	2009-04-17	Fail to Appear for Hearing
1261	CV-2008-0006232-OC	Johnson Aimee Nicole	2009-04-17	Fail to Appear for Hearing
1262	CV-2008-0005948-OC	Archibald Eileen	2010-04-09	Fail to Appear for Hearing - February 24 2010 @ 9:00 a.m.
1263	CV-2008-0005948-OC	Archibald Eileen	2010-04-09	Fail to Appear for Hearing - February 24 2010 @ 9:00 a.m.
1264	CV-2008-0005948-OC	Archibald Eileen	2010-04-09	Fail to Appear for Hearing - February 24 2010 @ 9:00 a.m.
1265	CV-2008-0005948-OC	Archibald Eileen	2010-04-09	Fail to Appear for Hearing - February 24 2010 @ 9:00 a.m.
1266	CV-2008-0005948-OC	Archibald Eileen	2010-04-09	Fail to Appear for Hearing - February 24 2010 @ 9:00 a.m.
1267	CV-2008-0005653-OC	Morrison Chris	2009-07-27	Fail to Appear for Supplemental Hearing
1268	CV-2008-0005653-OC	Morrison Chris	2009-07-27	Fail to Appear for Supplemental Hearing
1269	CV-2008-0005653-OC	Morrison Chris	2009-07-27	Fail to Appear for Supplemental Hearing
1270	CV-2008-0005653-OC	Morrison Chris	2009-07-27	Fail to Appear for Supplemental Hearing
1271	CV-2008-0005653-OC	Morrison Chris	2009-07-27	Fail to Appear for Supplemental Hearing
1272	CV-2008-0005523-OC	(Not Served)	2010-02-09	Fail to Appear for Supplemental Hearing 12/18/09 @ 9:00 a.m.
1273	CV-2008-0005523-OC	Bartholomae Jenny	2010-10-06	Fail to Appear for Supplemental Hearing 9/10/10 @ 9:00 a.m.
1274	CV-2008-0005523-OC	(Not Served)	2010-02-09	Fail to Appear for Supplemental Hearing 12/18/09 @ 9:00 a.m.
1275	CV-2008-0005523-OC	Bartholomae Jenny	2010-10-06	Fail to Appear for Supplemental Hearing 9/10/10 @ 9:00 a.m.
1276	CV-2008-0005523-OC	(Not Served)	2010-02-09	Fail to Appear for Supplemental Hearing 12/18/09 @ 9:00 a.m.
1277	CV-2008-0005523-OC	Bartholomae Jenny	2010-10-06	Fail to Appear for Supplemental Hearing 9/10/10 @ 9:00 a.m.
1278	CV-2008-0005523-OC	(Not Served)	2010-02-09	Fail to Appear for Supplemental Hearing 12/18/09 @ 9:00 a.m.
1279	CV-2008-0005523-OC	Bartholomae Jenny	2010-10-06	Fail to Appear for Supplemental Hearing 9/10/10 @ 9:00 a.m.
1280	CV-2008-0005523-OC	(Not Served)	2010-02-09	Fail to Appear for Supplemental Hearing 12/18/09 @ 9:00 a.m.
1281	CV-2008-0005523-OC	Bartholomae Jenny	2010-10-06	Fail to Appear for Supplemental Hearing 9/10/10 @ 9:00 a.m.
1282	CV-2008-0004523-OC	Rardin Steven Burton/Not Served	2010-01-04	Fail to Appear for Hearing - Supplemental Exam 11/25/2009
1283	CV-2008-0004523-OC	Rardin Steven Burton/Not Served	2010-01-04	Fail to Appear for Hearing - Supplemental Exam 11/25/2009
1284	CV-2008-0004523-OC	Rardin Steven Burton/Not Served	2010-01-04	Fail to Appear for Hearing - Supplemental Exam 11/25/2009
1285	CV-2008-0004523-OC	Rardin Steven Burton/Not Served	2010-01-04	Fail to Appear for Hearing - Supplemental Exam 11/25/2009
1418	CV-2005-0002069-OC	Cortez Pamela Iris	2010-12-13	Fail to Appear for Hearing -
1286	CV-2008-0004523-OC	Rardin Steven Burton/Not Served	2010-01-04	Fail to Appear for Hearing - Supplemental Exam 11/25/2009
1287	CV-2008-0004521-OC	Weaver Shannon	2010-09-09	Fail to Appear for Supplemental Hearing
1288	CV-2008-0004521-OC	Served	2010-09-09	
1289	CV-2008-0004521-OC	Weaver Shannon	2010-09-09	Fail to Appear for Supplemental Hearing
1290	CV-2008-0004521-OC	Served	2010-09-09	
1291	CV-2008-0004521-OC	Weaver Shannon	2010-09-09	Fail to Appear for Supplemental Hearing
1292	CV-2008-0004521-OC	Served	2010-09-09	
1293	CV-2008-0004521-OC	Weaver Shannon	2010-09-09	Fail to Appear for Supplemental Hearing
1294	CV-2008-0004521-OC	Served	2010-09-09	
1295	CV-2008-0004521-OC	Weaver Shannon	2010-09-09	Fail to Appear for Supplemental Hearing
1296	CV-2008-0004521-OC	Served	2010-09-09	
1297	CV-2008-0004394-OC	Rhodes Tom	2009-06-10	Fail to Obey Court Order cash or surety bond $3104.73
1298	CV-2008-0004394-OC	Rhodes Tom	2009-06-10	Fail to Obey Court Order cash or surety bond $3104.73
1299	CV-2008-0004394-OC	Rhodes Tom	2009-06-10	Fail to Obey Court Order cash or surety bond $3104.73
1300	CV-2008-0004394-OC	Rhodes Tom	2009-06-10	Fail to Obey Court Order cash or surety bond $3104.73
1301	CV-2008-0004394-OC	Rhodes Tom	2009-06-10	Fail to Obey Court Order cash or surety bond $3104.73
1302	CV-2008-0004389-OC	Reid Allen	2012-07-24	Fail to Appear for Supplemental Hearing 07/08/09 @ 9:45 a.m.
1303	CV-2008-0004389-OC	Reid Allen	2012-07-24	Fail to Appear for Supplemental Hearing 07/08/09 @ 9:45 a.m.
1304	CV-2008-0004389-OC	Reid Allen	2012-07-24	Fail to Appear for Supplemental Hearing 07/08/09 @ 9:45 a.m.
1305	CV-2008-0004389-OC	Reid Allen	2012-07-24	Fail to Appear for Supplemental Hearing 07/08/09 @ 9:45 a.m.
1306	CV-2008-0004389-OC	Reid Allen	2012-07-24	Fail to Appear for Supplemental Hearing 07/08/09 @ 9:45 a.m.
1307	CV-2008-0004215-OC	Yorgensen Julie D.	2010-05-12	Fail to Appear for Hearing - 04/14/2010 @ 9:00 a.m.
1308	CV-2008-0004215-OC	Yorgensen Julie D.	2010-05-12	Fail to Appear for Hearing - 04/14/2010 @ 9:00 a.m.
1309	CV-2008-0004215-OC	Yorgensen Julie D.	2010-05-12	Fail to Appear for Hearing - 04/14/2010 @ 9:00 a.m.
1310	CV-2008-0004215-OC	Yorgensen Julie D.	2010-05-12	Fail to Appear for Hearing - 04/14/2010 @ 9:00 a.m.
1311	CV-2008-0004215-OC	Yorgensen Julie D.	2010-05-12	Fail to Appear for Hearing - 04/14/2010 @ 9:00 a.m.
1312	CV-2008-0003743-OC	Gilbert Gwen L	2009-06-04	Fail to Appear for Debtor's Exam 3/30/09
1313	CV-2008-0003743-OC	Gilbert Gwen L	2009-06-04	Fail to Appear for Debtor's Exam 3/30/09
1314	CV-2008-0003743-OC	Gilbert Gwen L	2009-06-04	Fail to Appear for Debtor's Exam 3/30/09
1315	CV-2008-0003743-OC	Gilbert Gwen L	2009-06-04	Fail to Appear for Debtor's Exam 3/30/09
1316	CV-2008-0003743-OC	Gilbert Gwen L	2009-06-04	Fail to Appear for Debtor's Exam 3/30/09
1317	CV-2008-0002906-OC	Baker James	2010-07-29	Fail to Appear for Hearing
1318	CV-2008-0002906-OC	Baker James	2010-07-29	Fail to Appear for Hearing
1319	CV-2008-0002906-OC	Baker James	2010-07-29	Fail to Appear for Hearing
1320	CV-2008-0002906-OC	Baker James	2010-07-29	Fail to Appear for Hearing
1321	CV-2008-0002906-OC	Baker James	2010-07-29	Fail to Appear for Hearing
1322	CV-2008-0002357-OC	Olson Mike J	2010-12-21	Fail to Appear for Supplemental Hearing 10/27/10 @ 9:00 a.m.
1323	CV-2008-0002357-OC	Olson Mike J	2010-12-21	Fail to Appear for Supplemental Hearing 10/27/10 @ 9:00 a.m.
1324	CV-2008-0002357-OC	Olson Mike J	2010-12-21	Fail to Appear for Supplemental Hearing 10/27/10 @ 9:00 a.m.
1325	CV-2008-0002357-OC	Olson Mike J	2010-12-21	Fail to Appear for Supplemental Hearing 10/27/10 @ 9:00 a.m.
1326	CV-2008-0002357-OC	Olson Mike J	2010-12-21	Fail to Appear for Supplemental Hearing 10/27/10 @ 9:00 a.m.
1327	CV-2008-0002143-OC	White Christine N	2010-03-02	Fail to Appear for Hearing - February 24 2010 @ 9:00 a.m.
1328	CV-2008-0002143-OC	White Christine N	2010-03-02	Fail to Appear for Hearing - February 24 2010 @ 9:00 a.m.
1329	CV-2008-0002143-OC	White Christine N	2010-03-02	Fail to Appear for Hearing - February 24 2010 @ 9:00 a.m.
1330	CV-2008-0002143-OC	White Christine N	2010-03-02	Fail to Appear for Hearing - February 24 2010 @ 9:00 a.m.
1331	CV-2008-0002143-OC	White Christine N	2010-03-02	Fail to Appear for Hearing - February 24 2010 @ 9:00 a.m.
1332	CV-2008-0001727-OC	Lovelace Ashlee Marie	2009-09-28	Fail to Appear for Supplemental Hearing 8/19/09 at 9:45 a.m.
1333	CV-2008-0001727-OC	(Body Attachment)	2009-09-28	(Body Attachment)
1334	CV-2008-0001727-OC	Lovelace Ashlee Marie	2009-09-28	Fail to Appear for Supplemental Hearing 8/19/09 at 9:45 a.m.
1335	CV-2008-0001727-OC	(Body Attachment)	2009-09-28	(Body Attachment)
1336	CV-2008-0001727-OC	Lovelace Ashlee Marie	2009-09-28	Fail to Appear for Supplemental Hearing 8/19/09 at 9:45 a.m.
1337	CV-2008-0001727-OC	(Body Attachment)	2009-09-28	(Body Attachment)
1338	CV-2008-0001727-OC	Lovelace Ashlee Marie	2009-09-28	Fail to Appear for Supplemental Hearing 8/19/09 at 9:45 a.m.
1339	CV-2008-0001727-OC	(Body Attachment)	2009-09-28	(Body Attachment)
1340	CV-2008-0001727-OC	Lovelace Ashlee Marie	2009-09-28	Fail to Appear for Supplemental Hearing 8/19/09 at 9:45 a.m.
1341	CV-2008-0001727-OC	(Body Attachment)	2009-09-28	(Body Attachment)
1342	CV-2007-0006682-OC	SERVED	2009-07-23	Fail to Appear on or about 4-8-09
1343	CV-2007-0006682-OC	SERVED	2009-07-23	Fail to Appear on or about 4-8-09
1344	CV-2007-0006682-OC	SERVED	2009-07-23	Fail to Appear on or about 4-8-09
1345	CV-2007-0006682-OC	SERVED	2009-07-23	Fail to Appear on or about 4-8-09
1346	CV-2007-0006682-OC	SERVED	2009-07-23	Fail to Appear on or about 4-8-09
1347	CV-2007-0006052-OC	Unable to Locate	2010-01-13	Fail to Obey Court Order-
1348	CV-2007-0006052-OC	Unable to Locate	2010-01-13	Fail to Obey Court Order-
1349	CV-2007-0006052-OC	Unable to Locate	2010-01-13	Fail to Obey Court Order-
1350	CV-2007-0006052-OC	Unable to Locate	2010-01-13	Fail to Obey Court Order-
1351	CV-2007-0006052-OC	Unable to Locate	2010-01-13	Fail to Obey Court Order-
1352	CV-2007-0005905-OC	***NOT FOUND***	2014-03-12	
1353	CV-2007-0005905-OC	***NOT FOUND***	2014-03-12	
1354	CV-2007-0005905-OC	***NOT FOUND***	2014-03-12	
1355	CV-2007-0005905-OC	***NOT FOUND***	2014-03-12	
1356	CV-2007-0005905-OC	***NOT FOUND***	2014-03-12	
1357	CV-2007-0003867-OC	***UNABLE TO LOCATE PARTY***	2009-12-01	Fail to Appear for Supplmental Hearing 10/21/09 @ 9:00 a.m.
1358	CV-2007-0003867-OC	***UNABLE TO LOCATE PARTY***	2009-12-01	Fail to Appear for Supplmental Hearing 10/21/09 @ 9:00 a.m.
1359	CV-2007-0003867-OC	***UNABLE TO LOCATE PARTY***	2009-12-01	Fail to Appear for Supplmental Hearing 10/21/09 @ 9:00 a.m.
1360	CV-2007-0003867-OC	***UNABLE TO LOCATE PARTY***	2009-12-01	Fail to Appear for Supplmental Hearing 10/21/09 @ 9:00 a.m.
1361	CV-2007-0003867-OC	***UNABLE TO LOCATE PARTY***	2009-12-01	Fail to Appear for Supplmental Hearing 10/21/09 @ 9:00 a.m.
1362	CV-2007-0003726-OC	Blair Robert	2011-12-20	Fail to Appear for Supplemental Hearing 10/26/11 @ 9:00 a.m.
1363	CV-2007-0003726-OC	Blair Robert	2011-12-20	Fail to Appear for Supplemental Hearing 10/26/11 @ 9:00 a.m.
1364	CV-2007-0003726-OC	Blair Robert	2011-12-20	Fail to Appear for Supplemental Hearing 10/26/11 @ 9:00 a.m.
1365	CV-2007-0003726-OC	Blair Robert	2011-12-20	Fail to Appear for Supplemental Hearing 10/26/11 @ 9:00 a.m.
1366	CV-2007-0003726-OC	Blair Robert	2011-12-20	Fail to Appear for Supplemental Hearing 10/26/11 @ 9:00 a.m.
1367	CV-2007-0003236-OC	Robinson Joseph F.	2012-02-22	Fail to Appear for Supplemental Hearing 2/9/11 @ 9:00 a.m.
1368	CV-2007-0003236-OC	Robinson Joseph F.	2012-02-22	Fail to Appear for Supplemental Hearing 2/9/11 @ 9:00 a.m.
1369	CV-2007-0003236-OC	Robinson Joseph F.	2012-02-22	Fail to Appear for Supplemental Hearing 2/9/11 @ 9:00 a.m.
1370	CV-2007-0003236-OC	Robinson Joseph F.	2012-02-22	Fail to Appear for Supplemental Hearing 2/9/11 @ 9:00 a.m.
1371	CV-2007-0003236-OC	Robinson Joseph F.	2012-02-22	Fail to Appear for Supplemental Hearing 2/9/11 @ 9:00 a.m.
1372	CV-2007-0002366-OC	Wolfe Sadie	2010-12-21	Fail to Appear for Supplemental Hearing 11/17/10 @ 9:00 a.m.
1373	CV-2007-0002366-OC	Wolfe Sadie	2010-12-21	Fail to Appear for Supplemental Hearing 11/17/10 @ 9:00 a.m.
1374	CV-2007-0002366-OC	Wolfe Sadie	2010-12-21	Fail to Appear for Supplemental Hearing 11/17/10 @ 9:00 a.m.
1375	CV-2007-0002366-OC	Wolfe Sadie	2010-12-21	Fail to Appear for Supplemental Hearing 11/17/10 @ 9:00 a.m.
1376	CV-2007-0002366-OC	Wolfe Sadie	2010-12-21	Fail to Appear for Supplemental Hearing 11/17/10 @ 9:00 a.m.
1377	CV-2007-0001933-OC	Kelso Curtis	2010-03-24	Fail to Appear pursuant to Certain Order Dated 12-25-09
1378	CV-2007-0001933-OC	Kelso Curtis	2010-03-24	Fail to Appear pursuant to Certain Order Dated 12-25-09
1379	CV-2007-0001933-OC	Kelso Curtis	2010-03-24	Fail to Appear pursuant to Certain Order Dated 12-25-09
1380	CV-2007-0001933-OC	Kelso Curtis	2010-03-24	Fail to Appear pursuant to Certain Order Dated 12-25-09
1381	CV-2007-0001933-OC	Kelso Curtis	2010-03-24	Fail to Appear pursuant to Certain Order Dated 12-25-09
1382	CV-2007-0001465-OC	Herrera Larry G.	2009-10-07	Fail to Appear for Supplemental Hearing 7/22/09 @ 9:00 a.m
1383	CV-2007-0001465-OC	Herrera Larry G.	2009-10-07	Fail to Appear for Supplemental Hearing 7/22/09 @ 9:00 a.m
1384	CV-2007-0001465-OC	Herrera Larry G.	2009-10-07	Fail to Appear for Supplemental Hearing 7/22/09 @ 9:00 a.m
1385	CV-2007-0001465-OC	Herrera Larry G.	2009-10-07	Fail to Appear for Supplemental Hearing 7/22/09 @ 9:00 a.m
1386	CV-2007-0001465-OC	Herrera Larry G.	2009-10-07	Fail to Appear for Supplemental Hearing 7/22/09 @ 9:00 a.m
1387	CV-2006-0007333-OC	SERVED	2009-08-31	Fail to Appear for Supplemenal Hearing 7/22/09 @ 9:00 a.m.
1388	CV-2006-0007333-OC	SERVED	2009-08-31	Fail to Appear for Supplemenal Hearing 7/22/09 @ 9:00 a.m.
1389	CV-2006-0007333-OC	SERVED	2009-08-31	Fail to Appear for Supplemenal Hearing 7/22/09 @ 9:00 a.m.
1390	CV-2006-0007333-OC	SERVED	2009-08-31	Fail to Appear for Supplemenal Hearing 7/22/09 @ 9:00 a.m.
1391	CV-2006-0007333-OC	SERVED	2009-08-31	Fail to Appear for Supplemenal Hearing 7/22/09 @ 9:00 a.m.
1392	CV-2006-0003791-OC	Colby Gennie M.	2009-10-07	Fail to Appear for Supplemental Hearing 7/17/09 @ 9:00 a.m.
1393	CV-2006-0003791-OC	Colby Gennie M.	2009-10-07	Fail to Appear for Supplemental Hearing 7/17/09 @ 9:00 a.m.
1394	CV-2006-0003791-OC	Colby Gennie M.	2009-10-07	Fail to Appear for Supplemental Hearing 7/17/09 @ 9:00 a.m.
1395	CV-2006-0003791-OC	Colby Gennie M.	2009-10-07	Fail to Appear for Supplemental Hearing 7/17/09 @ 9:00 a.m.
1396	CV-2006-0003791-OC	Colby Gennie M.	2009-10-07	Fail to Appear for Supplemental Hearing 7/17/09 @ 9:00 a.m.
1397	CV-2006-0003346-OC	Jerry Bergman & Sons	2010-05-05	Fail to Appear for Supplemental Hearing 1/27/10 @ 9:00 a.m.
1398	CV-2006-0003346-OC	Jerry Bergman & Sons	2010-05-05	Fail to Appear for Supplemental Hearing 1/27/10 @ 9:00 a.m.
1399	CV-2006-0003346-OC	Jerry Bergman & Sons	2010-05-05	Fail to Appear for Supplemental Hearing 1/27/10 @ 9:00 a.m.
1400	CV-2006-0003346-OC	Jerry Bergman & Sons	2010-05-05	Fail to Appear for Supplemental Hearing 1/27/10 @ 9:00 a.m.
1401	CV-2006-0003346-OC	Jerry Bergman & Sons	2010-05-05	Fail to Appear for Supplemental Hearing 1/27/10 @ 9:00 a.m.
1402	CV-2006-0003126-OC	Christenot Tim	2011-07-25	Fail to Appear for Supplemental Hearing 10/26/10 @ 3:00 p.m. in Lemhi County
1403	CV-2006-0003126-OC	Christenot Tim	2011-07-25	Fail to Appear for Supplemental Hearing 10/26/10 @ 3:00 p.m. in Lemhi County
1404	CV-2006-0003126-OC	Christenot Tim	2011-07-25	Fail to Appear for Supplemental Hearing 10/26/10 @ 3:00 p.m. in Lemhi County
1405	CV-2006-0003126-OC	Christenot Tim	2011-07-25	Fail to Appear for Supplemental Hearing 10/26/10 @ 3:00 p.m. in Lemhi County
1406	CV-2006-0003126-OC	Christenot Tim	2011-07-25	Fail to Appear for Supplemental Hearing 10/26/10 @ 3:00 p.m. in Lemhi County
1407	CV-2006-0001961-OC	Colvin Joshua	2007-06-25	Fail to Appear for Hearing - April 2 2007
1408	CV-2006-0001961-OC	Colvin Joshua	2007-06-25	Fail to Appear for Hearing - April 2 2007
1409	CV-2006-0001961-OC	Colvin Joshua	2007-06-25	Fail to Appear for Hearing - April 2 2007
1410	CV-2006-0001961-OC	Colvin Joshua	2007-06-25	Fail to Appear for Hearing - April 2 2007
1411	CV-2006-0001961-OC	Colvin Joshua	2007-06-25	Fail to Appear for Hearing - April 2 2007
1412	CV-2006-0000288-OC	Loftus Brandy	2009-05-26	Fail to Appear for Hearing - April 2 2007
1413	CV-2006-0000288-OC	Loftus Brandy	2009-05-26	Fail to Appear for Hearing - April 2 2007
1414	CV-2006-0000288-OC	Loftus Brandy	2009-05-26	Fail to Appear for Hearing - April 2 2007
1415	CV-2006-0000288-OC	Loftus Brandy	2009-05-26	Fail to Appear for Hearing - April 2 2007
1416	CV-2006-0000288-OC	Loftus Brandy	2009-05-26	Fail to Appear for Hearing - April 2 2007
1417	CV-2005-0002069-OC	Cortez Pamela Iris	2010-12-13	Fail to Appear for Hearing -
1419	CV-2005-0002069-OC	Cortez Pamela Iris	2010-12-13	Fail to Appear for Hearing -
1420	CV-2005-0002069-OC	Cortez Pamela Iris	2010-12-13	Fail to Appear for Hearing -
1421	CV-2005-0002069-OC	Cortez Pamela Iris	2010-12-13	Fail to Appear for Hearing -
1422	CV-2004-0004754-OC	SERVED	2009-07-22	Fail to Appear for Supplemental Hearing 7/1/09 @ 9:00 a.m.
1423	CV-2004-0004754-OC	SERVED	2009-07-22	Fail to Appear for Supplemental Hearing 7/1/09 @ 9:00 a.m.
1424	CV-2004-0004754-OC	SERVED	2009-07-22	Fail to Appear for Supplemental Hearing 7/1/09 @ 9:00 a.m.
1425	CV-2004-0004754-OC	SERVED	2009-07-22	Fail to Appear for Supplemental Hearing 7/1/09 @ 9:00 a.m.
1426	CV-2004-0004754-OC	SERVED	2009-07-22	Fail to Appear for Supplemental Hearing 7/1/09 @ 9:00 a.m.
1427	CV-2005-0012696-C	Failure to Appear Defendant: Mcdowell George S	2007-02-26	Failure to Appear Defendant: Mcdowell George S
1428	CV-2005-0012696-C	Mcdowell Melissa	2008-10-03	Failure to Appear
1429	CV-2005-0012696-C	Failure to Appear Defendant: Mcdowell George S	2007-02-26	Failure to Appear Defendant: Mcdowell George S
1430	CV-2005-0012696-C	Mcdowell Melissa	2008-10-03	Failure to Appear
1431	CV-2005-0012696-C	Failure to Appear Defendant: Mcdowell George S	2007-02-26	Failure to Appear Defendant: Mcdowell George S
1432	CV-2005-0012696-C	Mcdowell Melissa	2008-10-03	Failure to Appear
1433	CV-2005-0012696-C	Failure to Appear Defendant: Mcdowell George S	2007-02-26	Failure to Appear Defendant: Mcdowell George S
1434	CV-2005-0012696-C	Mcdowell Melissa	2008-10-03	Failure to Appear
1435	CV-2005-0012696-C	Failure to Appear Defendant: Mcdowell George S	2007-02-26	Failure to Appear Defendant: Mcdowell George S
1436	CV-2005-0012696-C	Mcdowell Melissa	2008-10-03	Failure to Appear
1437	CV-2006-0000022	Chandler Steven & Marsha	2011-02-07	\N
1438	CV-2013-0000180	King, Angie King, Kollin C	2013-10-21	\N
1439	CV-2012-0000723	Clark, Christopher Clark, Stephanie	2013-05-13	\N
1440	CV-2013-0001039	Andrew, Mike Jane Doe	2014-09-16	\N
1441	CV-2012-0000875	Smith, Rachel Smith, Shane Eldon	2014-12-10	\N
1442	CV-2012-0000713	Fillmore, Craig Lynn	2014-04-09	\N
1443	CV-2010-0001277	Davis, J Alan Davis, Jennifer	2012-06-29	\N
1444	CV-2010-0001065	James, Jodi Dee	2011-09-23	\N
1445	CV-2010-0000845	Wilde, John Doe Wilde, Shelly	2012-02-28	\N
1446	CV-2010-0000522	Williams, Wendy Williams, Wes E	2012-01-09	\N
1447	CV-2009-0000151	Doe, John Stowers, Rebecca Ann	2011-01-13	\N
1448	CV-2008-0001058	Doe, John Sakan, Karla R	2015-12-12	\N
1449	CV-2008-0000892	Baler, John Doe Baler, Nikki	2010-05-19	\N
1450	CV-2008-0000836	Wakley, Charity Ann Waley, John Doe	2009-06-19	\N
1451	CV-2008-0000831	Acor, Kevin T Acor, Tiffany	2008-12-03	\N
1452	CV-2008-0000367	Coffey, Tyanna Daylene Wellard, Matthew J	2011-07-21	\N
1453	CV-2007-0000381	Estrada, Jaime A Estrade, Maria D	2008-07-31	\N
1454	CV-2013-0000709	Jane Doe, Justesen, Roger	2014-10-29	\N
1455	CV-2013-0000577	Bryd, Douglas Byrd, Wendi	2014-06-12	\N
1456	CV-2013-0000576	Wilburn, Jason	2014-05-27	\N
1457	CV-2012-0000903	Jane Doe, Jones, Brenden	2013-09-03	\N
1458	CV-2010-0000280	Callier, Josh Callier, Mistie	2013-01-28	\N
1459	CV-2010-0000013	Brockman, Casey J Brockman, Sharon	2010-01-25	\N
1460	CV-2009-0000828	Wheeless, Bellia Wheeless, Wesley A	2010-10-04	\N
1461	CV-2009-0000279	John Doe, Kelly, Adrianna R	2012-01-30	\N
1462	CV-2008-0000255	John Doe, Knetzger, Heather N	2011-05-10	\N
1463	CV-2008-0000024	Garcia, Anthony Garcia, carol A	2009-05-27	\N
1464	CV-2007-00000884	Price, David Price, Teri	2008-08-04	\N
1465	CV-2007-00000821	John Doe, Nelson, Brittany	2009-09-23	\N
1466	CV-2007-00000260	John Doe, Pence, Amy N	2008-04-02	\N
1467	CV-2013-0000067	Hansen, Ann Hansen, Roger	2015-02-09	\N
1468	CV-2014-0000374	Covington Wende Ardell	2014-11-12	Failure to Appear for Debtors Exam on 09/12/2014 @ 9:30 AM
1469	CV-2014-0000374	Warrant Returned "SERVED on 11/12/2014	2014-11-18	
\.


--
-- Name: warrants_returned_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mehrotra
--

SELECT pg_catalog.setval('warrants_returned_id_seq', 1469, true);


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
-- Name: plaintiffs plaintiffs_name_key; Type: CONSTRAINT; Schema: public; Owner: Mehrotra
--

ALTER TABLE ONLY plaintiffs
    ADD CONSTRAINT plaintiffs_name_key UNIQUE (name);


--
-- Name: plaintiffs plaintiffs_pkey; Type: CONSTRAINT; Schema: public; Owner: Mehrotra
--

ALTER TABLE ONLY plaintiffs
    ADD CONSTRAINT plaintiffs_pkey PRIMARY KEY (id);


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
-- Name: cases cases_plaintiff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mehrotra
--

ALTER TABLE ONLY cases
    ADD CONSTRAINT cases_plaintiff_id_fkey FOREIGN KEY (plaintiff_id) REFERENCES plaintiffs(id);


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

