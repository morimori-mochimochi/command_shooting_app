--
-- PostgreSQL database dump
--

\restrict fZSdly51EP6Dge8cw41k3NKI2aPAk8JurMAKn1wZUQ4FYzFjTMUwrN9ohMuOZTd

-- Dumped from database version 18.1 (Debian 18.1-1.pgdg12+2)
-- Dumped by pg_dump version 18.3 (Debian 18.3-1.pgdg13+1)

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: morikawa_chino
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO morikawa_chino;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: morikawa_chino
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO morikawa_chino;

--
-- Name: commands; Type: TABLE; Schema: public; Owner: morikawa_chino
--

CREATE TABLE public.commands (
    id bigint NOT NULL,
    body character varying,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.commands OWNER TO morikawa_chino;

--
-- Name: commands_id_seq; Type: SEQUENCE; Schema: public; Owner: morikawa_chino
--

CREATE SEQUENCE public.commands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.commands_id_seq OWNER TO morikawa_chino;

--
-- Name: commands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: morikawa_chino
--

ALTER SEQUENCE public.commands_id_seq OWNED BY public.commands.id;


--
-- Name: game_session_commands; Type: TABLE; Schema: public; Owner: morikawa_chino
--

CREATE TABLE public.game_session_commands (
    id bigint NOT NULL,
    command_id bigint NOT NULL,
    game_session_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.game_session_commands OWNER TO morikawa_chino;

--
-- Name: game_session_commands_id_seq; Type: SEQUENCE; Schema: public; Owner: morikawa_chino
--

CREATE SEQUENCE public.game_session_commands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.game_session_commands_id_seq OWNER TO morikawa_chino;

--
-- Name: game_session_commands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: morikawa_chino
--

ALTER SEQUENCE public.game_session_commands_id_seq OWNED BY public.game_session_commands.id;


--
-- Name: game_sessions; Type: TABLE; Schema: public; Owner: morikawa_chino
--

CREATE TABLE public.game_sessions (
    id bigint NOT NULL,
    value integer,
    user_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    duration double precision,
    command_ids integer[] DEFAULT '{}'::integer[]
);


ALTER TABLE public.game_sessions OWNER TO morikawa_chino;

--
-- Name: game_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: morikawa_chino
--

CREATE SEQUENCE public.game_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.game_sessions_id_seq OWNER TO morikawa_chino;

--
-- Name: game_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: morikawa_chino
--

ALTER SEQUENCE public.game_sessions_id_seq OWNED BY public.game_sessions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: morikawa_chino
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO morikawa_chino;

--
-- Name: users; Type: TABLE; Schema: public; Owner: morikawa_chino
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    nickname character varying
);


ALTER TABLE public.users OWNER TO morikawa_chino;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: morikawa_chino
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO morikawa_chino;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: morikawa_chino
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: commands id; Type: DEFAULT; Schema: public; Owner: morikawa_chino
--

ALTER TABLE ONLY public.commands ALTER COLUMN id SET DEFAULT nextval('public.commands_id_seq'::regclass);


--
-- Name: game_session_commands id; Type: DEFAULT; Schema: public; Owner: morikawa_chino
--

ALTER TABLE ONLY public.game_session_commands ALTER COLUMN id SET DEFAULT nextval('public.game_session_commands_id_seq'::regclass);


--
-- Name: game_sessions id; Type: DEFAULT; Schema: public; Owner: morikawa_chino
--

ALTER TABLE ONLY public.game_sessions ALTER COLUMN id SET DEFAULT nextval('public.game_sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: morikawa_chino
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: morikawa_chino
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2026-01-12 10:47:56.512762	2026-01-12 10:47:56.512767
schema_sha1	d7ddd80af6b7784a37781be586f0886420fbf08a	2026-01-12 10:47:56.613372	2026-01-12 10:47:56.613374
\.


--
-- Data for Name: commands; Type: TABLE DATA; Schema: public; Owner: morikawa_chino
--

COPY public.commands (id, body, description, created_at, updated_at) FROM stdin;
1	git add	ファイルをステージングエリアにあげる	2026-01-12 10:47:56.821384	2026-01-12 10:47:56.821384
2	git branch	ブランチ一覧表示	2026-01-12 10:47:56.916399	2026-01-12 10:47:56.916399
3	git checkout -b [ブランチ名]	ブランチを作成してカレントブランチにする	2026-01-12 10:47:56.921494	2026-01-12 10:47:56.921494
4	git checkout [ブランチ名]	ブランチの切り替え	2026-01-12 10:47:56.924029	2026-01-12 10:47:56.924029
5	git log	Gitログ表示	2026-01-12 10:47:57.014524	2026-01-12 10:47:57.014524
6	git log --oneline	Gitログを完結にまとめて表示	2026-01-12 10:47:57.017515	2026-01-12 10:47:57.017515
7	docker compose build	Dockerイメージのビルド	2026-01-12 10:47:57.021728	2026-01-12 10:47:57.021728
8	docker compose up	コンテナの起動	2026-01-12 10:47:57.024409	2026-01-12 10:47:57.024409
9	docker compose exec web bundle install	 Gemのインストール	2026-01-12 10:47:57.026742	2026-01-12 10:47:57.026742
10	docker compose exec web yarn install	 node_modulesのインストール	2026-01-12 10:47:57.029096	2026-01-12 10:47:57.029096
11	docker compose exec web rails db:create	データベースの作成	2026-01-12 10:47:57.113577	2026-01-12 10:47:57.113577
12	docker compose exec web rails db:migrate	マイグレーションファイルの適応	2026-01-12 10:47:57.116593	2026-01-12 10:47:57.116593
13	docker compose down	Dockerコンテナの終了	2026-01-12 10:47:57.118975	2026-01-12 10:47:57.118975
14	cd	現在のディレクトリの変更	2026-01-12 10:47:57.121372	2026-01-12 10:47:57.121372
15	pwd	現在のディレクトリの表示	2026-01-12 10:47:57.123749	2026-01-12 10:47:57.123749
16	mkdir	ディレクトリの作成	2026-01-12 10:47:57.126854	2026-01-12 10:47:57.126854
17	rm	ファイルやディレクトリの削除	2026-01-12 10:47:57.1335	2026-01-12 10:47:57.1335
18	touch	空ファイルの作成	2026-01-12 10:47:57.136406	2026-01-12 10:47:57.136406
\.


--
-- Data for Name: game_session_commands; Type: TABLE DATA; Schema: public; Owner: morikawa_chino
--

COPY public.game_session_commands (id, command_id, game_session_id, created_at, updated_at) FROM stdin;
1	14	1	2026-01-12 10:59:12.402291	2026-01-12 10:59:12.402291
2	8	1	2026-01-12 10:59:12.412462	2026-01-12 10:59:12.412462
3	11	1	2026-01-12 10:59:12.496327	2026-01-12 10:59:12.496327
4	1	1	2026-01-12 10:59:12.501945	2026-01-12 10:59:12.501945
5	4	1	2026-01-12 10:59:12.51212	2026-01-12 10:59:12.51212
6	12	2	2026-01-12 11:03:31.290742	2026-01-12 11:03:31.290742
7	7	2	2026-01-12 11:03:31.296756	2026-01-12 11:03:31.296756
8	4	2	2026-01-12 11:03:31.303748	2026-01-12 11:03:31.303748
9	13	2	2026-01-12 11:03:31.30881	2026-01-12 11:03:31.30881
10	9	2	2026-01-12 11:03:31.319274	2026-01-12 11:03:31.319274
11	10	3	2026-01-12 12:16:57.036494	2026-01-12 12:16:57.036494
12	16	3	2026-01-12 12:16:57.043496	2026-01-12 12:16:57.043496
13	18	3	2026-01-12 12:16:57.048657	2026-01-12 12:16:57.048657
14	8	3	2026-01-12 12:16:57.054072	2026-01-12 12:16:57.054072
15	2	3	2026-01-12 12:16:57.059634	2026-01-12 12:16:57.059634
16	8	4	2026-01-12 12:18:03.383034	2026-01-12 12:18:03.383034
17	3	4	2026-01-12 12:18:03.389827	2026-01-12 12:18:03.389827
18	12	4	2026-01-12 12:18:03.395584	2026-01-12 12:18:03.395584
19	1	4	2026-01-12 12:18:03.402647	2026-01-12 12:18:03.402647
20	16	4	2026-01-12 12:18:03.412283	2026-01-12 12:18:03.412283
21	4	5	2026-01-12 12:19:59.719779	2026-01-12 12:19:59.719779
22	17	5	2026-01-12 12:19:59.725628	2026-01-12 12:19:59.725628
23	2	5	2026-01-12 12:19:59.730738	2026-01-12 12:19:59.730738
24	11	5	2026-01-12 12:19:59.73667	2026-01-12 12:19:59.73667
25	12	5	2026-01-12 12:19:59.743415	2026-01-12 12:19:59.743415
26	2	6	2026-01-12 12:22:32.497447	2026-01-12 12:22:32.497447
27	6	6	2026-01-12 12:22:32.504715	2026-01-12 12:22:32.504715
28	18	6	2026-01-12 12:22:32.51279	2026-01-12 12:22:32.51279
29	8	6	2026-01-12 12:22:32.520374	2026-01-12 12:22:32.520374
30	9	6	2026-01-12 12:22:32.527861	2026-01-12 12:22:32.527861
31	1	7	2026-01-12 12:25:12.439403	2026-01-12 12:25:12.439403
32	4	7	2026-01-12 12:25:12.444714	2026-01-12 12:25:12.444714
33	8	7	2026-01-12 12:25:12.450944	2026-01-12 12:25:12.450944
34	2	7	2026-01-12 12:25:12.456769	2026-01-12 12:25:12.456769
35	11	7	2026-01-12 12:25:12.462825	2026-01-12 12:25:12.462825
36	13	8	2026-01-12 12:27:34.599313	2026-01-12 12:27:34.599313
37	10	8	2026-01-12 12:27:34.613088	2026-01-12 12:27:34.613088
38	18	8	2026-01-12 12:27:34.629155	2026-01-12 12:27:34.629155
39	5	8	2026-01-12 12:27:34.69479	2026-01-12 12:27:34.69479
40	1	8	2026-01-12 12:27:34.709617	2026-01-12 12:27:34.709617
41	13	9	2026-01-12 12:30:02.575136	2026-01-12 12:30:02.575136
42	5	9	2026-01-12 12:30:02.586613	2026-01-12 12:30:02.586613
43	14	9	2026-01-12 12:30:02.601532	2026-01-12 12:30:02.601532
44	2	9	2026-01-12 12:30:02.613615	2026-01-12 12:30:02.613615
45	18	9	2026-01-12 12:30:02.624577	2026-01-12 12:30:02.624577
46	14	10	2026-01-12 12:32:06.801055	2026-01-12 12:32:06.801055
47	17	10	2026-01-12 12:32:06.806788	2026-01-12 12:32:06.806788
48	4	10	2026-01-12 12:32:06.811128	2026-01-12 12:32:06.811128
49	12	10	2026-01-12 12:32:06.815291	2026-01-12 12:32:06.815291
50	5	10	2026-01-12 12:32:06.820164	2026-01-12 12:32:06.820164
51	8	11	2026-01-12 12:34:23.059752	2026-01-12 12:34:23.059752
52	9	11	2026-01-12 12:34:23.064048	2026-01-12 12:34:23.064048
53	14	11	2026-01-12 12:34:23.068166	2026-01-12 12:34:23.068166
54	12	11	2026-01-12 12:34:23.072301	2026-01-12 12:34:23.072301
55	4	11	2026-01-12 12:34:23.076463	2026-01-12 12:34:23.076463
\.


--
-- Data for Name: game_sessions; Type: TABLE DATA; Schema: public; Owner: morikawa_chino
--

COPY public.game_sessions (id, value, user_id, created_at, updated_at, duration, command_ids) FROM stdin;
1	\N	\N	2026-01-12 10:59:12.195093	2026-01-12 11:00:02.009491	48791	{}
2	\N	1	2026-01-12 11:03:31.271112	2026-01-12 11:04:37.189628	65564	{}
3	\N	2	2026-01-12 12:16:57.02602	2026-01-12 12:17:33.754553	36350	{}
4	\N	2	2026-01-12 12:18:03.357466	2026-01-12 12:18:03.357466	\N	{}
5	\N	3	2026-01-12 12:19:59.711817	2026-01-12 12:21:03.121334	62957	{}
6	\N	4	2026-01-12 12:22:32.487493	2026-01-12 12:23:15.838575	42878	{}
7	\N	5	2026-01-12 12:25:12.432389	2026-01-12 12:26:00.451691	47465	{}
8	\N	6	2026-01-12 12:27:34.514336	2026-01-12 12:28:07.640853	32586	{}
9	\N	7	2026-01-12 12:30:02.560667	2026-01-12 12:30:22.673253	19689	{}
10	\N	8	2026-01-12 12:32:06.793501	2026-01-12 12:32:47.267881	40115	{}
11	\N	9	2026-01-12 12:34:23.052736	2026-01-12 12:35:11.634232	48190	{}
12	\N	\N	2026-03-10 04:14:59.735494	2026-03-10 04:15:36.769202	36550	{18,12,15,7,1}
13	\N	\N	2026-03-12 15:20:04.897037	2026-03-12 15:20:33.594913	27517	{18,7,13,8,11}
14	\N	\N	2026-03-12 15:20:47.121696	2026-03-12 15:21:01.571243	14202	{18,14,17,12,2}
15	\N	\N	2026-03-13 00:40:17.317636	2026-03-13 00:40:49.149369	31497	{3,6,16,2,1}
16	\N	\N	2026-03-23 04:47:10.398952	2026-03-23 04:47:10.418116	\N	{9,12,1,16,3}
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: morikawa_chino
--

COPY public.schema_migrations (version) FROM stdin;
20250622090116
20250622084541
20250622083049
20250621024025
20250621020651
20250621010206
20250620091450
20250619061041
20250618004636
20260303022732
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: morikawa_chino
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, nickname) FROM stdin;
1	sample@co.jp	$2a$12$Ty89oUjUjdXk.8EDf0F/CuQK.Mdg/H1HMwwcPV59YtW2j1BrX5PiK	\N	\N	\N	2026-01-12 11:03:26.205586	2026-01-12 11:03:26.205586	abcde
2	roll@example.com	$2a$12$DEeh1sFl3wzMWujuHbwLrO0iuS7xsloe5vGj/3rwRuzgFkgx/0U8i	\N	\N	\N	2026-01-12 12:16:53.204247	2026-01-12 12:16:53.204247	ロール
3	aya@icloud.com	$2a$12$46n.6jjUtrZXFVVukK/e0uAoijC8nZoH1Tnx5EJLGVZUx5Nv9m4cu	\N	\N	\N	2026-01-12 12:19:22.305664	2026-01-12 12:19:22.305664	あやまる
4	atsu@icloud.com	$2a$12$h5qukaGYjhvulpN4y0OvRO6D8EtxRQTB1hQn6LHrzi4c08C6Gtl0a	\N	\N	\N	2026-01-12 12:22:11.614102	2026-01-12 12:22:11.614102	あつ
5	itou@icloud.com	$2a$12$ODRgfatcCXFiRAfwQRwnJ.iVGv8Y9EDUzBbD5/CwxcEQ95T.B7M6K	\N	\N	\N	2026-01-12 12:25:07.996949	2026-01-12 12:25:07.996949	伊藤
6	morikawa@icloud.com	$2a$12$exQSI8JZ6O.lirFDD9YDSuuhlP7gJim4c1yFKnjq2jJz.TXNaA.Ja	\N	\N	\N	2026-01-12 12:27:08.998371	2026-01-12 12:27:08.998371	森川
7	paruparu@co.jp	$2a$12$ZKcs2rWctWle7NJErtta2.FvUsnY2n96qGYrxiA/QY2u9mCivB9cK	\N	\N	\N	2026-01-12 12:29:46.104898	2026-01-12 12:29:46.104898	ぱるる
8	akaoni@co.jp	$2a$12$XN1j5e8f0QF4hAgiS.VS1.lrrbCnSaLxF6s0GXYMi2aaBecPlqH6m	\N	\N	\N	2026-01-12 12:31:42.602951	2026-01-12 12:31:42.602951	あかおに
9	yu@co.jp	$2a$12$MTPebUHfpg2WqBzlitWjlOf4eGXc2slp7GLXW9xhLZLFWfN1MjhKa	\N	\N	\N	2026-01-12 12:34:14.605467	2026-01-12 12:34:14.605467	ゆう
\.


--
-- Name: commands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: morikawa_chino
--

SELECT pg_catalog.setval('public.commands_id_seq', 18, true);


--
-- Name: game_session_commands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: morikawa_chino
--

SELECT pg_catalog.setval('public.game_session_commands_id_seq', 55, true);


--
-- Name: game_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: morikawa_chino
--

SELECT pg_catalog.setval('public.game_sessions_id_seq', 16, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: morikawa_chino
--

SELECT pg_catalog.setval('public.users_id_seq', 9, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: morikawa_chino
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: commands commands_pkey; Type: CONSTRAINT; Schema: public; Owner: morikawa_chino
--

ALTER TABLE ONLY public.commands
    ADD CONSTRAINT commands_pkey PRIMARY KEY (id);


--
-- Name: game_session_commands game_session_commands_pkey; Type: CONSTRAINT; Schema: public; Owner: morikawa_chino
--

ALTER TABLE ONLY public.game_session_commands
    ADD CONSTRAINT game_session_commands_pkey PRIMARY KEY (id);


--
-- Name: game_sessions game_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: morikawa_chino
--

ALTER TABLE ONLY public.game_sessions
    ADD CONSTRAINT game_sessions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: morikawa_chino
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: morikawa_chino
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_game_session_commands_on_command_id; Type: INDEX; Schema: public; Owner: morikawa_chino
--

CREATE INDEX index_game_session_commands_on_command_id ON public.game_session_commands USING btree (command_id);


--
-- Name: index_game_session_commands_on_game_session_id; Type: INDEX; Schema: public; Owner: morikawa_chino
--

CREATE INDEX index_game_session_commands_on_game_session_id ON public.game_session_commands USING btree (game_session_id);


--
-- Name: index_game_sessions_on_user_id; Type: INDEX; Schema: public; Owner: morikawa_chino
--

CREATE INDEX index_game_sessions_on_user_id ON public.game_sessions USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: morikawa_chino
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: morikawa_chino
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: game_session_commands fk_rails_7db533dbb6; Type: FK CONSTRAINT; Schema: public; Owner: morikawa_chino
--

ALTER TABLE ONLY public.game_session_commands
    ADD CONSTRAINT fk_rails_7db533dbb6 FOREIGN KEY (command_id) REFERENCES public.commands(id);


--
-- Name: game_sessions fk_rails_cb58f6d2a5; Type: FK CONSTRAINT; Schema: public; Owner: morikawa_chino
--

ALTER TABLE ONLY public.game_sessions
    ADD CONSTRAINT fk_rails_cb58f6d2a5 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES TO morikawa_chino;


--
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES TO morikawa_chino;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS TO morikawa_chino;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES TO morikawa_chino;


--
-- PostgreSQL database dump complete
--

\unrestrict fZSdly51EP6Dge8cw41k3NKI2aPAk8JurMAKn1wZUQ4FYzFjTMUwrN9ohMuOZTd

