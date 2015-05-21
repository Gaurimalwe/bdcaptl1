--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: create_owners; Type: TABLE; Schema: public; Owner: diksha; Tablespace: 
--

CREATE TABLE create_owners (
    id integer NOT NULL,
    name character varying(255),
    floor integer,
    block character varying(255),
    flat_number integer,
    business_name character varying(255),
    username character varying(255),
    password_hash character varying(255),
    password_salt character varying(255),
    image character varying(255),
    carpet_area integer,
    builtup_area integer,
    mezzanine character varying(255),
    water_connection character varying(255),
    electricity character varying(255),
    ownership character varying(255),
    month_from character varying(255),
    month_to character varying(255),
    per_month_rent integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.create_owners OWNER TO diksha;

--
-- Name: create_owners_id_seq; Type: SEQUENCE; Schema: public; Owner: diksha
--

CREATE SEQUENCE create_owners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.create_owners_id_seq OWNER TO diksha;

--
-- Name: create_owners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: diksha
--

ALTER SEQUENCE create_owners_id_seq OWNED BY create_owners.id;


--
-- Name: create_owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: diksha
--

SELECT pg_catalog.setval('create_owners_id_seq', 3, true);


--
-- Name: owners; Type: TABLE; Schema: public; Owner: diksha; Tablespace: 
--

CREATE TABLE owners (
    id integer NOT NULL,
    email character varying(255),
    password_digest character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    auth_token character varying(255)
);


ALTER TABLE public.owners OWNER TO diksha;

--
-- Name: owners_id_seq; Type: SEQUENCE; Schema: public; Owner: diksha
--

CREATE SEQUENCE owners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.owners_id_seq OWNER TO diksha;

--
-- Name: owners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: diksha
--

ALTER SEQUENCE owners_id_seq OWNED BY owners.id;


--
-- Name: owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: diksha
--

SELECT pg_catalog.setval('owners_id_seq', 1, true);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: diksha; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO diksha;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: diksha
--

ALTER TABLE ONLY create_owners ALTER COLUMN id SET DEFAULT nextval('create_owners_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: diksha
--

ALTER TABLE ONLY owners ALTER COLUMN id SET DEFAULT nextval('owners_id_seq'::regclass);


--
-- Data for Name: create_owners; Type: TABLE DATA; Schema: public; Owner: diksha
--

COPY create_owners (id, name, floor, block, flat_number, business_name, username, password_hash, password_salt, image, carpet_area, builtup_area, mezzanine, water_connection, electricity, ownership, month_from, month_to, per_month_rent, created_at, updated_at) FROM stdin;
1	Diksha Prabhu	1	A11	18		diksha@gmail.com	$2a$10$wmqGrw1ZhpHM1UXESDw1FuowX7QUL.t4YMsavbNKY5BHZUKrKRgUu	$2a$10$wmqGrw1ZhpHM1UXESDw1Fu	calendar.gif	123000	450000	No	Common	Common	Rented	01/01/2013	01/01/2015	12000	2015-02-17 17:14:12.417358	2015-02-17 17:14:35.006075
3	Smita Halgekar	5	B12	133		smita@ymail.com	$2a$10$yUtku3.vnrkgsqbI9tOm1Oj/PxIa1CfyP3dYjPod/6mx7JKW0s9sW	$2a$10$yUtku3.vnrkgsqbI9tOm1O	\N	45000	450000	Yes	Common	Common	Owns			\N	2015-02-17 17:23:16.324396	2015-02-17 17:23:16.324396
\.


--
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: diksha
--

COPY owners (id, email, password_digest, created_at, updated_at, auth_token) FROM stdin;
1	Admin	$2a$10$FPIbP1PTg.CqIMnuYDFYbeFYR2SRU8hwD6iLH3GllIzu/do0PyfY.	2015-02-17 17:12:20.257425	2015-02-17 17:12:20.257425	pZ0MVzKE3roCZHMMYRhkBA
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: diksha
--

COPY schema_migrations (version) FROM stdin;
20150112092456
20150123054606
20150207063104
\.


--
-- Name: create_owners_pkey; Type: CONSTRAINT; Schema: public; Owner: diksha; Tablespace: 
--

ALTER TABLE ONLY create_owners
    ADD CONSTRAINT create_owners_pkey PRIMARY KEY (id);


--
-- Name: owners_pkey; Type: CONSTRAINT; Schema: public; Owner: diksha; Tablespace: 
--

ALTER TABLE ONLY owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: diksha; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

