--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg110+1)
-- Dumped by pg_dump version 15.3 (Debian 15.3-1.pgdg110+1)

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
    image character varying(1000000) NOT NULL
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

COPY public."Comparator_product" (id, name, description, image) FROM stdin;
4	prueba1	prueba1	data:image/jpeg;base64,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
5	prueba55	prueba55	data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxANDg4OEA8NEBAQDw0OEA4PDg8NDxANFREWFhURFRUYKCggGBolHRUVIjEhJSkrLi4uFyAzODU4NygtLisBCgoKDg0OGxAQGyslHR0tLSstLS0wLSstLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0rLS01LSstLS0rLSstLS0tNP/AABEIANsA5wMBIgACEQEDEQH/xAAcAAEAAQUBAQAAAAAAAAAAAAAAAQIDBAUGBwj/xABFEAACAQICBAcMCAUFAQEAAAAAAQIDEQQhBQcSMQYTQVFxc4EVIjM1UmGDkZKTsbMUIzJUobLB0UJTY3KCJTRDouEkFv/EABgBAQEBAQEAAAAAAAAAAAAAAAABAgME/8QAIxEBAAICAQQDAAMAAAAAAAAAAAECETEDEyEyURIiQYHB8P/aAAwDAQACEQMRAD8A9xAAAAAUzmopybSSTbb3JLezVzrTrLacpUqXIovZqSXO3ydCL+lntKlS8uotrq45v8dk0HCvTMcFh6uIktpQtGnTvZTqPJJ8yu10K5x5LzHaHSlf1muFFvKk6j52nJvte8qhhaSv/wDK1fP7D3nzvjNYmPqVuNjiJpKV0o97T6FDdbpu+c9f4D8NJYicKFaUZcZDbpVV3u0rXcZLyrZ3WTs8lbPE0mIzLXyjUOs+jUvuz92xxFBfaobK53TkkbKrO0W+ZNmJGrNODbb2nZrkz5h8TKaeAw8ldU6b7CruZQ/lQ9Qqw4qSnHKMmoyjyJvdIy0yxCSxO5lD+VD1DuXQ/lQ9RlguIMsPuVh/5NP1FM9DYaSs6FJrmcbmeBiEy5bT/A6GIpSWGrVcJUs9idJrZT5th9615vxR8/8ACLSmmdHYqpha2JrbcM1JKOzOD3Tjludn2prkPqk8h1/6CjWo4XFrvZwqOlKSV/q5J7/8lH2mWIiJJzLyL/8AYaTul9LrXe5Wh+xTLhlpJNp4utdeaH7GH3L/AKj9j/0dyk99V+x/6b+rP2ZtPhjpKTt9Mq+qH7Fx8KtJOz+mVMvNH9jW1sDxPfJ7cXltWtZ8zXIW7jEeju6HBcOdLUJKUcW5W/hlCGfakmuxo9a1b62FjqiwmMSp17d6797Oyz2W88t9nd2zu9x4KmTx0qU6dem9mpTnGcZLkad1+Ix6H2kDS8DtI/S8Bhq/l0oS6IuKlFey4m6NROWQAFAAAAAAAAGu0i/r8N51XX/WL/Q4PWnhJ1tHz2b95PjJW5Id9Fy7Nq/Yd7pDw2H6K3wRrcRBS71pNOMk09zW0zzck/Z2pp8n0KvFbVOUbSUoXvvWy02u07/VZKpiMXRUU9mhOpNtLvUpRkowXbK1uZM7XS2rHC4ie3BumvI2YTivMrq6XmvY6LgnwZo6MsoXk3ld2VuhKyRu/P8AKvxZrxYnLpsdpGlhae1VnGKUbtyairLlbeSRo8Hw30dOooKtCLbtFyVSnBt5WUppR/E891maVlPG8TJvYjdpcjknsr1Zv/NnKuS54u/J+5acU2rkteInD6OxklKjJrnh61OJfhuRwur3Hzq6N2Jty2HKnGTzexCpT2fUpqP+KO5p7kc/1r8VgA2yEkACTgtctF1NGqEYylJ1abSjFyeU43yR3pyGszGSw+DjVi7ONSKT6Wl+pLa7LG3zzXwtSnvo1l55U5owpVj0KXCuq97Uv7oxZr8ZpWhX8Nh6MvOo7EvwMxN/2I/38f21MVcYq+9PNPJrnRh1Y7Ltyb10G/xujsPPOjOVN+RU76PZJGmxeHnTymrWzT3przM6xLEwsXKaz719nxIRFX7L7PiaYfVGqN30Ng+rpr1UoHZHHapPEuD6qn8uB2Ja6J2AAqAAAAAAAANfpDw2H6K3wRzXCnTCwGHnXaUmlswi3ZSqObtfzLNvzJnS4/w2H6K3wRwmtbR062Bk43+rm5Stn3jjKLl2Kbf+J5uTydqaeJ6Y4XYvGVXOVao1d7N5OMeyKyj0I6/Vxw6rRrwwuInKdObSTnJycHyNN528x5rGbo7VOacZJq+/NKSl2rJG34HYSpisfScIvOdlZWWbzfQldna9KRRzra3yexaweB0sdavSupb9qMdtwnZJ3is3F2W7NNJnC6P4EY+dRQlKilezlHjas7f2bK/Gx7dUx/0fD16tnLiqVSrsr+LZi3b8Dz7g9rCxdTHUKVV06lOvWp0eLjTjHi9uSipRazsm03dvJM5cc3+PZ0vFc93caD0MsBguLs1aNNWbTduMTbk1k5Ntt2yztyHR03kjBxkVGm4pybqVFa8nLNy2na+5ZbjOgrJGY2s6VggG2VQIAEnC64l/pj6ym/8AvE7o43WtG+javOoVZRfNJRun6xJD5+qzaz3Lz5GLOs+f8TErVW29q9/OWuMOuGMsmVZkwxbS2XnF74vNGNKeVy1tjBleq0V9qG7ljyr90Y9X7L7C5Co0U4izi2vNdAfU+qTxLg+qp/Lgdicdqk8S4Pqqfy4HYiuknYADSAAAAAAAANfj/DYf03wRGJw6qJppO6s09zRGPn/9OHjb+Gs79kcjIPPfvMutdPOtL6ssJXm5JTp532Uoyiui6duyxsuD/BCho+7pR79qzqSUnK3NuyXmR2QsYw1lqqVFp3dms01syd4vetxrtHcF9H4Sv9JoYS1XPZd6kowbVnsRk7RybWS5TprE2ERMEzEsSlQcp8ZPkyjHm/8ATLANRGEmQkgFEkkAIk8+14Sa0RJq/haO7m42F/wPQTidb/inE9VUfbZFHzZWd8zHZWql99iiT5ju5E5chbuQ2QRVaYqPvWUome5gfVmqTxLg+qp/LgdicXqilfQ+EVt1Klnz3pxO0JXROwAGkAAAAAAAAavH/wC6w/8AZV/QyTFx/wDusP8A2Vf0Mo89vKXWukggkigAAAAAACgAAJOY1gYqNHCKclFraatKKnFt2STTyZ05xWtuG1ouq22tm9RW54tNfAk94wRt57VxOCrZVMHgpX5fo9OnL2oWf4mrx3BHR2ITdCdXCz5FtPEUb+dS75etnMxxzXKZFLSklyjpzGlm2dtRp3g7icBZ1IqVNu0a9J7dGT5r/wAL8zszUI9GwOnMnCVpQktmcJpShKPNJPec9wj0DCEXicLfif8Ako32pUW+VPlh5965ec6VvMdrMzWNw5xCe4hEz3HRzfVOqHxRheqo/LidqcVqh8UYXqqPy4nakronYADSAAAAAAAANZpCD+k4aV8tmurW5bRz+JfLWkPD4b035UXTz38pda6SCCSKkEACQQVWyuBAAAAAoHG62FfRddZZ06iz3bkdkef675uOiJtNr62isnbJ1YJoD58m2nZ7yFUKZVL5MttnZzZlOu0bPA6ScHyNbmnmmnvTXKjQKRchVsSYysSnTOCjRqKVPwVS8ocuy+WHZ8GjXy3G5nPjaUqb3/bh5pr91ddppG8i19JZ9WaoY/6PhXz06VlzWpxO1ON1ReJcH1dP5cDshXSTsABpAAAAAAAAGu0h4fDem/Ki6WtI+Hw3pvyouHnv5OtdJJIBlpJEpWTfMSW8Qrwl0FFqGIbkr7r7jO2TTXNthqm1BPsfShSUtBIgmSzILIAAgHnmvTxNPraHzYHoZ55r18TVOto/NgWNo+cdslTLRJ3c11MbRQmRtAZNKrZoxcQrSlzXuuh5lSZTX39iED6s1ReJcH1dP5cDsjjdUXiXB9XT+XA7IldE7AAaQAAAAAAABrtI+Gw3pvyouFvSPhsN6b8qKzz38naukkkAwqQAUYVXDSTyV1yeYycFGULp7nnv5S6BHYlVJ3KQCokAADzzXp4mqdbR+bA9DPPNeniafW0PmwLG0l84WJSDkilyO7mTVugouXVnkWmgKokVd/qJgUzA+rtUXiXB9XT+XA7I43VF4lwfV0/lwOyJXROwAGkAAAAAAAAa7SPhsN6b8qKyjSPhsN6b4IrPPfydqaCSAYaSSQAiSSAUSACokgACTzzXp4mqdbR+bA9CPP8AXhG+h5r+rQ+bAsbJfNrRFjJnSsUcWd3JbRNaOfSky7ClcnGx2Z25owT6bX/UDGeSKXuK585bkB9X6ovEuD6un8uB2RxuqLxLg+rp/LgdkSuidgANIAAAAAAAA1ukvDYb03wRWUaS8NhvTfBFZ5uTydqaSCCTLQSQAJJIARJJAKJABUDhdckNrRcl/UpP1VIndHGa147WjmuecfzRA+e6mHuWvo5ufo5fw+jXUaSWfQdssYanB4NX2pZRinKT5orNmjxNbjKk5+VJtLmXIvVY3/CPFxpxeFpO7v8AXTWauv8AjT+Pq5znEiwkqpLvfUW5bi7/AAvs+JaluKj6t1ReJcH1dP5cDsjjdUXiXB9XT+XA7IldE7AAaQAAAAAAABrdJeGw/pvgiso0l4bD+m+CKzzcnk7U0AAw0EkAokkgASSQAiSSAUScrrEjB4SKqThTjxkbzm1GKzVs+k6k4XXLK2i2/wCrR+ZAsI88xlTAYdvarqo/tKNGEqja6co/ic7pfhJKcXToQ4im8nK960lzOS+yvMvWa+rPbjblWa/VGumztDEysTiWWi9NlFioon9l+dpFqW4u1nmlzfEtz3MqPqvVF4lwfV0/lwOyON1ReJcH1dP5cDsiV0TsABpAAAAAAAAGt0l4bD+m+CKinSXhsP6b4IqPNyeTtTQSQDDSQAAJIBRJJAAkkgBEnAa7XbREuuofNgd+ef67vFEuuofOgajZLwPbKKnOCuMbnZzY0olMnsq/LyL9TKlFRy339S6TAqJ3d997CCVsVF3rK1Epq/ZfYaZfVOqLxLg+rp/Lgdkcbqi8S4Pq6fy4HZEronYADSAAAAAAAANZpPw+G9N+VFZGl1s8TU5I1NmT5oSyv61H1knm5PJ2poABhoAAEggASSQAJBBJRJwGux20S3v+uo5c/wBbA748y1441fRsPhU05VKu3Jf04K7/AOzp+tljaPEuM5ortuyG2/2WRlxwje5MuToxpeEaT8hZzfZydp1yxhi0oKKcn9lZv9jXTe02+dt+sy8TWdR2tsxW6K+L52WJK3TzGoRaasUVl3r7PiXbFE4ObjTinKU5RjGK3tt2SXbYqPqTVCv9FwnV0/lwOzNDwG0d9E0bhaL3xpQXsxUU+1RT7TfFrpJ2AAqAAAAAAAAKK1JTjKEldSTTXmNTLbw/e1FKUF9mslfveaaW5+fdu6FuSGr5GbUizUWw1cMTCWanF9pPHR8qPtIyHonDNtvD0Lve+KhdkdycN93o+7iculPtrqLPHR8qPtIcdHyo+0i73Iw33ej7uI7j4b7vR93EdKfZ1Frjo+VH2kOOj5UfaRd7j4b7vR93Edx8N93o+7iOlPs6i1x0fKj7SHHR8qPtIvdyMN93o+7iT3Jw/wDIo+7iOlPs6iw68PLh7SH0iG/bh7SL/cnD/wAih7uJTLQ2FeTw2HfTSgy9KfZ1Gg0/wsw+Bpyl9ZWmk9mjQpyrVJS5rR3dLsvOeB8IdOaUx+JqYieDxUdrKFP6POSp01uim458rb52+g+mo6Fwq3YbDropQRPcfDfd6Pu4lrx4Sb5fJ9TujLJ4XHW5lRqxX4RMbufi/uOM9xV/Y+ue4+G+70fdxHcfDfd6Hu4m8SmXyO8BjOTA4tefiKr/AELfcvGfcsX7ir+x9edx8N93oe7iT3Iw33eh7uIxJl8kYbg/pCs9mGBxN3yzpypx9crI9X1Zap6lKtDG4+21HOnSW6L578r86yXJd7vYqei8PFqUaFGMlukqcE12mWMJlEUkkkrJZJLJJEgGkAAAAAH/2Q==
6	prueba99	prueba99	data:image/jpeg;base64,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
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
1	pbkdf2_sha256$320000$4Jq3dPkJLkr2GqwBbGivoX$ygOXfCu6R+35YXLrF3mtNfiyVtDW69YVmue0iIScoRc=	2023-06-01 08:33:18.251714+00	t	admin			admin@admin.com	t	t	2023-05-24 16:25:34.051095+00
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
9	2023-06-01 08:33:50.166537+00	3	Product object (3)	3		7	1
10	2023-06-01 08:33:52.629359+00	2	Product object (2)	3		7	1
11	2023-06-01 08:33:55.100639+00	1	Product object (1)	3		7	1
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
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ram5n8bhvwtqufwtic5w23ilw1kliyf5	.eJxVjEEOwiAQRe_C2hClwIBL956BzDCDVA1NSrsy3l2bdKHb_977L5VwXWpau8xpZHVWJ3X43QjzQ9oG-I7tNuk8tWUeSW-K3mnX14nledndv4OKvX5rEk9ggrDhGAygCA4FondSQrBQBBCt4zh4kEIkNsPRRPYOrGVHTr0_B9Y4kQ:1q1rJE:-LslhvDJWVgJHwbVvs2jPtnV8tek9aObynd9-jZwHw8	2023-06-07 16:25:56.686959+00
8177k4krxk3t234jdua5ay1i0q8adds5	.eJxVjEEOwiAQRe_C2hClwIBL956BzDCDVA1NSrsy3l2bdKHb_977L5VwXWpau8xpZHVWJ3X43QjzQ9oG-I7tNuk8tWUeSW-K3mnX14nledndv4OKvX5rEk9ggrDhGAygCA4FondSQrBQBBCt4zh4kEIkNsPRRPYOrGVHTr0_B9Y4kQ:1q44wr:BecNfQygV40mscI0v1rGkGFf0mRmuZ6pA4qPNuUG5Hw	2023-06-13 19:24:01.040331+00
a3r5afftgy3nixljq1fpm45jspmydtnq	.eJxVjEEOwiAQRe_C2hClwIBL956BzDCDVA1NSrsy3l2bdKHb_977L5VwXWpau8xpZHVWJ3X43QjzQ9oG-I7tNuk8tWUeSW-K3mnX14nledndv4OKvX5rEk9ggrDhGAygCA4FondSQrBQBBCt4zh4kEIkNsPRRPYOrGVHTr0_B9Y4kQ:1q4GnO:j9O3JXobbu-GfR7DlwCjmzuLV-d8dNfML4UB1FBvfBo	2023-06-14 08:03:02.947591+00
yyej7navb74rcp8wp18u4iurratdi80q	.eJxVjEEOwiAQRe_C2hClwIBL956BzDCDVA1NSrsy3l2bdKHb_977L5VwXWpau8xpZHVWJ3X43QjzQ9oG-I7tNuk8tWUeSW-K3mnX14nledndv4OKvX5rEk9ggrDhGAygCA4FondSQrBQBBCt4zh4kEIkNsPRRPYOrGVHTr0_B9Y4kQ:1q4dkE:s8h9mfFZ0WZjnhktPDP44I0kE3jXxJhibhJ6mo9X2rU	2023-06-15 08:33:18.261622+00
\.


--
-- Name: Comparator_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Comparator_product_id_seq"', 6, true);


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

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 11, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


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

