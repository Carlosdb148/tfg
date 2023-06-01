--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Comparator_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Comparator_product" (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    description text NOT NULL,
    image text NOT NULL,
    type integer NOT NULL
);


ALTER TABLE public."Comparator_product" OWNER TO postgres;

--
-- Name: Comparator_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Comparator_product_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Comparator_product_id_seq" OWNER TO postgres;

--
-- Name: Comparator_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Comparator_product_id_seq" OWNED BY public."Comparator_product".id;


--
-- Name: Comparator_shop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Comparator_shop" (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    logo character varying(100) NOT NULL
);


ALTER TABLE public."Comparator_shop" OWNER TO postgres;

--
-- Name: Comparator_shop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Comparator_shop_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Comparator_shop_id_seq" OWNER TO postgres;

--
-- Name: Comparator_shop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Comparator_shop_id_seq" OWNED BY public."Comparator_shop".id;


--
-- Name: Comparator_stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Comparator_stock" (
    id bigint NOT NULL,
    price numeric(10,2) NOT NULL,
    date timestamp with time zone NOT NULL,
    url text NOT NULL,
    product_id bigint NOT NULL,
    shop_id bigint NOT NULL
);


ALTER TABLE public."Comparator_stock" OWNER TO postgres;

--
-- Name: Comparator_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Comparator_stock_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Comparator_stock_id_seq" OWNER TO postgres;

--
-- Name: Comparator_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Comparator_stock_id_seq" OWNED BY public."Comparator_stock".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: Comparator_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comparator_product" ALTER COLUMN id SET DEFAULT nextval('public."Comparator_product_id_seq"'::regclass);


--
-- Name: Comparator_shop id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comparator_shop" ALTER COLUMN id SET DEFAULT nextval('public."Comparator_shop_id_seq"'::regclass);


--
-- Name: Comparator_stock id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comparator_stock" ALTER COLUMN id SET DEFAULT nextval('public."Comparator_stock_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: Comparator_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Comparator_product" (id, name, description, image, type) FROM stdin;
1	iphone	bgrfwbfgv	images/Captura_de_pantalla_2023-03-15_a_las_12.14.05.png	0
2	iphone 13	pro max		0
3	iphone 13	pro max	data:image/jpeg;base64,/9j/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCAR4BHgDAREAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD9U6ACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgBM4oAq6lq9lo1s1zf3kFlbr96W5lWNB+LECgDzbXv2qPg/4akMeofErwzHKOsUOpRzP/3yhY0roDBP7anwil/48vEF9qp7DTtCv7jP0KwEfrS5kOw2T9sDwqwzZeFfH2pr2Nr4TvMH/vpFo5kFmQH9r7TP4fhj8UXHqPCc39WpcyHZmFr/AO354E8JXUdtr/hbx3oV1KnmxwajoDQu6ZI3AF+RkEZ9RT5kFmaOkftreHvEOnQ6hpHw++JOq6dNnyryy8MySRSYJB2sGwcEEfUUcyFZlz/hr3T/APolvxT/APCUk/8AiqXMgsw/4a90/wD6Jb8U/wDwlJf/AIqjmQWYf8Ne6f8A9Et+Kf8A4Skv/wAVRzoLMP8Ahr3T/wDolvxT/wDCUl/+Ko5kFmH/AA17p/8A0S34p/8AhKS//FUcyCzE/wCGvdP/AOiW/FP/AMJSX/4qjmQWYf8ADXun/wDRLfin/wCEpL/8VRzILMX/AIa90/8A6Jb8U/8AwlJf/iqOZBZif8Nfaf8A9Et+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AKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKAP/2Q==	0
4	e	vfe	vfd	0
\.


--
-- Data for Name: Comparator_shop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Comparator_shop" (id, name, logo) FROM stdin;
1	Amazon	images/Captura_de_pantalla_2023-03-15_a_las_12.14.05_DSHajMQ.png
2	MediaMarkt	images/Captura_de_pantalla_2023-03-15_a_las_12.14.05_QTHKoJO.png
3	PhoneHouse	images/Captura_de_pantalla_2023-03-15_a_las_12.14.05_xsWt6sS.png
4	Worten	assets/img/Recurso_1.png
\.


--
-- Data for Name: Comparator_stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Comparator_stock" (id, price, date, url, product_id, shop_id) FROM stdin;
1	543.00	2023-05-30 00:00:00+00	bfr	1	1
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add product	7	add_product
26	Can change product	7	change_product
27	Can delete product	7	delete_product
28	Can view product	7	view_product
29	Can add shop	8	add_shop
30	Can change shop	8	change_shop
31	Can delete shop	8	delete_shop
32	Can view shop	8	view_shop
33	Can add stock	9	add_stock
34	Can change stock	9	change_stock
35	Can delete stock	9	delete_stock
36	Can view stock	9	view_stock
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$4Jq3dPkJLkr2GqwBbGivoX$ygOXfCu6R+35YXLrF3mtNfiyVtDW69YVmue0iIScoRc=	2023-05-31 08:03:02.944019+00	t	admin			admin@admin.com	t	t	2023-05-24 16:25:34.051095+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2023-05-24 16:26:07.746132+00	1	Product object (1)	1	[{"added": {}}]	7	1
2	2023-05-30 19:24:27.996232+00	1	Shop object (1)	1	[{"added": {}}]	8	1
3	2023-05-30 19:24:34.591403+00	2	Shop object (2)	1	[{"added": {}}]	8	1
4	2023-05-30 19:24:45.643919+00	3	Shop object (3)	1	[{"added": {}}]	8	1
5	2023-05-30 19:24:54.453187+00	4	Shop object (4)	1	[{"added": {}}]	8	1
6	2023-05-30 19:25:06.243155+00	1	Stock object (1)	1	[{"added": {}}]	9	1
7	2023-05-31 08:24:33.993544+00	4	Shop object (4)	2	[{"changed": {"fields": ["Logo"]}}]	8	1
8	2023-05-31 10:40:03.977178+00	3	Product object (3)	2	[]	7	1
9	2023-06-01 06:58:40.317172+00	4	Product object (4)	1	[{"added": {}}]	7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	Comparator	product
8	Comparator	shop
9	Comparator	stock
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	Comparator	0001_initial	2023-05-24 16:25:31.730545+00
2	contenttypes	0001_initial	2023-05-24 16:25:31.742139+00
3	auth	0001_initial	2023-05-24 16:25:31.815498+00
4	admin	0001_initial	2023-05-24 16:25:31.837228+00
5	admin	0002_logentry_remove_auto_add	2023-05-24 16:25:31.844271+00
6	admin	0003_logentry_add_action_flag_choices	2023-05-24 16:25:31.853053+00
7	contenttypes	0002_remove_content_type_name	2023-05-24 16:25:31.8721+00
8	auth	0002_alter_permission_name_max_length	2023-05-24 16:25:31.879305+00
9	auth	0003_alter_user_email_max_length	2023-05-24 16:25:31.888312+00
10	auth	0004_alter_user_username_opts	2023-05-24 16:25:31.896596+00
11	auth	0005_alter_user_last_login_null	2023-05-24 16:25:31.905866+00
12	auth	0006_require_contenttypes_0002	2023-05-24 16:25:31.908253+00
13	auth	0007_alter_validators_add_error_messages	2023-05-24 16:25:31.91488+00
14	auth	0008_alter_user_username_max_length	2023-05-24 16:25:31.925946+00
15	auth	0009_alter_user_last_name_max_length	2023-05-24 16:25:31.933518+00
16	auth	0010_alter_group_name_max_length	2023-05-24 16:25:31.943922+00
17	auth	0011_update_proxy_permissions	2023-05-24 16:25:31.952965+00
18	auth	0012_alter_user_first_name_max_length	2023-05-24 16:25:31.960887+00
19	sessions	0001_initial	2023-05-24 16:25:31.974825+00
20	Comparator	0002_alter_product_image_alter_shop_logo_alter_stock_date	2023-05-31 08:21:46.425088+00
21	Comparator	0003_alter_product_image	2023-05-31 08:46:26.313003+00
22	Comparator	0004_alter_product_image	2023-05-31 10:19:06.106526+00
23	Comparator	0005_alter_product_image	2023-05-31 10:27:23.36185+00
24	Comparator	0006_alter_product_image	2023-06-01 07:36:19.484097+00
25	Comparator	0007_product_type	2023-06-01 07:50:16.676313+00
26	Comparator	0008_alter_product_type	2023-06-01 07:57:13.087299+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ram5n8bhvwtqufwtic5w23ilw1kliyf5	.eJxVjEEOwiAQRe_C2hClwIBL956BzDCDVA1NSrsy3l2bdKHb_977L5VwXWpau8xpZHVWJ3X43QjzQ9oG-I7tNuk8tWUeSW-K3mnX14nledndv4OKvX5rEk9ggrDhGAygCA4FondSQrBQBBCt4zh4kEIkNsPRRPYOrGVHTr0_B9Y4kQ:1q1rJE:-LslhvDJWVgJHwbVvs2jPtnV8tek9aObynd9-jZwHw8	2023-06-07 16:25:56.686959+00
8177k4krxk3t234jdua5ay1i0q8adds5	.eJxVjEEOwiAQRe_C2hClwIBL956BzDCDVA1NSrsy3l2bdKHb_977L5VwXWpau8xpZHVWJ3X43QjzQ9oG-I7tNuk8tWUeSW-K3mnX14nledndv4OKvX5rEk9ggrDhGAygCA4FondSQrBQBBCt4zh4kEIkNsPRRPYOrGVHTr0_B9Y4kQ:1q44wr:BecNfQygV40mscI0v1rGkGFf0mRmuZ6pA4qPNuUG5Hw	2023-06-13 19:24:01.040331+00
a3r5afftgy3nixljq1fpm45jspmydtnq	.eJxVjEEOwiAQRe_C2hClwIBL956BzDCDVA1NSrsy3l2bdKHb_977L5VwXWpau8xpZHVWJ3X43QjzQ9oG-I7tNuk8tWUeSW-K3mnX14nledndv4OKvX5rEk9ggrDhGAygCA4FondSQrBQBBCt4zh4kEIkNsPRRPYOrGVHTr0_B9Y4kQ:1q4GnO:j9O3JXobbu-GfR7DlwCjmzuLV-d8dNfML4UB1FBvfBo	2023-06-14 08:03:02.947591+00
\.


--
-- Name: Comparator_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Comparator_product_id_seq"', 4, true);


--
-- Name: Comparator_shop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Comparator_shop_id_seq"', 4, true);


--
-- Name: Comparator_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Comparator_stock_id_seq"', 1, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 9, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 26, true);


--
-- Name: Comparator_product Comparator_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comparator_product"
    ADD CONSTRAINT "Comparator_product_pkey" PRIMARY KEY (id);


--
-- Name: Comparator_shop Comparator_shop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comparator_shop"
    ADD CONSTRAINT "Comparator_shop_pkey" PRIMARY KEY (id);


--
-- Name: Comparator_stock Comparator_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comparator_stock"
    ADD CONSTRAINT "Comparator_stock_pkey" PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: Comparator_stock_product_id_40b028be; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Comparator_stock_product_id_40b028be" ON public."Comparator_stock" USING btree (product_id);


--
-- Name: Comparator_stock_shop_id_b665620e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Comparator_stock_shop_id_b665620e" ON public."Comparator_stock" USING btree (shop_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: Comparator_stock Comparator_stock_product_id_40b028be_fk_Comparator_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comparator_stock"
    ADD CONSTRAINT "Comparator_stock_product_id_40b028be_fk_Comparator_product_id" FOREIGN KEY (product_id) REFERENCES public."Comparator_product"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Comparator_stock Comparator_stock_shop_id_b665620e_fk_Comparator_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comparator_stock"
    ADD CONSTRAINT "Comparator_stock_shop_id_b665620e_fk_Comparator_shop_id" FOREIGN KEY (shop_id) REFERENCES public."Comparator_shop"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

