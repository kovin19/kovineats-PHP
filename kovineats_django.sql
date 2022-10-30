--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-1.pgdg22.04+1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-1.pgdg22.04+1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: kovin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO kovin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO kovin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: kovin
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO kovin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO kovin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: kovin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO kovin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO kovin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: kovin
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


ALTER TABLE public.auth_user OWNER TO kovin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: kovin
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO kovin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO kovin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO kovin;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: kovin
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO kovin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO kovin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: carrito; Type: TABLE; Schema: public; Owner: kovin
--

CREATE TABLE public.carrito (
    id bigint NOT NULL,
    total double precision NOT NULL
);


ALTER TABLE public.carrito OWNER TO kovin;

--
-- Name: carrito_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.carrito_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carrito_id_seq OWNER TO kovin;

--
-- Name: carrito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.carrito_id_seq OWNED BY public.carrito.id;


--
-- Name: carrito_ingredientes; Type: TABLE; Schema: public; Owner: kovin
--

CREATE TABLE public.carrito_ingredientes (
    id bigint NOT NULL,
    carritomodel_id bigint NOT NULL,
    ingredientemodel_id bigint NOT NULL
);


ALTER TABLE public.carrito_ingredientes OWNER TO kovin;

--
-- Name: carrito_ingredientes_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.carrito_ingredientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carrito_ingredientes_id_seq OWNER TO kovin;

--
-- Name: carrito_ingredientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.carrito_ingredientes_id_seq OWNED BY public.carrito_ingredientes.id;


--
-- Name: carrito_platillos; Type: TABLE; Schema: public; Owner: kovin
--

CREATE TABLE public.carrito_platillos (
    id bigint NOT NULL,
    carritomodel_id bigint NOT NULL,
    platillomodel_id bigint NOT NULL
);


ALTER TABLE public.carrito_platillos OWNER TO kovin;

--
-- Name: carrito_platillos_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.carrito_platillos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carrito_platillos_id_seq OWNER TO kovin;

--
-- Name: carrito_platillos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.carrito_platillos_id_seq OWNED BY public.carrito_platillos.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: kovin
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


ALTER TABLE public.django_admin_log OWNER TO kovin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO kovin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: kovin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO kovin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO kovin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: kovin
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO kovin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO kovin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: kovin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO kovin;

--
-- Name: ingredientes; Type: TABLE; Schema: public; Owner: kovin
--

CREATE TABLE public.ingredientes (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.ingredientes OWNER TO kovin;

--
-- Name: ingredientes_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.ingredientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredientes_id_seq OWNER TO kovin;

--
-- Name: ingredientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.ingredientes_id_seq OWNED BY public.ingredientes.id;


--
-- Name: pedidos; Type: TABLE; Schema: public; Owner: kovin
--

CREATE TABLE public.pedidos (
    id bigint NOT NULL,
    folio character varying(255) NOT NULL,
    total character varying(255) NOT NULL,
    repartidor character varying(255) NOT NULL,
    fecha_pedido date
);


ALTER TABLE public.pedidos OWNER TO kovin;

--
-- Name: pedidos_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.pedidos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedidos_id_seq OWNER TO kovin;

--
-- Name: pedidos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.pedidos_id_seq OWNED BY public.pedidos.id;


--
-- Name: pedidos_ingredientes; Type: TABLE; Schema: public; Owner: kovin
--

CREATE TABLE public.pedidos_ingredientes (
    id bigint NOT NULL,
    pedidomodel_id bigint NOT NULL,
    ingredientemodel_id bigint NOT NULL
);


ALTER TABLE public.pedidos_ingredientes OWNER TO kovin;

--
-- Name: pedidos_ingredientes_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.pedidos_ingredientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedidos_ingredientes_id_seq OWNER TO kovin;

--
-- Name: pedidos_ingredientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.pedidos_ingredientes_id_seq OWNED BY public.pedidos_ingredientes.id;


--
-- Name: pedidos_platillos; Type: TABLE; Schema: public; Owner: kovin
--

CREATE TABLE public.pedidos_platillos (
    id bigint NOT NULL,
    pedidomodel_id bigint NOT NULL,
    platillomodel_id bigint NOT NULL
);


ALTER TABLE public.pedidos_platillos OWNER TO kovin;

--
-- Name: pedidos_platillos_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.pedidos_platillos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedidos_platillos_id_seq OWNER TO kovin;

--
-- Name: pedidos_platillos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.pedidos_platillos_id_seq OWNED BY public.pedidos_platillos.id;


--
-- Name: platillos; Type: TABLE; Schema: public; Owner: kovin
--

CREATE TABLE public.platillos (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    precio character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL,
    logo_url character varying(255) NOT NULL,
    restaurante_id bigint NOT NULL
);


ALTER TABLE public.platillos OWNER TO kovin;

--
-- Name: platillos_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.platillos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.platillos_id_seq OWNER TO kovin;

--
-- Name: platillos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.platillos_id_seq OWNED BY public.platillos.id;


--
-- Name: platillos_ingredientes; Type: TABLE; Schema: public; Owner: kovin
--

CREATE TABLE public.platillos_ingredientes (
    id bigint NOT NULL,
    platillomodel_id bigint NOT NULL,
    ingredientemodel_id bigint NOT NULL
);


ALTER TABLE public.platillos_ingredientes OWNER TO kovin;

--
-- Name: platillos_ingredientes_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.platillos_ingredientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.platillos_ingredientes_id_seq OWNER TO kovin;

--
-- Name: platillos_ingredientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.platillos_ingredientes_id_seq OWNED BY public.platillos_ingredientes.id;


--
-- Name: restaurantes; Type: TABLE; Schema: public; Owner: kovin
--

CREATE TABLE public.restaurantes (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    direccion character varying(255) NOT NULL,
    telefono character varying(10) NOT NULL,
    horario character varying(255) NOT NULL,
    logo_url character varying(255) NOT NULL
);


ALTER TABLE public.restaurantes OWNER TO kovin;

--
-- Name: restaurantes_id_seq; Type: SEQUENCE; Schema: public; Owner: kovin
--

CREATE SEQUENCE public.restaurantes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurantes_id_seq OWNER TO kovin;

--
-- Name: restaurantes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kovin
--

ALTER SEQUENCE public.restaurantes_id_seq OWNED BY public.restaurantes.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: carrito id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.carrito ALTER COLUMN id SET DEFAULT nextval('public.carrito_id_seq'::regclass);


--
-- Name: carrito_ingredientes id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.carrito_ingredientes ALTER COLUMN id SET DEFAULT nextval('public.carrito_ingredientes_id_seq'::regclass);


--
-- Name: carrito_platillos id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.carrito_platillos ALTER COLUMN id SET DEFAULT nextval('public.carrito_platillos_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: ingredientes id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.ingredientes ALTER COLUMN id SET DEFAULT nextval('public.ingredientes_id_seq'::regclass);


--
-- Name: pedidos id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.pedidos ALTER COLUMN id SET DEFAULT nextval('public.pedidos_id_seq'::regclass);


--
-- Name: pedidos_ingredientes id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.pedidos_ingredientes ALTER COLUMN id SET DEFAULT nextval('public.pedidos_ingredientes_id_seq'::regclass);


--
-- Name: pedidos_platillos id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.pedidos_platillos ALTER COLUMN id SET DEFAULT nextval('public.pedidos_platillos_id_seq'::regclass);


--
-- Name: platillos id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.platillos ALTER COLUMN id SET DEFAULT nextval('public.platillos_id_seq'::regclass);


--
-- Name: platillos_ingredientes id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.platillos_ingredientes ALTER COLUMN id SET DEFAULT nextval('public.platillos_ingredientes_id_seq'::regclass);


--
-- Name: restaurantes id; Type: DEFAULT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.restaurantes ALTER COLUMN id SET DEFAULT nextval('public.restaurantes_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: kovin
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
25	Can add ingrediente model	7	add_ingredientemodel
26	Can change ingrediente model	7	change_ingredientemodel
27	Can delete ingrediente model	7	delete_ingredientemodel
28	Can view ingrediente model	7	view_ingredientemodel
29	Can add restaurante model	8	add_restaurantemodel
30	Can change restaurante model	8	change_restaurantemodel
31	Can delete restaurante model	8	delete_restaurantemodel
32	Can view restaurante model	8	view_restaurantemodel
33	Can add platillo model	9	add_platillomodel
34	Can change platillo model	9	change_platillomodel
35	Can delete platillo model	9	delete_platillomodel
36	Can view platillo model	9	view_platillomodel
37	Can add pedido model	10	add_pedidomodel
38	Can change pedido model	10	change_pedidomodel
39	Can delete pedido model	10	delete_pedidomodel
40	Can view pedido model	10	view_pedidomodel
41	Can add carrito model	11	add_carritomodel
42	Can change carrito model	11	change_carritomodel
43	Can delete carrito model	11	delete_carritomodel
44	Can view carrito model	11	view_carritomodel
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$tKrqVjceTzZmAYOkB2S2rf$6BelXVDCBSZnQcSpZbxA+vG0ApqwQvGC8mGxC+/P/D0=	\N	t	admin				t	t	2022-09-10 15:17:08.786614-07
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: carrito; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.carrito (id, total) FROM stdin;
100	60
101	90
102	130
\.


--
-- Data for Name: carrito_ingredientes; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.carrito_ingredientes (id, carritomodel_id, ingredientemodel_id) FROM stdin;
120	100	11
121	101	7
122	101	8
123	102	6
124	102	7
\.


--
-- Data for Name: carrito_platillos; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.carrito_platillos (id, carritomodel_id, platillomodel_id) FROM stdin;
81	100	6
82	101	2
83	102	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	index	ingredientemodel
8	index	restaurantemodel
9	index	platillomodel
10	index	pedidomodel
11	index	carritomodel
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-09-10 15:16:56.07928-07
2	auth	0001_initial	2022-09-10 15:16:56.333231-07
3	admin	0001_initial	2022-09-10 15:16:56.385924-07
4	admin	0002_logentry_remove_auto_add	2022-09-10 15:16:56.40236-07
5	admin	0003_logentry_add_action_flag_choices	2022-09-10 15:16:56.419151-07
6	contenttypes	0002_remove_content_type_name	2022-09-10 15:16:56.460768-07
7	auth	0002_alter_permission_name_max_length	2022-09-10 15:16:56.46944-07
8	auth	0003_alter_user_email_max_length	2022-09-10 15:16:56.481053-07
9	auth	0004_alter_user_username_opts	2022-09-10 15:16:56.502636-07
10	auth	0005_alter_user_last_login_null	2022-09-10 15:16:56.521088-07
11	auth	0006_require_contenttypes_0002	2022-09-10 15:16:56.531473-07
12	auth	0007_alter_validators_add_error_messages	2022-09-10 15:16:56.541691-07
13	auth	0008_alter_user_username_max_length	2022-09-10 15:16:56.559558-07
14	auth	0009_alter_user_last_name_max_length	2022-09-10 15:16:56.574922-07
15	auth	0010_alter_group_name_max_length	2022-09-10 15:16:56.586847-07
16	auth	0011_update_proxy_permissions	2022-09-10 15:16:56.599209-07
17	auth	0012_alter_user_first_name_max_length	2022-09-10 15:16:56.612867-07
18	index	0001_initial	2022-09-10 15:16:56.807468-07
19	sessions	0001_initial	2022-09-10 15:16:56.828066-07
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
74a7vaelan1caaiwunf2ece6rdj91fik	e30:1oXtFU:UD4ci0J5-PSLOVOdgvO82BFC5ZDKrhZYcqwjhZDQJAY	2022-09-26 16:53:56.358579-07
o76z560z4pm6xdy9e6cmqw0c22jcg2r3	e30:1oaTGX:AwgAffHSNzd-FlMF9UnOvyQBHhrowNEO5APkwuV10eU	2022-10-03 19:45:41.343123-07
euyk6gisz1io03wgzddxa140qzxownr6	e30:1oi0bZ:xQKmjxNtfPAF19vJ34ePuE4XlWjvj_RJ3WCTQQpjLrA	2022-10-24 14:46:33.128255-07
\.


--
-- Data for Name: ingredientes; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.ingredientes (id, nombre) FROM stdin;
1	Pepperoni
2	Jamon
3	Chorizo
4	Jalapeño
5	Cebolla
6	Tocino
7	Champiñon
8	Lechuga
9	Catsup
10	Pepinillos
11	Aros de cebolla
12	Tomate
13	Mostaza
14	Mayonesa
15	Queso
16	Salsa BBQ
17	Natural
18	Salsa Buffalo
19	Frijol
20	Papa
21	Chilorio
22	Machaca
23	Carne Asada
24	Queso
25	Camaron
26	Res
27	Pollo
28	Alga
\.


--
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.pedidos (id, folio, total, repartidor, fecha_pedido) FROM stdin;
53	KOVINEATS202209180003553	60.00	Gonzalo Ballesteros Ballesteros	2022-09-18
54	KOVINEATS2022092000023754	130.00	Marcos Ballesteros Herrera	2022-09-20
55	KOVINEATS2022101000027255	20.00	Marcos Herrera Quiles	2022-10-10
\.


--
-- Data for Name: pedidos_ingredientes; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.pedidos_ingredientes (id, pedidomodel_id, ingredientemodel_id) FROM stdin;
12	53	11
13	54	17
14	55	22
15	55	23
16	55	11
\.


--
-- Data for Name: pedidos_platillos; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.pedidos_platillos (id, pedidomodel_id, platillomodel_id) FROM stdin;
53	53	6
54	54	3
55	55	4
56	55	6
\.


--
-- Data for Name: platillos; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.platillos (id, nombre, precio, descripcion, logo_url, restaurante_id) FROM stdin;
1	Pizza	130.00	Pizza familiar de queso de 8 rebandas	https://i.ibb.co/74JpfR5/pizza.png	1
2	Hamburguesa	90.00	Hamburguesa sencilla pan y carne	https://i.ibb.co/Nxh8yNp/hamburguesa.png	2
4	Burritos	20.00	Excelentes burritos de harina	https://i.ibb.co/Brn56wp/burritos.png	3
5	Sushi	130.00	Sushis sencillos estilo california	https://i.ibb.co/tX1G1G4/sushi.png	4
6	Aros de cebolla	60.00	Orden de aros de cebolla	https://i.ibb.co/r7dVJrd/aros-cebolla.png	5
3	Boneless	130.00	Orden de boneless	https://i.ibb.co/fkT1VSL/boneless.png	4
\.


--
-- Data for Name: platillos_ingredientes; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.platillos_ingredientes (id, platillomodel_id, ingredientemodel_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	2	4
9	2	5
10	2	6
11	2	7
12	2	8
13	2	9
14	2	10
15	2	11
16	2	12
17	2	13
18	2	14
19	2	15
20	2	16
21	3	16
22	3	17
23	3	18
24	4	19
25	4	20
26	4	21
27	4	22
28	4	23
29	4	24
30	5	25
31	5	26
32	5	27
33	5	28
34	6	11
\.


--
-- Data for Name: restaurantes; Type: TABLE DATA; Schema: public; Owner: kovin
--

COPY public.restaurantes (id, nombre, direccion, telefono, horario, logo_url) FROM stdin;
1	Pizzas Castillo	Calle Guatemala 523 Col. Cajeme	1548789564	12 PM - 10 PM	https://i.ibb.co/PFsz4BM/pizzas-castillo.png
2	Crustaceo Cascarudo	Calle Venezuela 124 Col. Cuahutemoc	2564859784	11 AM - 11 PM	https://i.ibb.co/pLTypNq/crustaceo-cascarudo.png
3	Burritos de la 69	Calle Manzanillo 478 Col. Centro	1253654897	9 AM - 6 PM	https://i.ibb.co/bBRjH42/burritos-69.png
4	Sushistoso	Calle Guerrero 115 Col. America	2365241025	11 AM - 11 PM	https://i.ibb.co/0VpS5ZJ/sushistoso.png
5	Tenemos de Todo	Calle Sahuaripa 1145 Col. Mexico	2365258971	10 AM - 10 PM	https://i.ibb.co/RHn42dW/tenemos-de-todo.png
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: carrito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.carrito_id_seq', 102, true);


--
-- Name: carrito_ingredientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.carrito_ingredientes_id_seq', 124, true);


--
-- Name: carrito_platillos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.carrito_platillos_id_seq', 83, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: ingredientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.ingredientes_id_seq', 28, true);


--
-- Name: pedidos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.pedidos_id_seq', 55, true);


--
-- Name: pedidos_ingredientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.pedidos_ingredientes_id_seq', 16, true);


--
-- Name: pedidos_platillos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.pedidos_platillos_id_seq', 56, true);


--
-- Name: platillos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.platillos_id_seq', 6, true);


--
-- Name: platillos_ingredientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.platillos_ingredientes_id_seq', 36, true);


--
-- Name: restaurantes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kovin
--

SELECT pg_catalog.setval('public.restaurantes_id_seq', 5, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: carrito_ingredientes carrito_ingredientes_carritomodel_id_ingredie_9b67d981_uniq; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.carrito_ingredientes
    ADD CONSTRAINT carrito_ingredientes_carritomodel_id_ingredie_9b67d981_uniq UNIQUE (carritomodel_id, ingredientemodel_id);


--
-- Name: carrito_ingredientes carrito_ingredientes_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.carrito_ingredientes
    ADD CONSTRAINT carrito_ingredientes_pkey PRIMARY KEY (id);


--
-- Name: carrito carrito_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_pkey PRIMARY KEY (id);


--
-- Name: carrito_platillos carrito_platillos_carritomodel_id_platillo_4339f1f6_uniq; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.carrito_platillos
    ADD CONSTRAINT carrito_platillos_carritomodel_id_platillo_4339f1f6_uniq UNIQUE (carritomodel_id, platillomodel_id);


--
-- Name: carrito_platillos carrito_platillos_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.carrito_platillos
    ADD CONSTRAINT carrito_platillos_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: ingredientes ingredientes_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.ingredientes
    ADD CONSTRAINT ingredientes_pkey PRIMARY KEY (id);


--
-- Name: pedidos_ingredientes pedidos_ingredientes_pedidomodel_id_ingredien_3ad8acb5_uniq; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.pedidos_ingredientes
    ADD CONSTRAINT pedidos_ingredientes_pedidomodel_id_ingredien_3ad8acb5_uniq UNIQUE (pedidomodel_id, ingredientemodel_id);


--
-- Name: pedidos_ingredientes pedidos_ingredientes_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.pedidos_ingredientes
    ADD CONSTRAINT pedidos_ingredientes_pkey PRIMARY KEY (id);


--
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (id);


--
-- Name: pedidos_platillos pedidos_platillos_pedidomodel_id_platillomodel_id_8a876ee5_uniq; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.pedidos_platillos
    ADD CONSTRAINT pedidos_platillos_pedidomodel_id_platillomodel_id_8a876ee5_uniq UNIQUE (pedidomodel_id, platillomodel_id);


--
-- Name: pedidos_platillos pedidos_platillos_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.pedidos_platillos
    ADD CONSTRAINT pedidos_platillos_pkey PRIMARY KEY (id);


--
-- Name: platillos_ingredientes platillos_ingredientes_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.platillos_ingredientes
    ADD CONSTRAINT platillos_ingredientes_pkey PRIMARY KEY (id);


--
-- Name: platillos_ingredientes platillos_ingredientes_platillomodel_id_ingredi_41430d45_uniq; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.platillos_ingredientes
    ADD CONSTRAINT platillos_ingredientes_platillomodel_id_ingredi_41430d45_uniq UNIQUE (platillomodel_id, ingredientemodel_id);


--
-- Name: platillos platillos_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.platillos
    ADD CONSTRAINT platillos_pkey PRIMARY KEY (id);


--
-- Name: restaurantes restaurantes_pkey; Type: CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.restaurantes
    ADD CONSTRAINT restaurantes_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: carrito_ingredientes_carritomodel_id_cf79b33b; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX carrito_ingredientes_carritomodel_id_cf79b33b ON public.carrito_ingredientes USING btree (carritomodel_id);


--
-- Name: carrito_ingredientes_ingredientemodel_id_31285840; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX carrito_ingredientes_ingredientemodel_id_31285840 ON public.carrito_ingredientes USING btree (ingredientemodel_id);


--
-- Name: carrito_platillos_carritomodel_id_6782d5ef; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX carrito_platillos_carritomodel_id_6782d5ef ON public.carrito_platillos USING btree (carritomodel_id);


--
-- Name: carrito_platillos_platillomodel_id_8ff85a21; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX carrito_platillos_platillomodel_id_8ff85a21 ON public.carrito_platillos USING btree (platillomodel_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: pedidos_ingredientes_ingredientemodel_id_506884f0; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX pedidos_ingredientes_ingredientemodel_id_506884f0 ON public.pedidos_ingredientes USING btree (ingredientemodel_id);


--
-- Name: pedidos_ingredientes_pedidomodel_id_8a447fa1; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX pedidos_ingredientes_pedidomodel_id_8a447fa1 ON public.pedidos_ingredientes USING btree (pedidomodel_id);


--
-- Name: pedidos_platillos_pedidomodel_id_bcafe02d; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX pedidos_platillos_pedidomodel_id_bcafe02d ON public.pedidos_platillos USING btree (pedidomodel_id);


--
-- Name: pedidos_platillos_platillomodel_id_6f7dcbb7; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX pedidos_platillos_platillomodel_id_6f7dcbb7 ON public.pedidos_platillos USING btree (platillomodel_id);


--
-- Name: platillos_ingredientes_ingredientemodel_id_f79f7674; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX platillos_ingredientes_ingredientemodel_id_f79f7674 ON public.platillos_ingredientes USING btree (ingredientemodel_id);


--
-- Name: platillos_ingredientes_platillomodel_id_78149fc2; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX platillos_ingredientes_platillomodel_id_78149fc2 ON public.platillos_ingredientes USING btree (platillomodel_id);


--
-- Name: platillos_restaurante_id_7980e330; Type: INDEX; Schema: public; Owner: kovin
--

CREATE INDEX platillos_restaurante_id_7980e330 ON public.platillos USING btree (restaurante_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carrito_ingredientes carrito_ingredientes_carritomodel_id_cf79b33b_fk_carrito_id; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.carrito_ingredientes
    ADD CONSTRAINT carrito_ingredientes_carritomodel_id_cf79b33b_fk_carrito_id FOREIGN KEY (carritomodel_id) REFERENCES public.carrito(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carrito_ingredientes carrito_ingredientes_ingredientemodel_id_31285840_fk_ingredien; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.carrito_ingredientes
    ADD CONSTRAINT carrito_ingredientes_ingredientemodel_id_31285840_fk_ingredien FOREIGN KEY (ingredientemodel_id) REFERENCES public.ingredientes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carrito_platillos carrito_platillos_carritomodel_id_6782d5ef_fk_carrito_id; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.carrito_platillos
    ADD CONSTRAINT carrito_platillos_carritomodel_id_6782d5ef_fk_carrito_id FOREIGN KEY (carritomodel_id) REFERENCES public.carrito(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carrito_platillos carrito_platillos_platillomodel_id_8ff85a21_fk_platillos_id; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.carrito_platillos
    ADD CONSTRAINT carrito_platillos_platillomodel_id_8ff85a21_fk_platillos_id FOREIGN KEY (platillomodel_id) REFERENCES public.platillos(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pedidos_ingredientes pedidos_ingredientes_ingredientemodel_id_506884f0_fk_ingredien; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.pedidos_ingredientes
    ADD CONSTRAINT pedidos_ingredientes_ingredientemodel_id_506884f0_fk_ingredien FOREIGN KEY (ingredientemodel_id) REFERENCES public.ingredientes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pedidos_ingredientes pedidos_ingredientes_pedidomodel_id_8a447fa1_fk_pedidos_id; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.pedidos_ingredientes
    ADD CONSTRAINT pedidos_ingredientes_pedidomodel_id_8a447fa1_fk_pedidos_id FOREIGN KEY (pedidomodel_id) REFERENCES public.pedidos(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pedidos_platillos pedidos_platillos_pedidomodel_id_bcafe02d_fk_pedidos_id; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.pedidos_platillos
    ADD CONSTRAINT pedidos_platillos_pedidomodel_id_bcafe02d_fk_pedidos_id FOREIGN KEY (pedidomodel_id) REFERENCES public.pedidos(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pedidos_platillos pedidos_platillos_platillomodel_id_6f7dcbb7_fk_platillos_id; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.pedidos_platillos
    ADD CONSTRAINT pedidos_platillos_platillomodel_id_6f7dcbb7_fk_platillos_id FOREIGN KEY (platillomodel_id) REFERENCES public.platillos(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: platillos_ingredientes platillos_ingredient_ingredientemodel_id_f79f7674_fk_ingredien; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.platillos_ingredientes
    ADD CONSTRAINT platillos_ingredient_ingredientemodel_id_f79f7674_fk_ingredien FOREIGN KEY (ingredientemodel_id) REFERENCES public.ingredientes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: platillos_ingredientes platillos_ingredient_platillomodel_id_78149fc2_fk_platillos; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.platillos_ingredientes
    ADD CONSTRAINT platillos_ingredient_platillomodel_id_78149fc2_fk_platillos FOREIGN KEY (platillomodel_id) REFERENCES public.platillos(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: platillos platillos_restaurante_id_7980e330_fk_restaurantes_id; Type: FK CONSTRAINT; Schema: public; Owner: kovin
--

ALTER TABLE ONLY public.platillos
    ADD CONSTRAINT platillos_restaurante_id_7980e330_fk_restaurantes_id FOREIGN KEY (restaurante_id) REFERENCES public.restaurantes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

