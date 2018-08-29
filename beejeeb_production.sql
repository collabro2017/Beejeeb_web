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
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: beejeeb
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO beejeeb;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: beejeeb
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO beejeeb;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beejeeb
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: beejeeb
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO beejeeb;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: beejeeb
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO beejeeb;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beejeeb
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: beejeeb
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO beejeeb;

--
-- Name: cart_items; Type: TABLE; Schema: public; Owner: beejeeb
--

CREATE TABLE public.cart_items (
    id bigint NOT NULL,
    user_id bigint,
    quantity integer,
    title character varying,
    description character varying,
    image_url character varying,
    instructions text,
    supplier_url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.cart_items OWNER TO beejeeb;

--
-- Name: cart_items_id_seq; Type: SEQUENCE; Schema: public; Owner: beejeeb
--

CREATE SEQUENCE public.cart_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_items_id_seq OWNER TO beejeeb;

--
-- Name: cart_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beejeeb
--

ALTER SEQUENCE public.cart_items_id_seq OWNED BY public.cart_items.id;


--
-- Name: coupons; Type: TABLE; Schema: public; Owner: beejeeb
--

CREATE TABLE public.coupons (
    id bigint NOT NULL,
    code character varying,
    fixed_amount_cents integer,
    discount_percentage double precision,
    max_usages_count integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.coupons OWNER TO beejeeb;

--
-- Name: coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: beejeeb
--

CREATE SEQUENCE public.coupons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupons_id_seq OWNER TO beejeeb;

--
-- Name: coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beejeeb
--

ALTER SEQUENCE public.coupons_id_seq OWNED BY public.coupons.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: beejeeb
--

CREATE TABLE public.order_items (
    id bigint NOT NULL,
    order_id bigint,
    supplier_url character varying,
    quantity integer,
    title character varying,
    description character varying,
    instructions text,
    image_url character varying,
    store_price_cents integer,
    unit_cost_cents integer,
    international_shipping_cents integer,
    lynks_fees_cents integer,
    taxes_and_customs_cents integer,
    item_weight double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    us_shipping_and_taxes_cents integer
);


ALTER TABLE public.order_items OWNER TO beejeeb;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: beejeeb
--

CREATE SEQUENCE public.order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_items_id_seq OWNER TO beejeeb;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beejeeb
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: beejeeb
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    shipping_full_name character varying,
    shipping_address_line1 character varying,
    shipping_address_line2 character varying,
    shipping_city character varying,
    shipping_phone_number character varying,
    coupon_code_to_apply character varying
);


ALTER TABLE public.orders OWNER TO beejeeb;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: beejeeb
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO beejeeb;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beejeeb
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: beejeeb
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO beejeeb;

--
-- Name: users; Type: TABLE; Schema: public; Owner: beejeeb
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    remember_created_at timestamp without time zone,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    provider character varying,
    uid character varying,
    admin boolean DEFAULT false,
    shipping_address_line1 character varying,
    shipping_address_line2 character varying,
    phone character varying,
    wallet_balance_cents integer DEFAULT 0 NOT NULL,
    shipping_city character varying
);


ALTER TABLE public.users OWNER TO beejeeb;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: beejeeb
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO beejeeb;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beejeeb
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beejeeb
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beejeeb
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beejeeb
--

ALTER TABLE ONLY public.cart_items ALTER COLUMN id SET DEFAULT nextval('public.cart_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beejeeb
--

ALTER TABLE ONLY public.coupons ALTER COLUMN id SET DEFAULT nextval('public.coupons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beejeeb
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beejeeb
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beejeeb
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: beejeeb
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beejeeb
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1, false);


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: beejeeb
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
\.


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beejeeb
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1, false);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: beejeeb
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2018-07-07 21:49:34.612531	2018-07-07 21:49:34.612531
\.


--
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: beejeeb
--

COPY public.cart_items (id, user_id, quantity, title, description, image_url, instructions, supplier_url, created_at, updated_at) FROM stdin;
\.


--
-- Name: cart_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beejeeb
--

SELECT pg_catalog.setval('public.cart_items_id_seq', 10, true);


--
-- Data for Name: coupons; Type: TABLE DATA; Schema: public; Owner: beejeeb
--

COPY public.coupons (id, code, fixed_amount_cents, discount_percentage, max_usages_count, created_at, updated_at) FROM stdin;
1	free20	2000	\N	\N	2018-07-18 15:13:51.88715	2018-07-18 15:13:51.88715
\.


--
-- Name: coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beejeeb
--

SELECT pg_catalog.setval('public.coupons_id_seq', 1, true);


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: beejeeb
--

COPY public.order_items (id, order_id, supplier_url, quantity, title, description, instructions, image_url, store_price_cents, unit_cost_cents, international_shipping_cents, lynks_fees_cents, taxes_and_customs_cents, item_weight, created_at, updated_at, us_shipping_and_taxes_cents) FROM stdin;
2	2	https://www.amazon.com/Huawei-P20-Lite-Unlocked-Smartphone/dp/B07C5HH17G?pd_rd_wg=s9RZn&pd_rd_r=8aed3f15-4a75-4276-b5e2-9ac426a31e55&pd_rd_w=rWqaG&ref_=pd_gw_cartx&pf_rd_r=0EXJHCNSK4XWR0M9MA4C&pf_rd_p=6b27b606-ba71-500d-b5f8-3510f86504b4	1	Huawei P20 Lite ANE-LX3 32GB + 4GB Dual SIM LTE Factory Unlocked Smartphone (Klein Blue)	https://www.amazon.com/Huawei-P20-Lite-Unlocked-Smartphone/dp/B07C5HH17G?pd_rd_wg=s9RZn&pd_rd_r=8aed3f15-4a75-4276-b5e2-9ac426a31e55&pd_rd_w=rWqaG&ref_=pd_gw_cartx&pf_rd_r=0EXJHCNSK4XWR0M9MA4C&pf_rd_p=6b27b606-ba71-500d-b5f8-3510f86504b4	16 GB , Blue	https://images-na.ssl-images-amazon.com/images/I/41ZFRZMIbRL.jpg	\N	20000	1200	2500	6000	0.5	2018-07-08 22:35:47.873268	2018-07-08 22:36:33.637445	500
4	4	https://www.amazon.com/Amazon-Essentials-Regular-Fit-Cotton-Pique/dp/B01IXFS0L4?pd_rd_wg=h8kbM&pd_rd_r=9c83e238-35dc-4657-972e-d49b366bb8f7&pd_rd_w=AuwLD&ref_=pd_gw_ri&pf_rd_r=VHP9ZP3988V55ZA6V1B4&pf_rd_p=3616cb2b-534a-5ec2-b1b7-566833e6cc3f	1	Amazon Essentials Men's Regular-Fit Cotton Pique Polo Shirt	https://www.amazon.com/Amazon-Essentials-Regular-Fit-Cotton-Pique/dp/B01IXFS0L4?pd_rd_wg=h8kbM&pd_rd_r=9c83e238-35dc-4657-972e-d49b366bb8f7&pd_rd_w=AuwLD&ref_=pd_gw_ri&pf_rd_r=VHP9ZP3988V55ZA6V1B4&pf_rd_p=3616cb2b-534a-5ec2-b1b7-566833e6cc3f	Size M , Color B	https://images-na.ssl-images-amazon.com/images/I/31G7Vexz5UL.jpg	\N	\N	\N	\N	\N	\N	2018-07-12 14:22:19.268657	2018-07-12 14:22:19.268657	\N
5	5	https://www.amazon.com/Bulova-96B158-Precisionist-Leather-Strap/dp/B007006UA2?pd_rd_wg=INawI&pd_rd_r=cf411f81-b766-4e49-9690-1190736fe19b&pd_rd_w=jcWZS&ref_=pd_gw_simh&pf_rd_r=DEWYKGGPE8R9PZAPYJNA&pf_rd_p=142c5909-6dce-5566-b92f-682609c771e8	4	Bulova Men's 96B158 Precisionist Leather Strap Watch	https://www.amazon.com/Bulova-96B158-Precisionist-Leather-Strap/dp/B007006UA2?pd_rd_wg=INawI&pd_rd_r=cf411f81-b766-4e49-9690-1190736fe19b&pd_rd_w=jcWZS&ref_=pd_gw_simh&pf_rd_r=DEWYKGGPE8R9PZAPYJNA&pf_rd_p=142c5909-6dce-5566-b92f-682609c771e8		https://images-na.ssl-images-amazon.com/images/I/41HabxsEe1L.jpg	\N	\N	\N	\N	\N	\N	2018-07-13 14:47:26.085958	2018-07-13 14:47:26.085958	\N
6	6	https://www.amazon.com/YoungLove-Classic-Manhattan-Structured-Gangster/dp/B01N0ZPNL1?pd_rd_wg=plLMa&pd_rd_r=23fabad1-5d5d-4502-a914-d5d0c66cf6d1&pd_rd_w=XABn5&ref_=pd_gw_simh&pf_rd_r=D8ZEB17VBVCDGJGBBBNR&pf_rd_p=4c5acc25-f4b0-5ad7-9004-0f2549f94c2f	1	YoungLove Men's Classic Manhattan Structured Gangster Trilby Fedora Hat, Navy	https://www.amazon.com/YoungLove-Classic-Manhattan-Structured-Gangster/dp/B01N0ZPNL1?pd_rd_wg=plLMa&pd_rd_r=23fabad1-5d5d-4502-a914-d5d0c66cf6d1&pd_rd_w=XABn5&ref_=pd_gw_simh&pf_rd_r=D8ZEB17VBVCDGJGBBBNR&pf_rd_p=4c5acc25-f4b0-5ad7-9004-0f2549f94c2f		https://images-na.ssl-images-amazon.com/images/I/41qsGsrOHZL.jpg	\N	\N	\N	\N	\N	\N	2018-07-13 19:55:18.715983	2018-07-13 19:55:18.715983	\N
3	3	https://www.amazon.com/Samsung-SM-G960F-5-8-inches-Factory-Unlocked/dp/B079SQ5VHX?pd_rd_wg=AKqMg&pd_rd_r=b2e38add-29bb-432e-9baa-785e6bd9fd78&pd_rd_w=G6bhj&ref_=pd_gw_simh&pf_rd_r=A5ASZV1FWBKZTEMR5CPR&pf_rd_p=4c5acc25-f4b0-5ad7-9004-0f2549f94c2f	2	Samsung Galaxy S9 (SM-G960F/DS) 4GB / 64GB 5.8-inches LTE Dual SIM Factory Unlocked - International Stock No Warranty (Midnight Black)	https://www.amazon.com/Samsung-SM-G960F-5-8-inches-Factory-Unlocked/dp/B079SQ5VHX?pd_rd_wg=AKqMg&pd_rd_r=b2e38add-29bb-432e-9baa-785e6bd9fd78&pd_rd_w=G6bhj&ref_=pd_gw_simh&pf_rd_r=A5ASZV1FWBKZTEMR5CPR&pf_rd_p=4c5acc25-f4b0-5ad7-9004-0f2549f94c2f		https://images-na.ssl-images-amazon.com/images/I/31ae76sZ1cL.jpg	\N	2500	850	750	0	0.100000000000000006	2018-07-11 20:52:18.198683	2018-07-14 17:12:37.768037	450
7	7	https://www.amazon.com/gp/product/B079TGL2BZ/ref=s9_acss_bw_cg_PCLTMC_2a1_w?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=merchandised-search-2&pf_rd_r=6AYHQ8364EVHA2V76RBJ&pf_rd_t=101&pf_rd_p=06cb766f-aa07-4557-a94e-fcaa99aa31ae&pf_rd_i=565108	1	Acer Aspire E 15, 15.6" Full HD, 8th Gen Intel Core i3-8130U, 6GB RAM Memory, 1TB HDD, 8X DVD, E5-576-392H	https://www.amazon.com/gp/product/B079TGL2BZ/ref=s9_acss_bw_cg_PCLTMC_2a1_w?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=merchandised-search-2&pf_rd_r=6AYHQ8364EVHA2V76RBJ&pf_rd_t=101&pf_rd_p=06cb766f-aa07-4557-a94e-fcaa99aa31ae&pf_rd_i=565108		https://images-na.ssl-images-amazon.com/images/I/41HfDkXXyeL.jpg	\N	1000	1000	2300	912	10	2018-07-18 15:15:08.095903	2018-07-18 15:15:45.176276	9000
8	8	https://www.amazon.com/Emporio-Armani-Quartz-Stainless-Rubber/dp/B075S46BPQ?pd_rd_wg=haVgn&pd_rd_r=fbbbb415-6315-47d6-a057-7dac0f1b2239&pd_rd_w=pzA45&ref_=pd_gw_psimh&pf_rd_r=0Z65WZC2MPEVGH9GECWS&pf_rd_p=a1e8e44e-a6a8-5785-afd0-7f174f0d74f9	1	Emporio Armani Men's 'Sport' Quartz Stainless Steel and Rubber Casual Watch, Color Black (Model: AR11101)	https://www.amazon.com/Emporio-Armani-Quartz-Stainless-Rubber/dp/B075S46BPQ?pd_rd_wg=haVgn&pd_rd_r=fbbbb415-6315-47d6-a057-7dac0f1b2239&pd_rd_w=pzA45&ref_=pd_gw_psimh&pf_rd_r=0Z65WZC2MPEVGH9GECWS&pf_rd_p=a1e8e44e-a6a8-5785-afd0-7f174f0d74f9		https://images-na.ssl-images-amazon.com/images/I/51DEDLHNNaL.jpg	\N	12000	840	1500	1200	0.5	2018-07-19 13:38:31.629627	2018-07-19 13:39:46.937431	500
\.


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beejeeb
--

SELECT pg_catalog.setval('public.order_items_id_seq', 8, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: beejeeb
--

COPY public.orders (id, user_id, created_at, updated_at, status, shipping_full_name, shipping_address_line1, shipping_address_line2, shipping_city, shipping_phone_number, coupon_code_to_apply) FROM stdin;
2	3	2018-07-08 22:35:47.870861	2018-07-09 00:01:30.585724	8	hamza nabulsi	182-21 150th Avenue	AMM 126893	Amman	\N	Free10per
4	2	2018-07-12 14:22:19.265244	2018-07-12 14:22:19.265244	0	\N	\N	\N	\N	\N	\N
5	2	2018-07-13 14:47:26.082467	2018-07-13 14:47:26.082467	0	\N	\N	\N	\N	\N	\N
6	2	2018-07-13 19:55:18.713151	2018-07-13 19:55:18.713151	0	\N	\N	\N	\N	\N	\N
3	2	2018-07-11 20:52:18.196285	2018-07-14 17:12:37.765685	1	\N	\N	\N	\N	\N	\N
7	5	2018-07-18 15:15:08.093604	2018-07-18 15:19:45.710612	1	\N	\N	\N	\N	\N	free20
8	2	2018-07-19 13:38:31.627327	2018-07-19 13:40:51.012472	1	\N	\N	\N	\N	\N	free20
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beejeeb
--

SELECT pg_catalog.setval('public.orders_id_seq', 8, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: beejeeb
--

COPY public.schema_migrations (version) FROM stdin;
20180628130318
20180628131004
20180629154720
20180629172930
20180629172936
20180629185221
20180701091522
20180703105145
20180705165053
20180705173708
20180705213419
20180707085953
20180707125215
20180707140804
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: beejeeb
--

COPY public.users (id, email, encrypted_password, remember_created_at, name, created_at, updated_at, provider, uid, admin, shipping_address_line1, shipping_address_line2, phone, wallet_balance_cents, shipping_city) FROM stdin;
1	hamzaadmin@gmail.com	$2a$11$acE3aNFbQTy2mvm8kUbvo.sGPE5cpib5SXGACjiFpTPsHRLSqXusi	\N	Hamza Admin	2018-07-08 01:32:18.758606	2018-07-08 01:36:37.12105	\N	\N	t	\N	\N	\N	0	\N
3	nabulsify@gmail.com	$2a$11$egEHMZTrvy3p0dv.RGXV0uYPSb7c/FL/xvqqc2r0Egi2Xihwd4E6y	\N	hamza nabulsi	2018-07-08 22:35:19.82632	2018-07-08 22:35:19.82632	\N	\N	f	\N	\N	\N	0	\N
2	nabulsi.hamza@gmail.com	$2a$11$SHgAw4DtxGd6rA9BvIu3xu.FJAmwLFbjFazP0lA2vAzdk2IFPknvG	\N	Hamza Munir	2018-07-08 16:05:25.747245	2018-07-13 19:38:05.83249	\N	\N	f			+962 799 85887	100000	Amman
5	carlosipe88@gmail.com	$2a$11$QD8B95Am7kd45PK.ApqLVuKtbsPyaoxgclNFreMHWhhzwrDf66Hym	\N	Fake Account	2018-07-09 16:42:07.396425	2018-07-18 15:14:38.388394	\N	\N	f	\N	\N	\N	0	\N
6	jckbbbls@gmail.com	$2a$11$WSDtGAaoN8qvJ6a29SwtHuVlPQ5dXTUSepEdhMD9Dngm5fCkFbk1K	\N	Mikhail S	2018-08-08 18:30:52.844779	2018-08-08 18:30:52.844779	\N	\N	f	\N	\N	\N	0	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beejeeb
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: beejeeb
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: beejeeb
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: beejeeb
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: beejeeb
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- Name: coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: beejeeb
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


--
-- Name: order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: beejeeb
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: beejeeb
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: beejeeb
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: beejeeb
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: beejeeb
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: beejeeb
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: beejeeb
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_cart_items_on_user_id; Type: INDEX; Schema: public; Owner: beejeeb
--

CREATE INDEX index_cart_items_on_user_id ON public.cart_items USING btree (user_id);


--
-- Name: index_order_items_on_order_id; Type: INDEX; Schema: public; Owner: beejeeb
--

CREATE INDEX index_order_items_on_order_id ON public.order_items USING btree (order_id);


--
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: beejeeb
--

CREATE INDEX index_orders_on_user_id ON public.orders USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: beejeeb
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


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

