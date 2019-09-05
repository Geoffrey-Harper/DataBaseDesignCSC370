--
-- PostgreSQL database dump
--

-- Dumped from database version 10.9 (Ubuntu 10.9-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.9 (Ubuntu 10.9-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: campaign; Type: TABLE; Schema: public; Owner: gambia
--

CREATE TABLE public.campaign (
    campaignid integer NOT NULL,
    campaignname character varying(100),
    campaignstartdate character varying(100),
    campaignenddate character varying(100),
    campaignlocation character varying(100),
    cost real NOT NULL,
    CONSTRAINT campaign_cost_check CHECK ((cost >= (0)::double precision))
);


ALTER TABLE public.campaign OWNER TO gambia;

--
-- Name: contributesto; Type: TABLE; Schema: public; Owner: gambia
--

CREATE TABLE public.contributesto (
    donationid integer NOT NULL,
    officename character varying(100) NOT NULL
);


ALTER TABLE public.contributesto OWNER TO gambia;

--
-- Name: donations; Type: TABLE; Schema: public; Owner: gambia
--

CREATE TABLE public.donations (
    donationid integer NOT NULL,
    donator character varying(100),
    amount real NOT NULL,
    CONSTRAINT donations_amount_check CHECK ((amount >= (0)::double precision))
);


ALTER TABLE public.donations OWNER TO gambia;

--
-- Name: event; Type: TABLE; Schema: public; Owner: gambia
--

CREATE TABLE public.event (
    eventid integer NOT NULL,
    campaignid integer NOT NULL,
    eventname character varying(100),
    eventstartdate character varying(100),
    eventenddate character varying(100),
    eventlocation character varying(100)
);


ALTER TABLE public.event OWNER TO gambia;

--
-- Name: isfundedby; Type: TABLE; Schema: public; Owner: gambia
--

CREATE TABLE public.isfundedby (
    donationid integer NOT NULL,
    campaignid integer NOT NULL
);


ALTER TABLE public.isfundedby OWNER TO gambia;

--
-- Name: items; Type: TABLE; Schema: public; Owner: gambia
--

CREATE TABLE public.items (
    itemid integer NOT NULL,
    itemname character varying(100),
    cost real NOT NULL,
    CONSTRAINT items_cost_check CHECK ((cost >= (0)::double precision))
);


ALTER TABLE public.items OWNER TO gambia;

--
-- Name: memebers; Type: TABLE; Schema: public; Owner: gambia
--

CREATE TABLE public.memebers (
    memeberid integer NOT NULL,
    memebername character varying(100)
);


ALTER TABLE public.memebers OWNER TO gambia;

--
-- Name: office; Type: TABLE; Schema: public; Owner: gambia
--

CREATE TABLE public.office (
    officename character varying(100) NOT NULL,
    rentprice real,
    CONSTRAINT office_rentprice_check CHECK ((rentprice >= (0)::double precision))
);


ALTER TABLE public.office OWNER TO gambia;

--
-- Name: participatesin; Type: TABLE; Schema: public; Owner: gambia
--

CREATE TABLE public.participatesin (
    campaignid integer NOT NULL,
    staffid integer NOT NULL
);


ALTER TABLE public.participatesin OWNER TO gambia;

--
-- Name: paysfor; Type: TABLE; Schema: public; Owner: gambia
--

CREATE TABLE public.paysfor (
    donationid integer NOT NULL,
    staffid integer NOT NULL
);


ALTER TABLE public.paysfor OWNER TO gambia;

--
-- Name: purchasedfor; Type: TABLE; Schema: public; Owner: gambia
--

CREATE TABLE public.purchasedfor (
    itemid integer NOT NULL,
    staffid integer NOT NULL
);


ALTER TABLE public.purchasedfor OWNER TO gambia;

--
-- Name: staff; Type: TABLE; Schema: public; Owner: gambia
--

CREATE TABLE public.staff (
    staffid integer NOT NULL,
    staffname character varying(100),
    salary real NOT NULL,
    tier integer,
    burnout boolean,
    numberofcampaigns integer,
    CONSTRAINT staff_numberofcampaigns_check CHECK ((numberofcampaigns >= 0)),
    CONSTRAINT staff_tier_check CHECK (((tier = 1) OR (tier = 2)))
);


ALTER TABLE public.staff OWNER TO gambia;

--
-- Name: supports; Type: TABLE; Schema: public; Owner: gambia
--

CREATE TABLE public.supports (
    memeberid integer NOT NULL,
    campaignid integer NOT NULL
);


ALTER TABLE public.supports OWNER TO gambia;

--
-- Name: websitelog; Type: TABLE; Schema: public; Owner: gambia
--

CREATE TABLE public.websitelog (
    logid integer NOT NULL,
    pushdate character varying(100),
    phasenumber integer,
    campaignid integer NOT NULL
);


ALTER TABLE public.websitelog OWNER TO gambia;

--
-- Data for Name: campaign; Type: TABLE DATA; Schema: public; Owner: gambia
--

COPY public.campaign (campaignid, campaignname, campaignstartdate, campaignenddate, campaignlocation, cost) FROM stdin;
1	G$	May 16th, 2019	May 10th, 2019	VicCIty	200000
2	HnM	October 16th, 2019	October 31th, 2019	NewYORK	1500
3	NickBreakfast	MAY 20th, 2019	August 10th, 2019	Vancouver, Washtionton	80
4	GangGang	June 16th, 2019	MAY 10th, 2019	VicCIty	200000
5	ICETRAY	MAY 6th, 2019	MAY 20th, 2019	VicCIty	4000000
\.


--
-- Data for Name: contributesto; Type: TABLE DATA; Schema: public; Owner: gambia
--

COPY public.contributesto (donationid, officename) FROM stdin;
1	THE HACKED LIBRARY
\.


--
-- Data for Name: donations; Type: TABLE DATA; Schema: public; Owner: gambia
--

COPY public.donations (donationid, donator, amount) FROM stdin;
1	Bono	50
2	STEPHEN HARPER	0
3	ANDREW WEAVER?	25
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: gambia
--

COPY public.event (eventid, campaignid, eventname, eventstartdate, eventenddate, eventlocation) FROM stdin;
1	1	watch tiger play golf	MAY 20th, 2019	MAY 24th, 2019	Vancouver
2	1	watch Brooks play golf	MAY 20th, 2019	MAY 24th, 2019	Vancouver
3	5	Go get a swatch from Johnny Dang	May 20th, 2019	May 20th, 2019	Vancouver
\.


--
-- Data for Name: isfundedby; Type: TABLE DATA; Schema: public; Owner: gambia
--

COPY public.isfundedby (donationid, campaignid) FROM stdin;
1	2
3	2
3	1
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: gambia
--

COPY public.items (itemid, itemname, cost) FROM stdin;
1	GolfCLUBS	10000
2	CEOs YACHT	10000000
3	BOXTICKETS TO RAPTORS GAME	6000
\.


--
-- Data for Name: memebers; Type: TABLE DATA; Schema: public; Owner: gambia
--

COPY public.memebers (memeberid, memebername) FROM stdin;
1	GEOFF
2	NICK
3	ANDREAS
\.


--
-- Data for Name: office; Type: TABLE DATA; Schema: public; Owner: gambia
--

COPY public.office (officename, rentprice) FROM stdin;
THE HACKED LIBRARY	1000
\.


--
-- Data for Name: participatesin; Type: TABLE DATA; Schema: public; Owner: gambia
--

COPY public.participatesin (campaignid, staffid) FROM stdin;
1	1
\.


--
-- Data for Name: paysfor; Type: TABLE DATA; Schema: public; Owner: gambia
--

COPY public.paysfor (donationid, staffid) FROM stdin;
1	1
1	2
\.


--
-- Data for Name: purchasedfor; Type: TABLE DATA; Schema: public; Owner: gambia
--

COPY public.purchasedfor (itemid, staffid) FROM stdin;
1	2
3	2
\.


--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: gambia
--

COPY public.staff (staffid, staffname, salary, tier, burnout, numberofcampaigns) FROM stdin;
3	PHIL KNIGHT	0	2	t	300
1	Lebron James	5000	2	t	30
2	MICHEAL JEFFREY JORDAN!	6	1	f	2
\.


--
-- Data for Name: supports; Type: TABLE DATA; Schema: public; Owner: gambia
--

COPY public.supports (memeberid, campaignid) FROM stdin;
1	1
1	2
2	1
\.


--
-- Data for Name: websitelog; Type: TABLE DATA; Schema: public; Owner: gambia
--

COPY public.websitelog (logid, pushdate, phasenumber, campaignid) FROM stdin;
1	MAY 16th	1	1
\.


--
-- Name: campaign campaign_pkey; Type: CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_pkey PRIMARY KEY (campaignid);


--
-- Name: contributesto contributesto_pkey; Type: CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.contributesto
    ADD CONSTRAINT contributesto_pkey PRIMARY KEY (donationid, officename);


--
-- Name: donations donations_pkey; Type: CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.donations
    ADD CONSTRAINT donations_pkey PRIMARY KEY (donationid);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (eventid);


--
-- Name: isfundedby isfundedby_pkey; Type: CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.isfundedby
    ADD CONSTRAINT isfundedby_pkey PRIMARY KEY (donationid, campaignid);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (itemid);


--
-- Name: memebers memebers_pkey; Type: CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.memebers
    ADD CONSTRAINT memebers_pkey PRIMARY KEY (memeberid);


--
-- Name: office office_pkey; Type: CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.office
    ADD CONSTRAINT office_pkey PRIMARY KEY (officename);


--
-- Name: participatesin participatesin_pkey; Type: CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.participatesin
    ADD CONSTRAINT participatesin_pkey PRIMARY KEY (campaignid, staffid);


--
-- Name: paysfor paysfor_pkey; Type: CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.paysfor
    ADD CONSTRAINT paysfor_pkey PRIMARY KEY (donationid, staffid);


--
-- Name: purchasedfor purchasedfor_pkey; Type: CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.purchasedfor
    ADD CONSTRAINT purchasedfor_pkey PRIMARY KEY (itemid, staffid);


--
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staffid);


--
-- Name: supports supports_pkey; Type: CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.supports
    ADD CONSTRAINT supports_pkey PRIMARY KEY (memeberid, campaignid);


--
-- Name: websitelog websitelog_pkey; Type: CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.websitelog
    ADD CONSTRAINT websitelog_pkey PRIMARY KEY (logid);


--
-- Name: contributesto contributesto_donationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.contributesto
    ADD CONSTRAINT contributesto_donationid_fkey FOREIGN KEY (donationid) REFERENCES public.donations(donationid);


--
-- Name: contributesto contributesto_officename_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.contributesto
    ADD CONSTRAINT contributesto_officename_fkey FOREIGN KEY (officename) REFERENCES public.office(officename);


--
-- Name: event event_campaignid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_campaignid_fkey FOREIGN KEY (campaignid) REFERENCES public.campaign(campaignid);


--
-- Name: isfundedby isfundedby_campaignid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.isfundedby
    ADD CONSTRAINT isfundedby_campaignid_fkey FOREIGN KEY (campaignid) REFERENCES public.campaign(campaignid);


--
-- Name: isfundedby isfundedby_donationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.isfundedby
    ADD CONSTRAINT isfundedby_donationid_fkey FOREIGN KEY (donationid) REFERENCES public.donations(donationid);


--
-- Name: participatesin participatesin_campaignid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.participatesin
    ADD CONSTRAINT participatesin_campaignid_fkey FOREIGN KEY (campaignid) REFERENCES public.campaign(campaignid);


--
-- Name: paysfor paysfor_donationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.paysfor
    ADD CONSTRAINT paysfor_donationid_fkey FOREIGN KEY (donationid) REFERENCES public.donations(donationid);


--
-- Name: purchasedfor purchasedfor_itemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.purchasedfor
    ADD CONSTRAINT purchasedfor_itemid_fkey FOREIGN KEY (itemid) REFERENCES public.items(itemid);


--
-- Name: supports supports_campaignid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.supports
    ADD CONSTRAINT supports_campaignid_fkey FOREIGN KEY (campaignid) REFERENCES public.campaign(campaignid);


--
-- Name: supports supports_memeberid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.supports
    ADD CONSTRAINT supports_memeberid_fkey FOREIGN KEY (memeberid) REFERENCES public.memebers(memeberid);


--
-- Name: websitelog websitelog_campaignid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gambia
--

ALTER TABLE ONLY public.websitelog
    ADD CONSTRAINT websitelog_campaignid_fkey FOREIGN KEY (campaignid) REFERENCES public.campaign(campaignid);


--
-- PostgreSQL database dump complete
--

