--
-- PostgreSQL database dump
--

-- Dumped from database version 17rc1
-- Dumped by pg_dump version 17rc1

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
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    productid integer NOT NULL,
    productname character varying(100) NOT NULL,
    unit character varying(50) NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_productid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_productid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_productid_seq OWNER TO postgres;

--
-- Name: products_productid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_productid_seq OWNED BY public.products.productid;


--
-- Name: retailpoints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.retailpoints (
    retailid integer NOT NULL,
    retailaddress character varying(255) NOT NULL,
    retailname character varying(100) NOT NULL
);


ALTER TABLE public.retailpoints OWNER TO postgres;

--
-- Name: retailpoints_retailid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.retailpoints_retailid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.retailpoints_retailid_seq OWNER TO postgres;

--
-- Name: retailpoints_retailid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.retailpoints_retailid_seq OWNED BY public.retailpoints.retailid;


--
-- Name: stockin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stockin (
    stockinid integer NOT NULL,
    productid integer,
    warehouseid integer,
    quantity integer NOT NULL,
    stockindate date NOT NULL
);


ALTER TABLE public.stockin OWNER TO postgres;

--
-- Name: stockin_stockinid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stockin_stockinid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stockin_stockinid_seq OWNER TO postgres;

--
-- Name: stockin_stockinid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stockin_stockinid_seq OWNED BY public.stockin.stockinid;


--
-- Name: stockrequest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stockrequest (
    requestid integer NOT NULL,
    retailid integer,
    productid integer,
    requestedquantity integer NOT NULL
);


ALTER TABLE public.stockrequest OWNER TO postgres;

--
-- Name: stockrequest_requestid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stockrequest_requestid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stockrequest_requestid_seq OWNER TO postgres;

--
-- Name: stockrequest_requestid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stockrequest_requestid_seq OWNED BY public.stockrequest.requestid;


--
-- Name: warehouses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouses (
    warehouseid integer NOT NULL,
    warehousemanager character varying(100) NOT NULL
);


ALTER TABLE public.warehouses OWNER TO postgres;

--
-- Name: warehouses_warehouseid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.warehouses_warehouseid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.warehouses_warehouseid_seq OWNER TO postgres;

--
-- Name: warehouses_warehouseid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.warehouses_warehouseid_seq OWNED BY public.warehouses.warehouseid;


--
-- Name: products productid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN productid SET DEFAULT nextval('public.products_productid_seq'::regclass);


--
-- Name: retailpoints retailid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.retailpoints ALTER COLUMN retailid SET DEFAULT nextval('public.retailpoints_retailid_seq'::regclass);


--
-- Name: stockin stockinid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stockin ALTER COLUMN stockinid SET DEFAULT nextval('public.stockin_stockinid_seq'::regclass);


--
-- Name: stockrequest requestid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stockrequest ALTER COLUMN requestid SET DEFAULT nextval('public.stockrequest_requestid_seq'::regclass);


--
-- Name: warehouses warehouseid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses ALTER COLUMN warehouseid SET DEFAULT nextval('public.warehouses_warehouseid_seq'::regclass);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (productid, productname, unit, price) FROM stdin;
1	bread	count.	50.00
2	milk	ml.	60.00
\.


--
-- Data for Name: retailpoints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.retailpoints (retailid, retailaddress, retailname) FROM stdin;
1	st. Lenina, h. 5	Magazine 1
2	pr. Mira, h. 8	Magazine 2
\.


--
-- Data for Name: stockin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stockin (stockinid, productid, warehouseid, quantity, stockindate) FROM stdin;
1	1	1	100	2024-01-01
2	2	1	200	2024-01-02
3	1	2	150	2024-01-03
\.


--
-- Data for Name: stockrequest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stockrequest (requestid, retailid, productid, requestedquantity) FROM stdin;
1	1	1	20
2	1	2	10
3	2	1	50
\.


--
-- Data for Name: warehouses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehouses (warehouseid, warehousemanager) FROM stdin;
1	Ivanov I.I.
2	Petrov P.P.
\.


--
-- Name: products_productid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_productid_seq', 2, true);


--
-- Name: retailpoints_retailid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.retailpoints_retailid_seq', 2, true);


--
-- Name: stockin_stockinid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stockin_stockinid_seq', 3, true);


--
-- Name: stockrequest_requestid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stockrequest_requestid_seq', 3, true);


--
-- Name: warehouses_warehouseid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.warehouses_warehouseid_seq', 2, true);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);


--
-- Name: retailpoints retailpoints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.retailpoints
    ADD CONSTRAINT retailpoints_pkey PRIMARY KEY (retailid);


--
-- Name: stockin stockin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stockin
    ADD CONSTRAINT stockin_pkey PRIMARY KEY (stockinid);


--
-- Name: stockrequest stockrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stockrequest
    ADD CONSTRAINT stockrequest_pkey PRIMARY KEY (requestid);


--
-- Name: warehouses warehouses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT warehouses_pkey PRIMARY KEY (warehouseid);


--
-- Name: stockin stockin_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stockin
    ADD CONSTRAINT stockin_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);


--
-- Name: stockin stockin_warehouseid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stockin
    ADD CONSTRAINT stockin_warehouseid_fkey FOREIGN KEY (warehouseid) REFERENCES public.warehouses(warehouseid);


--
-- Name: stockrequest stockrequest_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stockrequest
    ADD CONSTRAINT stockrequest_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);


--
-- Name: stockrequest stockrequest_retailid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stockrequest
    ADD CONSTRAINT stockrequest_retailid_fkey FOREIGN KEY (retailid) REFERENCES public.retailpoints(retailid);


--
-- PostgreSQL database dump complete
--

