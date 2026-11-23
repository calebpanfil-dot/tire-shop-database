--
-- PostgreSQL database dump
--

\restrict w0B1MCdcA7K6sNVQnXy8lWkSwzxy1gPXWzl12OaZNc0imTpAHhdgLkcb4yAadt5

-- Dumped from database version 18.7
-- Dumped by pg_dump version 18.7

-- Started on 2026-11-22 20:53:57

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16391)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customers_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    phone_number character varying(20)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16390)
-- Name: customers_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_customers_id_seq OWNER TO postgres;

--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 219
-- Name: customers_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customers_id_seq OWNED BY public.customers.customers_id;


--
-- TOC entry 224 (class 1259 OID 16423)
-- Name: service_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_records (
    service_id integer NOT NULL,
    vehicle_id integer,
    service_type character varying(100),
    service_date date,
    cost numeric(10,2)
);


ALTER TABLE public.service_records OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16422)
-- Name: service_records_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_records_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_records_service_id_seq OWNER TO postgres;

--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 223
-- Name: service_records_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_records_service_id_seq OWNED BY public.service_records.service_id;


--
-- TOC entry 222 (class 1259 OID 16410)
-- Name: vehicles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicles (
    vehicle_id integer NOT NULL,
    customers_id integer,
    year integer,
    make character varying(50),
    model character varying(50)
);


ALTER TABLE public.vehicles OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16435)
-- Name: tire_shop_overview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.tire_shop_overview AS
 SELECT customers.first_name,
    customers.last_name,
    customers.phone_number,
    vehicles.year,
    vehicles.make,
    vehicles.model,
    service_records.service_type,
    service_records.service_date,
    service_records.cost
   FROM ((public.customers
     LEFT JOIN public.vehicles ON ((customers.customers_id = vehicles.customers_id)))
     LEFT JOIN public.service_records ON ((vehicles.vehicle_id = service_records.vehicle_id)));


ALTER VIEW public.tire_shop_overview OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16409)
-- Name: vehicles_vehicle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicles_vehicle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicles_vehicle_id_seq OWNER TO postgres;

--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 221
-- Name: vehicles_vehicle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicles_vehicle_id_seq OWNED BY public.vehicles.vehicle_id;


--
-- TOC entry 4769 (class 2604 OID 16394)
-- Name: customers customers_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customers_id SET DEFAULT nextval('public.customers_customers_id_seq'::regclass);


--
-- TOC entry 4771 (class 2604 OID 16426)
-- Name: service_records service_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_records ALTER COLUMN service_id SET DEFAULT nextval('public.service_records_service_id_seq'::regclass);


--
-- TOC entry 4770 (class 2604 OID 16413)
-- Name: vehicles vehicle_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles ALTER COLUMN vehicle_id SET DEFAULT nextval('public.vehicles_vehicle_id_seq'::regclass);


--
-- TOC entry 4929 (class 0 OID 16391)
-- Dependencies: 220
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customers_id, first_name, last_name, phone_number) FROM stdin;
1	John	Smith	555-1234
2	Nicole	Gin	555-3453
3	Thor	Linn	555-8728
5	David	Wilson	555-3766
4	Richard	Gomez	555-6275
\.


--
-- TOC entry 4933 (class 0 OID 16423)
-- Dependencies: 224
-- Data for Name: service_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_records (service_id, vehicle_id, service_type, service_date, cost) FROM stdin;
1	1	Tire Rotation	2026-11-18	0.00
2	2	Tire Rotation & Balance	2026-11-01	45.00
3	3	Flat Repair	2026-10-15	15.00
4	4	Tire Replacement	2026-10-15	893.23
5	5	Tire Replacment	2026-10-01	564.88
6	5	Flat Repair	2016-11-03	15.00
\.


--
-- TOC entry 4931 (class 0 OID 16410)
-- Dependencies: 222
-- Data for Name: vehicles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicles (vehicle_id, customers_id, year, make, model) FROM stdin;
1	1	2020	Ford	F-150
2	2	2015	Honda	Civic
3	3	2019	Honda	Passport
4	4	2020	Toyota	Rav4
5	5	2010	Ford	Focus
\.


--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 219
-- Name: customers_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customers_id_seq', 5, true);


--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 223
-- Name: service_records_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_records_service_id_seq', 6, true);


--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 221
-- Name: vehicles_vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicles_vehicle_id_seq', 5, true);


--
-- TOC entry 4773 (class 2606 OID 16397)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customers_id);


--
-- TOC entry 4777 (class 2606 OID 16429)
-- Name: service_records service_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_records
    ADD CONSTRAINT service_records_pkey PRIMARY KEY (service_id);


--
-- TOC entry 4775 (class 2606 OID 16416)
-- Name: vehicles vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (vehicle_id);


--
-- TOC entry 4779 (class 2606 OID 16430)
-- Name: service_records service_records_vehicle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_records
    ADD CONSTRAINT service_records_vehicle_id_fkey FOREIGN KEY (vehicle_id) REFERENCES public.vehicles(vehicle_id);


--
-- TOC entry 4778 (class 2606 OID 16417)
-- Name: vehicles vehicles_customers_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_customers_id_fkey FOREIGN KEY (customers_id) REFERENCES public.customers(customers_id);


-- Completed on 2026-11-22 20:53:57

--
-- PostgreSQL database dump complete
--

\unrestrict w0B1MCdcA7K6sNVQnXy8lWkSwzxy1gPXWzl12OaZNc0imTpAHhdgLkcb4yAadt5

