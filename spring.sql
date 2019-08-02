--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.13
-- Dumped by pg_dump version 9.5.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Sales; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public."Sales" (
    sale_id integer NOT NULL,
    customer_name character varying NOT NULL,
    price_of_purchase double precision,
    item_purchased integer NOT NULL
);


ALTER TABLE public."Sales" OWNER TO vagrant;

--
-- Name: Sales_sale_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public."Sales_sale_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sales_sale_id_seq" OWNER TO vagrant;

--
-- Name: Sales_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public."Sales_sale_id_seq" OWNED BY public."Sales".sale_id;


--
-- Name: apples; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.apples (
    apple_id integer NOT NULL,
    pollination_group character varying,
    tree_id integer,
    variety character varying,
    age_of_tree integer,
    color character varying,
    freeze_date timestamp without time zone,
    thaw_by_date timestamp without time zone,
    thawed_out_date timestamp without time zone,
    expiration_date timestamp without time zone NOT NULL,
    new_expiration_date timestamp without time zone
);


ALTER TABLE public.apples OWNER TO vagrant;

--
-- Name: apples_apple_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.apples_apple_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apples_apple_id_seq OWNER TO vagrant;

--
-- Name: apples_apple_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.apples_apple_id_seq OWNED BY public.apples.apple_id;


--
-- Name: bananas; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.bananas (
    banana_id integer NOT NULL,
    generation_number integer,
    tree_id integer,
    variety character varying(55),
    freeze_date timestamp without time zone,
    thaw_by_date timestamp without time zone,
    thawed_out_date timestamp without time zone,
    expiration_date timestamp without time zone NOT NULL,
    new_expiration_date timestamp without time zone
);


ALTER TABLE public.bananas OWNER TO vagrant;

--
-- Name: bananas_banana_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.bananas_banana_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bananas_banana_id_seq OWNER TO vagrant;

--
-- Name: bananas_banana_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.bananas_banana_id_seq OWNED BY public.bananas.banana_id;


--
-- Name: butter; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.butter (
    butter_id integer NOT NULL,
    cow_id integer NOT NULL,
    carton character varying,
    churner character varying NOT NULL,
    number_sticks integer,
    expiration_date timestamp without time zone NOT NULL,
    freeze_date character varying,
    thaw_by_date timestamp without time zone,
    thawed_out_date timestamp without time zone,
    new_expiration_date timestamp without time zone
);


ALTER TABLE public.butter OWNER TO vagrant;

--
-- Name: butter_butter_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.butter_butter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.butter_butter_id_seq OWNER TO vagrant;

--
-- Name: butter_butter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.butter_butter_id_seq OWNED BY public.butter.butter_id;


--
-- Name: milk; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.milk (
    cartons integer,
    cow_id integer NOT NULL,
    cow_age integer,
    cow_breed character varying,
    cow_length character varying,
    cow_weight character varying,
    expiration_date character varying NOT NULL,
    freeze_date character varying,
    thaw_by_date timestamp without time zone,
    thawed_out_date timestamp without time zone,
    new_expiration_date timestamp without time zone,
    vendor character varying
);


ALTER TABLE public.milk OWNER TO vagrant;

--
-- Name: milk_cow_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.milk_cow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.milk_cow_id_seq OWNER TO vagrant;

--
-- Name: milk_cow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.milk_cow_id_seq OWNED BY public.milk.cow_id;


--
-- Name: sale_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public."Sales" ALTER COLUMN sale_id SET DEFAULT nextval('public."Sales_sale_id_seq"'::regclass);


--
-- Name: apple_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.apples ALTER COLUMN apple_id SET DEFAULT nextval('public.apples_apple_id_seq'::regclass);


--
-- Name: banana_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.bananas ALTER COLUMN banana_id SET DEFAULT nextval('public.bananas_banana_id_seq'::regclass);


--
-- Name: butter_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.butter ALTER COLUMN butter_id SET DEFAULT nextval('public.butter_butter_id_seq'::regclass);


--
-- Name: cow_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.milk ALTER COLUMN cow_id SET DEFAULT nextval('public.milk_cow_id_seq'::regclass);


--
-- Data for Name: Sales; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public."Sales" (sale_id, customer_name, price_of_purchase, item_purchased) FROM stdin;
1	Jonathan Lindsey	6	43950454
2	Edwin Allen	6	1311
3	Kayla Hartman	5	91523532
4	Jaime Tyler	6	9818279
5	Mark Mcgee	6	8243
\.


--
-- Name: Sales_sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public."Sales_sale_id_seq"', 5, true);


--
-- Data for Name: apples; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.apples (apple_id, pollination_group, tree_id, variety, age_of_tree, color, freeze_date, thaw_by_date, thawed_out_date, expiration_date, new_expiration_date) FROM stdin;
61661936	Group B	22408068	Braeburn	34	Yellow-ish white	\N	\N	\N	2019-11-19 00:00:00	\N
21145995	Group C	73003120	Crispin	75	Yellow-ish white	\N	\N	\N	2019-11-05 00:00:00	\N
57463902	Group F	59487975	Crispin	28	Yellow-ish white	\N	\N	\N	2019-03-24 00:00:00	\N
91855244	Group B	12224098	Delicious	33	Yellow-ish white	\N	\N	\N	2019-02-18 00:00:00	\N
74316588	Group D	43321407	Jonagold	34	Red	\N	\N	\N	2019-08-29 00:00:00	\N
93984997	Group E	13582128	Jonagold	73	Yellow-ish white	\N	\N	\N	2019-08-12 00:00:00	\N
2956909	Group F	87614275	Delicious	85	Yellow-ish white	\N	\N	\N	2019-07-08 00:00:00	\N
60776471	Group B	81167791	Honeycrisp	89	White	\N	\N	\N	2019-05-27 00:00:00	\N
15220479	Group B	27136683	Gala	31	Red	\N	\N	\N	2019-07-16 00:00:00	\N
19046587	Group F	5489619	Gala	16	White	\N	\N	\N	2019-03-11 00:00:00	\N
93073028	Group B	87495027	Delicious	60	Yellow	\N	\N	\N	2019-09-11 00:00:00	\N
49045406	Group B	68048112	Jonagold	41	White	\N	\N	\N	2019-09-13 00:00:00	\N
51290757	Group D	18545258	Honeycrisp	86	White	\N	\N	\N	2019-04-28 00:00:00	\N
54705562	Group D	15288738	Jonagold	33	Yellow	\N	\N	\N	2019-02-16 00:00:00	\N
33936741	Group C	67303366	Braeburn	81	White	\N	\N	\N	2019-09-17 00:00:00	\N
24761130	Group A	98632	Jonagold	36	Yellow	\N	\N	\N	2019-04-08 00:00:00	\N
12930500	Group A	60536181	Braeburn	36	Red	\N	\N	\N	2019-08-17 00:00:00	\N
77224712	Group E	19400822	Honeycrisp	51	Yellow	\N	\N	\N	2019-04-08 00:00:00	\N
55331708	Group D	98500383	Delicious	85	Yellow-ish white	\N	\N	\N	2019-03-18 00:00:00	\N
23820586	Group C	15663306	Braeburn	10	Red	\N	\N	\N	2019-09-02 00:00:00	\N
39523235	Group A	11827535	Delicious	67	White	\N	\N	\N	2019-04-20 00:00:00	\N
20955458	Group D	99571290	Jonagold	36	White	\N	\N	\N	2019-03-23 00:00:00	\N
69536489	Group D	39946140	Honeycrisp	34	Red	\N	\N	\N	2019-04-12 00:00:00	\N
30354036	Group F	29188079	Crispin	12	Yellow-ish white	\N	\N	\N	2019-03-14 00:00:00	\N
22720948	Group D	88096513	Gala	53	Red	\N	\N	\N	2019-06-26 00:00:00	\N
2102245	Group C	8963826	Crispin	21	Red	\N	\N	\N	2019-12-19 00:00:00	\N
25405293	Group B	90827709	Jonagold	85	Red	\N	\N	\N	2019-10-16 00:00:00	\N
92986695	Group B	70087284	Delicious	18	Yellow	\N	\N	\N	2019-11-04 00:00:00	\N
67161959	Group A	88323411	Crispin	16	Yellow-ish white	\N	\N	\N	2019-03-18 00:00:00	\N
80455486	Group A	68698584	Honeycrisp	48	Red	\N	\N	\N	2019-02-23 00:00:00	\N
98098071	Group F	56318999	Gala	24	Red	\N	\N	\N	2019-11-22 00:00:00	\N
787116	Group D	55874731	Braeburn	39	Red	\N	\N	\N	2019-11-20 00:00:00	\N
37146740	Group C	10656587	Crispin	16	Red	\N	\N	\N	2019-12-10 00:00:00	\N
72730980	Group D	56660449	Delicious	61	Red	\N	\N	\N	2019-10-27 00:00:00	\N
88765624	Group A	45347528	Delicious	66	Yellow	\N	\N	\N	2019-06-27 00:00:00	\N
39730558	Group F	20259631	Delicious	45	Red	\N	\N	\N	2019-03-13 00:00:00	\N
16129771	Group B	91358912	Jonagold	54	Yellow	\N	\N	\N	2019-11-28 00:00:00	\N
79265706	Group E	11996828	Jonagold	49	Yellow-ish white	\N	\N	\N	2019-09-11 00:00:00	\N
79209519	Group F	31948135	Delicious	58	Yellow-ish white	\N	\N	\N	2019-03-04 00:00:00	\N
42522447	Group D	48013727	Braeburn	25	Yellow-ish white	\N	\N	\N	2019-06-11 00:00:00	\N
81527946	Group A	37308018	Crispin	41	Yellow	\N	\N	\N	2019-10-10 00:00:00	\N
3357408	Group F	95958125	Honeycrisp	18	White	\N	\N	\N	2019-04-11 00:00:00	\N
65805688	Group D	85709652	Crispin	63	Yellow	\N	\N	\N	2019-04-27 00:00:00	\N
75138509	Group C	96227022	Crispin	65	White	\N	\N	\N	2019-03-19 00:00:00	\N
10828618	Group A	76730368	Jonagold	69	Red	\N	\N	\N	2019-03-19 00:00:00	\N
68578336	Group D	10719497	Gala	23	Yellow	\N	\N	\N	2019-03-30 00:00:00	\N
93811149	Group F	1561579	Delicious	36	Red	\N	\N	\N	2019-12-15 00:00:00	\N
91878700	Group F	22461513	Delicious	53	Yellow	\N	\N	\N	2019-11-21 00:00:00	\N
97948308	Group A	61960893	Gala	34	White	\N	\N	\N	2019-05-19 00:00:00	\N
86084062	Group A	67098828	Honeycrisp	57	Yellow	\N	\N	\N	2019-02-25 00:00:00	\N
56735598	Group F	76934797	Braeburn	61	Yellow-ish white	\N	\N	\N	2019-04-17 00:00:00	\N
16299658	Group C	72066041	Delicious	79	White	\N	\N	\N	2019-04-07 00:00:00	\N
8109101	Group D	27731321	Delicious	87	Yellow	\N	\N	\N	2019-08-11 00:00:00	\N
23048492	Group F	49341447	Honeycrisp	66	Red	\N	\N	\N	2019-12-05 00:00:00	\N
25911077	Group E	79868488	Delicious	37	White	\N	\N	\N	2019-11-25 00:00:00	\N
4787303	Group C	16249615	Crispin	39	White	\N	\N	\N	2019-02-15 00:00:00	\N
99159443	Group A	59112587	Jonagold	33	Red	\N	\N	\N	2019-08-03 00:00:00	\N
32466409	Group E	85854666	Jonagold	60	Yellow	\N	\N	\N	2019-03-24 00:00:00	\N
75228293	Group A	36392636	Jonagold	55	Red	\N	\N	\N	2019-02-12 00:00:00	\N
91870131	Group A	27022313	Jonagold	61	Yellow	\N	\N	\N	2019-10-01 00:00:00	\N
48690522	Group F	9837157	Honeycrisp	85	White	\N	\N	\N	2019-03-15 00:00:00	\N
47509900	Group A	63055368	Gala	35	Yellow-ish white	\N	\N	\N	2019-01-31 00:00:00	\N
38165825	Group E	13671334	Jonagold	63	Yellow-ish white	\N	\N	\N	2019-07-21 00:00:00	\N
29018727	Group B	31957472	Jonagold	80	Red	\N	\N	\N	2019-06-06 00:00:00	\N
42067207	Group E	50495405	Jonagold	24	Yellow-ish white	\N	\N	\N	2019-02-18 00:00:00	\N
62212632	Group D	40934839	Honeycrisp	35	White	\N	\N	\N	2019-12-14 00:00:00	\N
88159317	Group B	16718937	Crispin	53	White	\N	\N	\N	2019-12-04 00:00:00	\N
28786450	Group D	25524031	Braeburn	39	Red	\N	\N	\N	2019-03-25 00:00:00	\N
62597432	Group D	77683878	Delicious	33	White	\N	\N	\N	2019-10-02 00:00:00	\N
99187859	Group B	34683347	Crispin	88	Red	\N	\N	\N	2019-09-07 00:00:00	\N
70835335	Group D	63545241	Jonagold	53	Yellow-ish white	\N	\N	\N	2019-11-16 00:00:00	\N
43553860	Group E	45506840	Crispin	27	Red	\N	\N	\N	2019-09-25 00:00:00	\N
6901257	Group D	47228016	Braeburn	82	Yellow-ish white	\N	\N	\N	2019-06-21 00:00:00	\N
86493208	Group F	50653416	Jonagold	20	White	\N	\N	\N	2019-05-27 00:00:00	\N
56221787	Group E	22678331	Braeburn	41	Yellow-ish white	\N	\N	\N	2019-11-24 00:00:00	\N
24429085	Group D	50461684	Crispin	17	Red	\N	\N	\N	2019-06-14 00:00:00	\N
69236129	Group F	34451519	Jonagold	71	White	\N	\N	\N	2019-05-11 00:00:00	\N
33608860	Group E	17645454	Braeburn	79	Red	\N	\N	\N	2019-12-05 00:00:00	\N
20530761	Group C	68091248	Crispin	53	Yellow	\N	\N	\N	2019-05-16 00:00:00	\N
17205665	Group E	98631285	Jonagold	50	White	\N	\N	\N	2019-09-23 00:00:00	\N
69214028	Group C	6842086	Gala	82	Red	\N	\N	\N	2019-05-15 00:00:00	\N
95006987	Group D	69161889	Crispin	48	Red	\N	\N	\N	2019-05-29 00:00:00	\N
57140018	Group B	31885645	Crispin	10	White	\N	\N	\N	2019-12-02 00:00:00	\N
17711548	Group A	5931897	Jonagold	69	Red	\N	\N	\N	2019-02-27 00:00:00	\N
63065848	Group E	43341115	Gala	44	Yellow-ish white	\N	\N	\N	2019-03-15 00:00:00	\N
72424957	Group A	6912789	Braeburn	54	Red	\N	\N	\N	2019-08-26 00:00:00	\N
12480524	Group E	87408362	Delicious	30	Yellow-ish white	\N	\N	\N	2019-11-25 00:00:00	\N
76889004	Group A	98205400	Delicious	88	Yellow	\N	\N	\N	2019-02-22 00:00:00	\N
63332186	Group D	92533240	Gala	83	Yellow	\N	\N	\N	2019-05-28 00:00:00	\N
37170431	Group D	30125735	Gala	60	Yellow	\N	\N	\N	2019-04-11 00:00:00	\N
82517250	Group F	85411005	Delicious	60	Yellow-ish white	\N	\N	\N	2019-12-08 00:00:00	\N
33081410	Group D	72388006	Jonagold	42	Yellow-ish white	\N	\N	\N	2019-07-06 00:00:00	\N
70748222	Group C	83664250	Gala	66	Yellow-ish white	\N	\N	\N	2019-06-05 00:00:00	\N
65889237	Group A	37497750	Crispin	71	White	\N	\N	\N	2019-06-16 00:00:00	\N
301954	Group C	46482112	Braeburn	39	Red	\N	\N	\N	2019-09-07 00:00:00	\N
29853670	Group A	45971266	Honeycrisp	43	Yellow-ish white	\N	\N	\N	2019-11-25 00:00:00	\N
91356314	Group B	24224680	Delicious	66	Yellow-ish white	\N	\N	\N	2019-02-05 00:00:00	\N
61677760	Group C	67056477	Gala	11	Yellow	\N	\N	\N	2019-02-18 00:00:00	\N
88041285	Group A	58791134	Honeycrisp	21	White	\N	\N	\N	2019-12-20 00:00:00	\N
23343788	Group F	86279161	Honeycrisp	32	Red	\N	\N	\N	2019-04-06 00:00:00	\N
41385395	Group A	81811274	Braeburn	43	Yellow-ish white	\N	\N	\N	2019-08-10 00:00:00	\N
70739343	Group E	49815948	Honeycrisp	68	Yellow	\N	\N	\N	2019-12-04 00:00:00	\N
7514289	Group F	95977553	Gala	47	White	\N	\N	\N	2019-04-22 00:00:00	\N
17235976	Group C	24439480	Braeburn	37	Red	\N	\N	\N	2019-06-27 00:00:00	\N
14459177	Group B	76834332	Gala	80	Yellow	\N	\N	\N	2019-02-21 00:00:00	\N
42121251	Group E	78244221	Honeycrisp	50	Red	\N	\N	\N	2019-07-10 00:00:00	\N
69724039	Group D	57943015	Honeycrisp	83	Yellow-ish white	\N	\N	\N	2019-05-14 00:00:00	\N
27487792	Group F	33381060	Honeycrisp	81	Yellow-ish white	\N	\N	\N	2019-08-19 00:00:00	\N
19014906	Group B	96840818	Braeburn	31	White	\N	\N	\N	2019-10-03 00:00:00	\N
71205748	Group A	24566001	Crispin	28	Yellow-ish white	\N	\N	\N	2019-06-23 00:00:00	\N
82835521	Group E	87756395	Gala	40	Yellow-ish white	\N	\N	\N	2019-11-14 00:00:00	\N
19655765	Group A	31458351	Crispin	41	White	\N	\N	\N	2019-08-02 00:00:00	\N
73633471	Group D	16292741	Delicious	52	Yellow	\N	\N	\N	2019-07-19 00:00:00	\N
69965449	Group F	96798713	Braeburn	18	Yellow	\N	\N	\N	2019-02-19 00:00:00	\N
29602988	Group B	49923001	Jonagold	83	Yellow-ish white	\N	\N	\N	2019-05-31 00:00:00	\N
89738641	Group D	42667483	Honeycrisp	41	Yellow	\N	\N	\N	2019-10-02 00:00:00	\N
80567998	Group D	42550532	Crispin	84	Red	\N	\N	\N	2019-01-31 00:00:00	\N
7406157	Group F	8697783	Gala	62	Red	\N	\N	\N	2019-12-26 00:00:00	\N
28375807	Group A	79657808	Delicious	45	Yellow-ish white	\N	\N	\N	2019-03-28 00:00:00	\N
26467870	Group F	93251983	Crispin	83	Yellow	\N	\N	\N	2019-10-25 00:00:00	\N
36625413	Group F	86558396	Delicious	15	Yellow-ish white	\N	\N	\N	2019-05-12 00:00:00	\N
29356430	Group F	31370691	Crispin	79	Red	\N	\N	\N	2019-01-29 00:00:00	\N
2655307	Group C	88454467	Braeburn	29	Yellow	\N	\N	\N	2019-12-03 00:00:00	\N
13347130	Group C	91939067	Honeycrisp	84	Yellow-ish white	\N	\N	\N	2019-06-24 00:00:00	\N
\.


--
-- Name: apples_apple_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.apples_apple_id_seq', 1, false);


--
-- Data for Name: bananas; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.bananas (banana_id, generation_number, tree_id, variety, freeze_date, thaw_by_date, thawed_out_date, expiration_date, new_expiration_date) FROM stdin;
9219	3	62887083	Cavendish	\N	\N	\N	2019-02-04 00:00:00	\N
2574	3	56008524	Cavendish	\N	\N	\N	2019-06-19 00:00:00	\N
8669	3	63680669	Cavendish	\N	\N	\N	2019-11-07 00:00:00	\N
1232	3	20629670	Cavendish	\N	\N	\N	2019-05-09 00:00:00	\N
3347	3	80250548	Cavendish	\N	\N	\N	2019-11-12 00:00:00	\N
2835	3	46222947	Cavendish	\N	\N	\N	2019-07-02 00:00:00	\N
6834	3	95067339	Cavendish	\N	\N	\N	2019-05-09 00:00:00	\N
7519	3	62418201	Cavendish	\N	\N	\N	2019-02-09 00:00:00	\N
1921	3	99328726	Cavendish	\N	\N	\N	2019-11-24 00:00:00	\N
5199	3	79365	Cavendish	\N	\N	\N	2019-04-05 00:00:00	\N
4133	3	69519093	Cavendish	\N	\N	\N	2019-10-06 00:00:00	\N
1406	3	96748367	Cavendish	\N	\N	\N	2019-05-19 00:00:00	\N
5080	3	75304454	Cavendish	\N	\N	\N	2019-07-26 00:00:00	\N
9526	3	87699364	Cavendish	\N	\N	\N	2019-03-26 00:00:00	\N
8022	3	84016430	Cavendish	\N	\N	\N	2019-06-07 00:00:00	\N
3128	3	25685329	Cavendish	\N	\N	\N	2019-07-09 00:00:00	\N
1016	3	11046738	Cavendish	\N	\N	\N	2019-03-16 00:00:00	\N
5471	3	59040682	Cavendish	\N	\N	\N	2019-08-15 00:00:00	\N
8698	3	24976985	Cavendish	\N	\N	\N	2019-08-31 00:00:00	\N
1366	3	24904032	Cavendish	\N	\N	\N	2019-07-22 00:00:00	\N
8174	3	14444265	Cavendish	\N	\N	\N	2019-04-02 00:00:00	\N
9900	3	82164300	Cavendish	\N	\N	\N	2019-02-18 00:00:00	\N
5550	3	30150201	Cavendish	\N	\N	\N	2019-10-28 00:00:00	\N
7991	3	12806072	Cavendish	\N	\N	\N	2019-05-14 00:00:00	\N
8767	3	79190664	Cavendish	\N	\N	\N	2019-08-28 00:00:00	\N
4656	3	21306396	Cavendish	\N	\N	\N	2019-05-13 00:00:00	\N
6209	3	48925693	Cavendish	\N	\N	\N	2019-09-25 00:00:00	\N
3683	3	92925021	Cavendish	\N	\N	\N	2019-08-30 00:00:00	\N
5894	3	45324574	Cavendish	\N	\N	\N	2019-06-20 00:00:00	\N
7206	3	96766071	Cavendish	\N	\N	\N	2019-08-30 00:00:00	\N
9681	3	63081190	Cavendish	\N	\N	\N	2019-12-10 00:00:00	\N
612	3	59670544	Cavendish	\N	\N	\N	2019-11-25 00:00:00	\N
7645	3	27773109	Cavendish	\N	\N	\N	2019-04-29 00:00:00	\N
4623	3	24608848	Cavendish	\N	\N	\N	2019-07-09 00:00:00	\N
3392	3	90051531	Cavendish	\N	\N	\N	2019-09-26 00:00:00	\N
1823	3	33228044	Cavendish	\N	\N	\N	2019-06-14 00:00:00	\N
9661	3	51770143	Cavendish	\N	\N	\N	2019-03-19 00:00:00	\N
941	3	310529	Cavendish	\N	\N	\N	2019-12-14 00:00:00	\N
7811	3	54066014	Cavendish	\N	\N	\N	2019-06-10 00:00:00	\N
5232	3	46587459	Cavendish	\N	\N	\N	2019-10-18 00:00:00	\N
1841	3	33295817	Cavendish	\N	\N	\N	2019-03-12 00:00:00	\N
4009	3	92925786	Cavendish	\N	\N	\N	2019-03-24 00:00:00	\N
6868	3	3725948	Cavendish	\N	\N	\N	2019-07-30 00:00:00	\N
4446	3	1931525	Cavendish	\N	\N	\N	2019-06-28 00:00:00	\N
3028	3	25240061	Cavendish	\N	\N	\N	2019-08-29 00:00:00	\N
5592	3	4328940	Cavendish	\N	\N	\N	2019-12-21 00:00:00	\N
6266	3	5835706	Cavendish	\N	\N	\N	2019-02-24 00:00:00	\N
6	3	62059138	Cavendish	\N	\N	\N	2019-09-17 00:00:00	\N
3919	3	30275911	Cavendish	\N	\N	\N	2019-01-29 00:00:00	\N
1644	3	55924306	Cavendish	\N	\N	\N	2019-02-14 00:00:00	\N
4224	3	33147161	Cavendish	\N	\N	\N	2019-01-31 00:00:00	\N
6017	3	62264419	Cavendish	\N	\N	\N	2019-06-22 00:00:00	\N
8776	3	21118456	Cavendish	\N	\N	\N	2019-08-23 00:00:00	\N
9626	3	64883670	Cavendish	\N	\N	\N	2019-04-19 00:00:00	\N
2429	3	68765354	Cavendish	\N	\N	\N	2019-02-16 00:00:00	\N
7057	3	7602122	Cavendish	\N	\N	\N	2019-08-14 00:00:00	\N
1015	3	52877315	Cavendish	\N	\N	\N	2019-05-28 00:00:00	\N
9013	3	22535160	Cavendish	\N	\N	\N	2019-10-06 00:00:00	\N
1256	3	61582453	Cavendish	\N	\N	\N	2019-07-31 00:00:00	\N
1043	3	10886892	Cavendish	\N	\N	\N	2019-09-01 00:00:00	\N
9533	3	60506801	Cavendish	\N	\N	\N	2019-11-01 00:00:00	\N
7221	3	84553812	Cavendish	\N	\N	\N	2019-03-29 00:00:00	\N
2631	3	57016696	Cavendish	\N	\N	\N	2019-10-20 00:00:00	\N
7795	3	1459128	Cavendish	\N	\N	\N	2019-05-10 00:00:00	\N
1738	3	52900990	Cavendish	\N	\N	\N	2019-03-31 00:00:00	\N
8045	3	47134522	Cavendish	\N	\N	\N	2019-07-15 00:00:00	\N
7078	3	24622189	Cavendish	\N	\N	\N	2019-03-20 00:00:00	\N
\.


--
-- Name: bananas_banana_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.bananas_banana_id_seq', 1, false);


--
-- Data for Name: butter; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.butter (butter_id, cow_id, carton, churner, number_sticks, expiration_date, freeze_date, thaw_by_date, thawed_out_date, new_expiration_date) FROM stdin;
1	9215	carton #3	Kimberly Benitez	4	2019-11-19 00:00:00	\N	\N	\N	\N
2	8395	carton #2	Jesus Howe	1	2019-04-21 00:00:00	\N	\N	\N	\N
\.


--
-- Name: butter_butter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.butter_butter_id_seq', 2, true);


--
-- Data for Name: milk; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.milk (cartons, cow_id, cow_age, cow_breed, cow_length, cow_weight, expiration_date, freeze_date, thaw_by_date, thawed_out_date, new_expiration_date, vendor) FROM stdin;
0	9215	23	Brown Swiss	\N	\N	2019-11-02 00:00:00	\N	\N	\N	\N	GBX
4	645	19	Norwegian Red	11 feet	1423 pounds	2019-02-10 00:00:00	\N	\N	\N	\N	GBX
3	437	25	Holstein	11 feet	1573 pounds	2019-07-21 00:00:00	\N	\N	\N	\N	GBX
1	3751	20	Brown Swiss	11 feet	1598 pounds	2019-09-03 00:00:00	\N	\N	\N	\N	GBX
2	5120	21	Brown Swiss	8 feet	1430 pounds	2019-11-27 00:00:00	\N	\N	\N	\N	GBX
4	5427	12	Holstein	10 feet	1498 pounds	2019-08-29 00:00:00	\N	\N	\N	\N	GBX
5	5647	14	Brown Swiss	6 feet	1390 pounds	2019-03-11 00:00:00	\N	\N	\N	\N	GBX
2	6047	15	Holstein	6 feet	1236 pounds	2019-01-22 00:00:00	\N	\N	\N	\N	GBX
5	6182	20	Holstein	12 feet	1457 pounds	2019-03-04 00:00:00	\N	\N	\N	\N	GBX
4	7394	25	Norwegian Red	11 feet	1529 pounds	2019-10-15 00:00:00	\N	\N	\N	\N	GBX
1	8395	24	Norwegian Red	11 feet	1464 pounds	2019-02-12 00:00:00	\N	\N	\N	\N	GBX
1	9083	26	Brown Swiss	6 feet	1458 pounds	2019-03-26 00:00:00	\N	\N	\N	\N	GBX
\.


--
-- Name: milk_cow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.milk_cow_id_seq', 1, false);


--
-- Name: Sales_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public."Sales"
    ADD CONSTRAINT "Sales_pkey" PRIMARY KEY (sale_id);


--
-- Name: apples_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.apples
    ADD CONSTRAINT apples_pkey PRIMARY KEY (apple_id);


--
-- Name: bananas_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.bananas
    ADD CONSTRAINT bananas_pkey PRIMARY KEY (banana_id);


--
-- Name: butter_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.butter
    ADD CONSTRAINT butter_pkey PRIMARY KEY (butter_id);


--
-- Name: milk_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.milk
    ADD CONSTRAINT milk_pkey PRIMARY KEY (cow_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

