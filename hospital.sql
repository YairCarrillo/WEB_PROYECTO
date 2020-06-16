--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-2.pgdg18.04+1)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-2.pgdg18.04+1)

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
-- Name: causahosp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.causahosp (
    idcausahosp integer NOT NULL,
    tratamiento character varying(300) NOT NULL,
    observaciones character varying(300) NOT NULL
);


ALTER TABLE public.causahosp OWNER TO postgres;

--
-- Name: causahosp_idcausahosp_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.causahosp_idcausahosp_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.causahosp_idcausahosp_seq OWNER TO postgres;

--
-- Name: causahosp_idcausahosp_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.causahosp_idcausahosp_seq OWNED BY public.causahosp.idcausahosp;


--
-- Name: cuarto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuarto (
    nocuarto integer NOT NULL,
    idedocuarto integer NOT NULL
);


ALTER TABLE public.cuarto OWNER TO postgres;

--
-- Name: edocuarto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.edocuarto (
    idedocuarto integer NOT NULL,
    edocuarto character varying(45) NOT NULL
);


ALTER TABLE public.edocuarto OWNER TO postgres;

--
-- Name: edocuarto_idedocuarto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.edocuarto_idedocuarto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.edocuarto_idedocuarto_seq OWNER TO postgres;

--
-- Name: edocuarto_idedocuarto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.edocuarto_idedocuarto_seq OWNED BY public.edocuarto.idedocuarto;


--
-- Name: especialidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especialidad (
    idesp character varying(5) NOT NULL,
    descesp character varying(45) NOT NULL
);


ALTER TABLE public.especialidad OWNER TO postgres;

--
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado (
    idestado integer NOT NULL,
    clave character varying(3) NOT NULL,
    nombre character varying(40) NOT NULL,
    abrev character varying(10) NOT NULL,
    activo integer NOT NULL
);


ALTER TABLE public.estado OWNER TO postgres;

--
-- Name: estado_idestado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_idestado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_idestado_seq OWNER TO postgres;

--
-- Name: estado_idestado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_idestado_seq OWNED BY public.estado.idestado;


--
-- Name: historial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historial (
    idhistorial integer NOT NULL,
    cedula integer NOT NULL,
    curp character varying(15) NOT NULL,
    fechaingreso date NOT NULL,
    fechaalta date,
    idcausahosp integer NOT NULL,
    nocama integer NOT NULL,
    nocuarto integer NOT NULL
);


ALTER TABLE public.historial OWNER TO postgres;

--
-- Name: historial_idhistorial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historial_idhistorial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historial_idhistorial_seq OWNER TO postgres;

--
-- Name: historial_idhistorial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historial_idhistorial_seq OWNED BY public.historial.idhistorial;


--
-- Name: medico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medico (
    cedula integer NOT NULL,
    nombre character varying(50) NOT NULL,
    dir character varying(250) NOT NULL,
    idesp character varying(5) NOT NULL,
    tel integer NOT NULL
);


ALTER TABLE public.medico OWNER TO postgres;

--
-- Name: municipio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.municipio (
    idmunicipio integer NOT NULL,
    idestado integer NOT NULL,
    clave character varying(3) NOT NULL,
    nombre character varying(100) NOT NULL,
    activo integer NOT NULL
);


ALTER TABLE public.municipio OWNER TO postgres;

--
-- Name: municipio_idmunicipio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.municipio_idmunicipio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.municipio_idmunicipio_seq OWNER TO postgres;

--
-- Name: municipio_idmunicipio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.municipio_idmunicipio_seq OWNED BY public.municipio.idmunicipio;


--
-- Name: paciente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paciente (
    curp character varying(15) NOT NULL,
    nombre character varying(50) NOT NULL,
    edad integer NOT NULL,
    dir character varying(250) NOT NULL,
    tel integer NOT NULL,
    idestado integer,
    idmunicipio integer
);


ALTER TABLE public.paciente OWNER TO postgres;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    idusuario integer NOT NULL,
    correo character varying(45) NOT NULL,
    password character varying(45) NOT NULL,
    nombreusuario character varying(30) NOT NULL,
    paterno character varying(70) NOT NULL,
    materno character varying(70) NOT NULL,
    nombre character varying(45) NOT NULL,
    foto bytea NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_idusuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_idusuario_seq OWNER TO postgres;

--
-- Name: usuario_idusuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_idusuario_seq OWNED BY public.usuario.idusuario;


--
-- Name: causahosp idcausahosp; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.causahosp ALTER COLUMN idcausahosp SET DEFAULT nextval('public.causahosp_idcausahosp_seq'::regclass);


--
-- Name: edocuarto idedocuarto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edocuarto ALTER COLUMN idedocuarto SET DEFAULT nextval('public.edocuarto_idedocuarto_seq'::regclass);


--
-- Name: estado idestado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado ALTER COLUMN idestado SET DEFAULT nextval('public.estado_idestado_seq'::regclass);


--
-- Name: historial idhistorial; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial ALTER COLUMN idhistorial SET DEFAULT nextval('public.historial_idhistorial_seq'::regclass);


--
-- Name: municipio idmunicipio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio ALTER COLUMN idmunicipio SET DEFAULT nextval('public.municipio_idmunicipio_seq'::regclass);


--
-- Name: usuario idusuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN idusuario SET DEFAULT nextval('public.usuario_idusuario_seq'::regclass);


--
-- Data for Name: causahosp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.causahosp (idcausahosp, tratamiento, observaciones) FROM stdin;
1	Cirugia	Ninguna
2	Accidente	Fallecio
3	Infarto	Atendido
4	Dialisis	Ninguno
5	H1N1	Ninguno
6	Gastritis	Ninguno
7	Pancreatitis	Ninguno
8	Epilepsia	Ninguno
9	Diabetes	Ninguno
10	SIDA	Ninguno
11	Cancer	Ninguno
12	Asma	Ninguno
13	Pulmonia	Ninguno
14	Rinofaringitis	Ninguno
15	Amigdalitis	Ninguno
16	Cirrosis	Ninguno
17	Hernia	Ninguno
18	Colecistitis	Ninguno
19	Lodo biliar	Ninguno
20	insuficiencia cardiaca	Ninguno
21	estenosis aortica	Ninguno
22	otitis externa	Ninguno
23	cataratas	Ninguno
24	conjuntivitis	Ninguno
25	glaucoma	Ninguno
\.


--
-- Data for Name: cuarto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuarto (nocuarto, idedocuarto) FROM stdin;
107	1
108	1
119	1
120	1
201	1
202	1
213	1
214	1
225	1
226	1
307	1
308	1
319	1
320	1
401	1
402	1
413	1
414	1
425	1
426	1
512	1
513	1
517	1
521	1
522	1
525	1
528	1
529	1
530	1
531	1
533	1
535	1
109	2
110	2
121	2
122	2
203	2
204	2
215	2
216	2
227	2
228	2
309	2
310	2
321	2
322	2
403	2
404	2
415	2
416	2
427	2
428	2
514	2
518	2
519	2
523	2
524	2
111	3
112	3
123	3
124	3
205	3
206	3
217	3
218	3
229	3
230	3
311	3
312	3
323	3
324	3
405	3
406	3
417	3
418	3
429	3
430	3
516	3
520	3
526	3
527	3
532	3
101	4
102	4
113	4
114	4
125	4
126	4
207	4
208	4
219	4
220	4
301	4
302	4
313	4
314	4
325	4
326	4
407	4
408	4
419	4
420	4
103	5
104	5
115	5
116	5
127	5
128	5
209	5
210	5
221	5
222	5
303	5
304	5
315	5
316	5
327	5
328	5
409	5
410	5
421	5
422	5
105	6
106	6
117	6
118	6
129	6
130	6
211	6
212	6
223	6
224	6
305	6
306	6
317	6
318	6
329	6
330	6
411	6
412	6
423	6
424	6
\.


--
-- Data for Name: edocuarto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.edocuarto (idedocuarto, edocuarto) FROM stdin;
1	Ocupado
2	Limpio
3	Sucio
4	Vacio
5	Remodelacion
6	En Mantenimiento
\.


--
-- Data for Name: especialidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.especialidad (idesp, descesp) FROM stdin;
AN	Anestesiologo
CR	Cardiologo
CV	Cirugano Vascular
DER	Dermatologo
GN	Ginecologo
GS	Gastroenterologo
NR	Neurologo
OC	Oncologo
OD	Odontologo
OF	Oftalmologo
OT	Otorrinolaringologo
PD	Pediatra
PS	Psicologo
PST	Psiquiatra
RD	Radiologo
UG	Urgenciologo
UR	Urologo
\.


--
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estado (idestado, clave, nombre, abrev, activo) FROM stdin;
1	01	Aguascalientes	Ags.	1
2	02	Baja California	BC	1
3	03	Baja California Sur	BCS	1
4	04	Campeche	Camp.	1
5	05	Coahuila de Zaragoza	Coah.	1
6	06	Colima	Col.	1
7	07	Chiapas	Chis.	1
8	08	Chihuahua	Chih.	1
9	09	Ciudad de México	CDMX	1
10	10	Durango	Dgo.	1
11	11	Guanajuato	Gto.	1
12	12	Guerrero	Gro.	1
13	13	Hidalgo	Hgo.	1
14	14	Jalisco	Jal.	1
15	15	México	Mex.	1
16	16	Michoacán de Ocampo	Mich.	1
17	17	Morelos	Mor.	1
18	18	Nayarit	Nay.	1
19	19	Nuevo León	NL	1
20	20	Oaxaca	Oax.	1
21	21	Puebla	Pue.	1
22	22	Querétaro	Qro.	1
23	23	Quintana Roo	Q. Roo	1
24	24	San Luis Potosí	SLP	1
25	25	Sinaloa	Sin.	1
26	26	Sonora	Son.	1
27	27	Tabasco	Tab.	1
28	28	Tamaulipas	Tamps.	1
29	29	Tlaxcala	Tlax.	1
30	30	Veracruz de Ignacio de la Llave	Ver.	1
31	31	Yucatán	Yuc.	1
32	32	Zacatecas	Zac.	1
\.


--
-- Data for Name: historial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historial (idhistorial, cedula, curp, fechaingreso, fechaalta, idcausahosp, nocama, nocuarto) FROM stdin;
1	1210	AGRK800719	2003-03-19	2003-03-20	1	22	512
2	22554	LEEE730315	2003-03-20	2003-03-28	2	23	512
3	23555	GOPR740604	2003-03-25	2003-03-30	1	24	513
4	31232	MESR731128	2003-03-26	2003-03-27	2	25	514
5	41258	PABS791225	2003-03-26	2003-04-01	1	23	512
6	96510	MALD770810	2003-03-27	2003-04-01	1	22	512
7	88743	PABS791225	2003-03-28	2003-04-05	2	50	517
8	89784	ORVE790526	2003-03-29	2003-04-01	1	51	517
9	1210	ABHA911215	2004-01-15	2004-01-17	1	1	101
10	4567	ACEC890217	2004-03-16	2004-03-19	2	2	102
11	4568	ACNC880920	2004-04-24	2004-04-27	3	3	103
12	4569	AGRK800719	2004-05-11	2004-05-18	4	4	104
13	4570	AMAU890611	2004-02-08	2004-02-12	5	5	105
14	4571	AMDI890318	2004-06-29	2004-06-30	6	6	106
15	4572	APJC880522	2005-07-06	2005-07-09	7	7	107
16	4573	AZHE900116	2005-08-03	2005-08-04	8	8	108
17	4574	BBJG881021	2004-01-15	2004-01-18	9	9	109
18	4575	BLAB891122	2006-08-20	2006-08-22	10	10	110
19	4576	BRAE880419	2007-03-14	2007-03-20	11	11	111
20	4577	CAGA901223	2004-04-24	2004-04-28	12	12	112
21	4578	CHJJ900321	2009-06-22	2009-06-25	13	13	113
22	4579	CHPN890520	2005-08-03	2005-08-13	14	14	114
23	4580	COCE900621	2004-03-16	2004-03-19	15	15	115
24	4581	CRCP910124	2009-09-10	2009-09-14	16	16	116
25	4582	DGYO910722	2004-05-11	2004-05-19	17	17	117
26	4583	DHCH911102	2009-11-17	2009-11-21	18	18	118
27	4584	FALI911025	2005-07-06	2005-07-12	19	19	119
28	4585	FEBJ920101	2010-02-09	2010-02-13	20	20	120
29	4586	FMFE920225	2009-12-24	2009-12-26	21	21	121
30	4587	FRBL920221	2004-02-08	2004-02-14	22	26	122
31	4588	FRRA920924	2007-12-11	2007-12-16	23	27	123
32	4589	FSAY910823	2004-02-08	2004-02-11	24	28	124
33	4590	GAHA900528	2007-12-11	2007-12-15	25	29	125
34	4591	GARO750423	2010-02-09	2010-02-13	1	30	126
35	4592	GGDJ891227	2009-06-22	2009-06-28	2	31	127
36	4593	GHJA910326	2008-07-15	2008-07-20	3	32	128
37	4594	GMAL901126	2009-09-10	2009-09-18	4	33	129
38	4595	GOMF880128	2004-01-15	2004-01-18	5	34	130
39	4596	GOMM880229	2004-05-11	2004-05-14	6	35	201
40	4597	GOPR740604	2008-07-15	2008-07-19	7	36	202
41	4598	GORF910427	2004-03-16	2004-03-19	8	37	203
42	4599	GUOE890629	2009-12-24	2009-12-26	9	38	204
43	22554	HCJC910312	2010-04-15	2010-04-19	10	39	205
44	23555	HGKA880730	2010-04-15	2010-04-20	11	40	206
45	31232	HLJR900604	2004-05-11	2004-05-16	12	41	207
46	41258	HMLC880831	2010-04-15	2010-04-19	13	42	208
47	56854	HSAE890330	2008-07-15	2008-07-19	14	43	209
48	88551	JSJD890901	2009-12-24	2009-12-30	15	44	210
49	88743	LARM901002	2004-04-24	2004-04-26	16	45	211
50	89784	LCJA890618	2010-04-02	2010-04-12	17	46	212
51	89800	LEEE730315	2010-02-09	2010-02-11	18	47	213
52	91144	LOPM760606	2009-11-17	2009-11-21	19	48	214
53	96510	LRJR900431	2007-12-11	2007-12-19	20	49	215
54	1210	MACI790901	2010-01-17	2010-01-20	21	52	216
55	4567	MACO920317	2009-09-10	2009-09-15	22	53	217
56	4568	MAFE771111	2004-03-16	2004-03-19	23	54	218
57	4569	MAGL881030	2009-12-24	2009-12-26	24	55	219
58	4570	MALD770810	2009-11-17	2009-11-20	25	56	220
59	4571	MALN880818	2007-03-14	2007-03-18	1	57	221
60	4572	MAMI891201	2004-01-15	2004-01-17	2	58	222
61	4573	MAMM910501	2008-07-15	2008-07-19	3	59	223
62	4574	MCGI910122	2007-12-11	2007-12-18	4	60	224
63	4575	MESR731128	2004-05-11	2004-05-13	5	61	225
64	4576	MJJA911102	2010-04-15	2010-04-20	6	62	226
65	4577	MLMG920602	2010-01-17	2010-01-19	7	63	227
66	4578	MOBJ920703	2006-08-20	2006-08-23	8	64	228
67	4579	MOJA900219	2004-06-29	2004-06-30	9	65	229
68	4580	MOMA910804	2010-04-02	2010-04-10	10	66	230
69	4581	MRME921203	2004-03-16	2004-03-19	11	67	301
70	4582	MUHE921010	2008-05-05	2008-05-10	12	68	302
71	4583	NICK920104	2004-02-08	2004-02-12	13	69	303
72	4584	ODJA910205	2009-12-24	2009-12-25	14	70	304
73	4585	OPVI910805	2004-03-16	2004-03-17	15	71	305
74	4586	ORGA900306	2010-02-14	2010-02-19	16	72	306
75	4587	ORRD900905	2009-11-17	2009-11-18	17	73	307
76	4588	ORVE790526	2009-02-13	2009-02-15	18	74	308
77	4589	OSMS900721	2004-02-08	2004-02-11	19	75	309
78	4590	PAAA891006	2010-03-11	2010-03-12	20	76	310
79	4591	PABS791225	2010-02-14	2010-02-19	21	77	311
80	4592	PAPN751201	2009-06-04	2009-06-10	22	78	312
81	4593	PBFX881107	2010-04-02	2010-04-08	23	79	313
82	4594	PCMA890109	2008-05-05	2008-05-08	24	80	314
83	4595	PENR881208	2004-01-15	2004-01-17	25	81	315
84	4596	PEPN740714	2010-02-09	2010-02-11	1	82	316
85	4597	PGAB890411	2009-02-13	2009-02-16	2	83	317
86	4598	PGRI880520	2009-12-30	2010-01-01	3	84	318
87	4599	QSSD900210	2010-03-11	2010-03-17	4	85	319
88	22554	QUOG890407	2009-06-04	2009-06-09	5	86	320
89	23555	RARS880908	2010-02-14	2010-02-19	6	87	321
90	31232	RHJA880508	2009-02-13	2009-02-17	7	88	322
91	41258	ROBJ780102	2007-03-14	2007-03-19	8	89	323
92	56854	ROEG770112	2010-04-02	2010-04-05	9	90	324
93	88551	ROMJ890221	2008-09-21	2008-09-23	10	91	325
94	88743	ROOJ880609	2010-01-17	2010-01-19	11	92	326
95	89784	RPCA910311	2008-09-21	2008-09-24	12	93	327
96	89800	SAED910808	2008-05-05	2008-05-10	13	94	328
97	91144	SOBA890710	2005-08-03	2005-08-07	14	95	329
98	96510	SOLJ900715	2010-04-15	2010-04-17	15	96	330
99	1210	SPOC900811	2009-06-04	2009-06-08	16	97	401
100	4567	SPUA920413	2009-12-30	2009-12-31	17	98	402
101	4568	SPVA920506	2010-02-09	2010-02-12	18	99	403
102	4569	SRGR920513	2004-01-15	2004-01-18	19	100	404
103	4570	SSJL910614	2009-12-30	2009-12-31	20	101	405
104	4571	SVLE920412	2010-04-15	2010-04-18	21	102	406
105	4572	SVOE900815	2010-04-02	2010-04-07	22	103	407
106	4573	VECR900716	2007-03-14	2007-03-17	23	104	408
107	4574	VELF890818	2008-05-05	2008-05-09	24	105	409
108	4575	VFJA910611	2004-03-16	2004-03-18	25	106	410
109	4576	VGKM890816	2009-12-30	2009-12-31	1	107	411
110	4577	VHGD910912	2006-08-20	2006-08-26	2	108	412
111	4578	VJMA921013	2009-12-30	2010-01-02	3	109	413
112	4579	VSDI880917	2004-01-15	2004-01-18	4	110	414
113	4580	VSJA921114	2010-03-11	2010-03-14	5	111	415
114	4581	ZAJC881018	2008-09-21	2008-09-24	6	112	416
\.


--
-- Data for Name: medico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medico (cedula, nombre, dir, idesp, tel) FROM stdin;
1210	ISLAS LOPEZ DORIBEL	Av. Universidad 210	GN	7110258
4567	ARROYO FLORES CARLOS DAMIAN	conocida	AN	5544233
4568	BAUTISTA SALINAS ANA LUZ	conocida	CR	5544233
4569	BOTELLO BAÑUELOS IVONNE	conocida	CV	5544233
4570	CALDERON LOPEZ ABRAHAM	conocida	DER	5544233
4571	CEDILLO CHAVEZ ARALI	conocida	GN	5544233
4572	CORONA AYALA DAVID FERNANDO	conocida	GS	5544233
4573	CORTES LANDEROS OMAR	conocida	NR	5544233
4574	DURAN BECERRIL SAMUEL	conocida	OC	5544233
4575	FERNANDEZ CRUZ JESUS	conocida	OD	5544233
4576	HERNANDEZ GONZALEZ ZAIRA LILIANA	conocida	OF	5544233
4577	JUAREZ HIPOLITO JUAN HUMBERTO	conocida	OT	5544233
4578	LOPEZ ALDERETE RUTH HEIDI	conocida	PD	5544233
4579	MANOATL LOPEZ EDGAR	conocida	PS	5544233
4580	MARIANO RAFAEL ADRIAN	conocida	PST	5544233
4581	MIGUEL ANTONIO LUIS	conocida	RD	5544233
4582	MIRANDA SANCHEZ DANIELA	conocida	UG	5544233
4583	MORALES BAUTISTA DONATO DAVID	conocida	UR	5544233
4584	MUÑOZ GOMEZ EDUARDO	conocida	AN	5544233
4585	ONTIVEROS ISLAS VANGELI	conocida	CR	5544233
4586	ORTEGA GONZALEZ JAIME VALENTIN	conocida	CV	5544233
4587	ORTIZ LOPEZ FERNANDO	conocida	DER	5544233
4588	PALAFOX MARTINEZ ARMANDO	conocida	GN	5544233
4589	PAREDES TORRES ARIANA	conocida	GS	5544233
4590	PERDOMO VERGARA BENITO	conocida	NR	5544233
4591	QUIROZ JIMENEZ SAMANTA LIZETH	conocida	OC	5544233
4592	RAMIREZ TORRES DAVID YAEL	conocida	OD	5544233
4593	RODRIGUEZ SORIANO JOSE EDUARDO	conocida	OF	5544233
4594	SALAZAR ACOSTA JESUS JAVIER	conocida	OT	5544233
4595	SANCHEZ FRAGA ROLANDO	conocida	PD	5544233
4596	SOSA HERNANDEZ VICTOR ADRIAN	conocida	PS	5544233
4597	TOLEDANO AGUAYO EDUARDO	conocida	PST	5544233
4598	VARELA ROSAS JORGE	conocida	RD	5544233
4599	VELEZ ZAMORA MIGUEL	conocida	UG	5544233
22554	MENDOZA SANCHEZ CRISPIN	Batallon de San Blas 55	CR	7154448
23555	CASTANIEDA HERNANDEZ JORGE	Av. Alamo Dorado 111	UR	7142125
31232	ARAGON CASTANIEDA ALEJANDRO	Real de Pachuca 336	PD	7133558
41258	LOPEZ GARCIA ANA LAURA	Blvd. Rojo Gómez 58	OF	7184522
56854	MARTINEZ MELCHOR MIGUEL	Av. Nuevo Pachuca 478	GS	7120021
88551	VARGAS MENDOZA CESAR	5 de Mayo 477	AN	7196665
88743	LOPEZ MUNIOZ VERONICA	Hda. De Gavia 998	NR	7198755
89784	MARTINEZ LAGOS ISMAEL	Calle 16 de Septiembre 47	CR	7188987
89800	PADILLA LUGO LILIANA	Av. Los Cisnes 64	GN	7188440
91144	MONTER GARCIA EDGAR	Puerto Alvarado 14	NR	7144450
96510	ESTRADA AGUILAR FERNANDO	Puerto Papantla 844	CR	7150014
\.


--
-- Data for Name: municipio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.municipio (idmunicipio, idestado, clave, nombre, activo) FROM stdin;
1	1	001	Aguascalientes	1
2	1	002	Asientos	1
3	1	003	Calvillo	1
4	1	004	Cosío	1
5	1	005	Jesús María	1
6	1	006	Pabellón de Arteaga	1
7	1	007	Rincón de Romos	1
8	1	008	San José de Gracia	1
9	1	009	Tepezala	1
10	1	010	El Llano	1
11	1	011	San Francisco de los Romo	1
12	2	001	Ensenada	1
13	2	002	Mexicali	1
14	2	003	Tecate	1
15	2	004	Tijuana	1
16	2	005	Playas de Rosarito	1
17	3	001	Comondú	1
18	3	002	Mulegé	1
19	3	003	La Paz	1
20	3	008	Los Cabos	1
21	3	009	Loreto	1
22	4	001	Calkiní	1
23	4	002	Campeche	1
24	4	003	Carmen	1
25	4	004	Champotón	1
26	4	005	Hecelchakán	1
27	4	006	Hopelchén	1
28	4	007	Palizada	1
29	4	008	Tenabo	1
30	4	009	Escárcega	1
31	4	010	Calakmul	1
32	4	011	Candelaria	1
33	5	001	Abasolo	1
34	5	002	Acuña	1
35	5	003	Allende	1
36	5	004	Arteaga	1
37	5	005	Candela	1
38	5	006	Castaños	1
39	5	007	Cuatro Ciénegas	1
40	5	008	Escobedo	1
41	5	009	Francisco I. Madero	1
42	5	010	Frontera	1
43	5	011	General Cepeda	1
44	5	012	Guerrero	1
45	5	013	Hidalgo	1
46	5	014	Jiménez	1
47	5	015	Juárez	1
48	5	016	Lamadrid	1
49	5	017	Matamoros	1
50	5	018	Monclova	1
51	5	019	Morelos	1
52	5	020	Múzquiz	1
53	5	021	Nadadores	1
54	5	022	Nava	1
55	5	023	Ocampo	1
56	5	024	Parras	1
57	5	025	Piedras Negras	1
58	5	026	Progreso	1
59	5	027	Ramos Arizpe	1
60	5	028	Sabinas	1
61	5	029	Sacramento	1
62	5	030	Saltillo	1
63	5	031	San Buenaventura	1
64	5	032	San Juan de Sabinas	1
65	5	033	San Pedro	1
66	5	034	Sierra Mojada	1
67	5	035	Torreón	1
68	5	036	Viesca	1
69	5	037	Villa Unión	1
70	5	038	Zaragoza	1
71	6	001	Armería	1
72	6	002	Colima	1
73	6	003	Comala	1
74	6	004	Coquimatlán	1
75	6	005	Cuauhtémoc	1
76	6	006	Ixtlahuacán	1
77	6	007	Manzanillo	1
78	6	008	Minatitlán	1
79	6	009	Tecomán	1
80	6	010	Villa de Álvarez	1
81	7	001	Acacoyagua	1
82	7	002	Acala	1
83	7	003	Acapetahua	1
84	7	004	Altamirano	1
85	7	005	Amatán	1
86	7	006	Amatenango de la Frontera	1
87	7	007	Amatenango del Valle	1
88	7	008	Angel Albino Corzo	1
89	7	009	Arriaga	1
90	7	010	Bejucal de Ocampo	1
91	7	011	Bella Vista	1
92	7	012	Berriozábal	1
93	7	013	Bochil	1
94	7	014	El Bosque	1
95	7	015	Cacahoatán	1
96	7	016	Catazajá	1
97	7	017	Cintalapa	1
98	7	018	Coapilla	1
99	7	019	Comitán de Domínguez	1
100	7	020	La Concordia	1
101	7	021	Copainalá	1
102	7	022	Chalchihuitán	1
103	7	023	Chamula	1
104	7	024	Chanal	1
105	7	025	Chapultenango	1
106	7	026	Chenalhó	1
107	7	027	Chiapa de Corzo	1
108	7	028	Chiapilla	1
109	7	029	Chicoasén	1
110	7	030	Chicomuselo	1
111	7	031	Chilón	1
112	7	032	Escuintla	1
113	7	033	Francisco León	1
114	7	034	Frontera Comalapa	1
115	7	035	Frontera Hidalgo	1
116	7	036	La Grandeza	1
117	7	037	Huehuetán	1
118	7	038	Huixtán	1
119	7	039	Huitiupán	1
120	7	040	Huixtla	1
121	7	041	La Independencia	1
122	7	042	Ixhuatán	1
123	7	043	Ixtacomitán	1
124	7	044	Ixtapa	1
125	7	045	Ixtapangajoya	1
126	7	046	Jiquipilas	1
127	7	047	Jitotol	1
128	7	048	Juárez	1
129	7	049	Larráinzar	1
130	7	050	La Libertad	1
131	7	051	Mapastepec	1
132	7	052	Las Margaritas	1
133	7	053	Mazapa de Madero	1
134	7	054	Mazatán	1
135	7	055	Metapa	1
136	7	056	Mitontic	1
137	7	057	Motozintla	1
138	7	058	Nicolás Ruíz	1
139	7	059	Ocosingo	1
140	7	060	Ocotepec	1
141	7	061	Ocozocoautla de Espinosa	1
142	7	062	Ostuacán	1
143	7	063	Osumacinta	1
144	7	064	Oxchuc	1
145	7	065	Palenque	1
146	7	066	Pantelhó	1
147	7	067	Pantepec	1
148	7	068	Pichucalco	1
149	7	069	Pijijiapan	1
150	7	070	El Porvenir	1
151	7	071	Villa Comaltitlán	1
152	7	072	Pueblo Nuevo Solistahuacán	1
153	7	073	Rayón	1
154	7	074	Reforma	1
155	7	075	Las Rosas	1
156	7	076	Sabanilla	1
157	7	077	Salto de Agua	1
158	7	078	San Cristóbal de las Casas	1
159	7	079	San Fernando	1
160	7	080	Siltepec	1
161	7	081	Simojovel	1
162	7	082	Sitalá	1
163	7	083	Socoltenango	1
164	7	084	Solosuchiapa	1
165	7	085	Soyaló	1
166	7	086	Suchiapa	1
167	7	087	Suchiate	1
168	7	088	Sunuapa	1
169	7	089	Tapachula	1
170	7	090	Tapalapa	1
171	7	091	Tapilula	1
172	7	092	Tecpatán	1
173	7	093	Tenejapa	1
174	7	094	Teopisca	1
175	7	096	Tila	1
176	7	097	Tonalá	1
177	7	098	Totolapa	1
178	7	099	La Trinitaria	1
179	7	100	Tumbalá	1
180	7	101	Tuxtla Gutiérrez	1
181	7	102	Tuxtla Chico	1
182	7	103	Tuzantán	1
183	7	104	Tzimol	1
184	7	105	Unión Juárez	1
185	7	106	Venustiano Carranza	1
186	7	107	Villa Corzo	1
187	7	108	Villaflores	1
188	7	109	Yajalón	1
189	7	110	San Lucas	1
190	7	111	Zinacantán	1
191	7	112	San Juan Cancuc	1
192	7	113	Aldama	1
193	7	114	Benemérito de las Américas	1
194	7	115	Maravilla Tenejapa	1
195	7	116	Marqués de Comillas	1
196	7	117	Montecristo de Guerrero	1
197	7	118	San Andrés Duraznal	1
198	7	119	Santiago el Pinar	1
199	7	120	Capitán Luis Ángel Vidal	1
200	7	121	Rincón Chamula San Pedro	1
201	7	122	El Parral	1
202	7	123	Emiliano Zapata	1
203	7	124	Mezcalapa	1
204	8	001	Ahumada	1
205	8	002	Aldama	1
206	8	003	Allende	1
207	8	004	Aquiles Serdán	1
208	8	005	Ascensión	1
209	8	006	Bachíniva	1
210	8	007	Balleza	1
211	8	008	Batopilas de Manuel Gómez Morín	1
212	8	009	Bocoyna	1
213	8	010	Buenaventura	1
214	8	011	Camargo	1
215	8	012	Carichí	1
216	8	013	Casas Grandes	1
217	8	014	Coronado	1
218	8	015	Coyame del Sotol	1
219	8	016	La Cruz	1
220	8	017	Cuauhtémoc	1
221	8	018	Cusihuiriachi	1
222	8	019	Chihuahua	1
223	8	020	Chínipas	1
224	8	021	Delicias	1
225	8	022	Dr. Belisario Domínguez	1
226	8	023	Galeana	1
227	8	024	Santa Isabel	1
228	8	025	Gómez Farías	1
229	8	026	Gran Morelos	1
230	8	027	Guachochi	1
231	8	028	Guadalupe	1
232	8	029	Guadalupe y Calvo	1
233	8	030	Guazapares	1
234	8	031	Guerrero	1
235	8	032	Hidalgo del Parral	1
236	8	033	Huejotitán	1
237	8	034	Ignacio Zaragoza	1
238	8	035	Janos	1
239	8	036	Jiménez	1
240	8	037	Juárez	1
241	8	038	Julimes	1
242	8	039	López	1
243	8	040	Madera	1
244	8	041	Maguarichi	1
245	8	042	Manuel Benavides	1
246	8	043	Matachí	1
247	8	044	Matamoros	1
248	8	045	Meoqui	1
249	8	046	Morelos	1
250	8	047	Moris	1
251	8	048	Namiquipa	1
252	8	049	Nonoava	1
253	8	050	Nuevo Casas Grandes	1
254	8	051	Ocampo	1
255	8	052	Ojinaga	1
256	8	053	Praxedis G. Guerrero	1
257	8	054	Riva Palacio	1
258	8	055	Rosales	1
259	8	056	Rosario	1
260	8	057	San Francisco de Borja	1
261	8	058	San Francisco de Conchos	1
262	8	059	San Francisco del Oro	1
263	8	060	Santa Bárbara	1
264	8	061	Satevó	1
265	8	062	Saucillo	1
266	8	063	Temósachic	1
267	8	064	El Tule	1
268	8	065	Urique	1
269	8	066	Uruachi	1
270	8	067	Valle de Zaragoza	1
271	9	002	Azcapotzalco	1
272	9	003	Coyoacán	1
273	9	004	Cuajimalpa de Morelos	1
274	9	005	Gustavo A. Madero	1
275	9	006	Iztacalco	1
276	9	007	Iztapalapa	1
277	9	008	La Magdalena Contreras	1
278	9	009	Milpa Alta	1
279	9	010	Álvaro Obregón	1
280	9	011	Tláhuac	1
281	9	012	Tlalpan	1
282	9	013	Xochimilco	1
283	9	014	Benito Juárez	1
284	9	015	Cuauhtémoc	1
285	9	016	Miguel Hidalgo	1
286	9	017	Venustiano Carranza	1
287	10	001	Canatlán	1
288	10	002	Canelas	1
289	10	003	Coneto de Comonfort	1
290	10	004	Cuencamé	1
291	10	005	Durango	1
292	10	006	General Simón Bolívar	1
293	10	007	Gómez Palacio	1
294	10	008	Guadalupe Victoria	1
295	10	009	Guanaceví	1
296	10	010	Hidalgo	1
297	10	011	Indé	1
298	10	012	Lerdo	1
299	10	013	Mapimí	1
300	10	014	Mezquital	1
301	10	015	Nazas	1
302	10	016	Nombre de Dios	1
303	10	017	Ocampo	1
304	10	018	El Oro	1
305	10	019	Otáez	1
306	10	020	Pánuco de Coronado	1
307	10	021	Peñón Blanco	1
308	10	022	Poanas	1
309	10	023	Pueblo Nuevo	1
310	10	024	Rodeo	1
311	10	025	San Bernardo	1
312	10	026	San Dimas	1
313	10	027	San Juan de Guadalupe	1
314	10	028	San Juan del Río	1
315	10	029	San Luis del Cordero	1
316	10	030	San Pedro del Gallo	1
317	10	031	Santa Clara	1
318	10	032	Santiago Papasquiaro	1
319	10	033	Súchil	1
320	10	034	Tamazula	1
321	10	035	Tepehuanes	1
322	10	036	Tlahualilo	1
323	10	037	Topia	1
324	10	038	Vicente Guerrero	1
325	10	039	Nuevo Ideal	1
326	11	001	Abasolo	1
327	11	002	Acámbaro	1
328	11	003	San Miguel de Allende	1
329	11	004	Apaseo el Alto	1
330	11	005	Apaseo el Grande	1
331	11	006	Atarjea	1
332	11	007	Celaya	1
333	11	008	Manuel Doblado	1
334	11	009	Comonfort	1
335	11	010	Coroneo	1
336	11	011	Cortazar	1
337	11	012	Cuerámaro	1
338	11	013	Doctor Mora	1
339	11	014	Dolores Hidalgo Cuna de la Independencia Nacional	1
340	11	015	Guanajuato	1
341	11	016	Huanímaro	1
342	11	017	Irapuato	1
343	11	018	Jaral del Progreso	1
344	11	019	Jerécuaro	1
345	11	020	León	1
346	11	021	Moroleón	1
347	11	022	Ocampo	1
348	11	023	Pénjamo	1
349	11	024	Pueblo Nuevo	1
350	11	025	Purísima del Rincón	1
351	11	026	Romita	1
352	11	027	Salamanca	1
353	11	028	Salvatierra	1
354	11	029	San Diego de la Unión	1
355	11	030	San Felipe	1
356	11	031	San Francisco del Rincón	1
357	11	032	San José Iturbide	1
358	11	033	San Luis de la Paz	1
359	11	034	Santa Catarina	1
360	11	035	Santa Cruz de Juventino Rosas	1
361	11	036	Santiago Maravatío	1
362	11	037	Silao de la Victoria	1
363	11	038	Tarandacuao	1
364	11	039	Tarimoro	1
365	11	040	Tierra Blanca	1
366	11	041	Uriangato	1
367	11	042	Valle de Santiago	1
368	11	043	Victoria	1
369	11	044	Villagrán	1
370	11	045	Xichú	1
371	11	046	Yuriria	1
372	12	001	Acapulco de Juárez	1
373	12	002	Ahuacuotzingo	1
374	12	003	Ajuchitlán del Progreso	1
375	12	004	Alcozauca de Guerrero	1
376	12	005	Alpoyeca	1
377	12	006	Apaxtla	1
378	12	007	Arcelia	1
379	12	008	Atenango del Río	1
380	12	009	Atlamajalcingo del Monte	1
381	12	010	Atlixtac	1
382	12	011	Atoyac de Álvarez	1
383	12	012	Ayutla de los Libres	1
384	12	013	Azoyú	1
385	12	014	Benito Juárez	1
386	12	015	Buenavista de Cuéllar	1
387	12	016	Coahuayutla de José María Izazaga	1
388	12	017	Cocula	1
389	12	018	Copala	1
390	12	019	Copalillo	1
391	12	020	Copanatoyac	1
392	12	021	Coyuca de Benítez	1
393	12	022	Coyuca de Catalán	1
394	12	023	Cuajinicuilapa	1
395	12	024	Cualác	1
396	12	025	Cuautepec	1
397	12	026	Cuetzala del Progreso	1
398	12	027	Cutzamala de Pinzón	1
399	12	028	Chilapa de Álvarez	1
400	12	029	Chilpancingo de los Bravo	1
401	12	030	Florencio Villarreal	1
402	12	031	General Canuto A. Neri	1
403	12	032	General Heliodoro Castillo	1
404	12	033	Huamuxtitlán	1
405	12	034	Huitzuco de los Figueroa	1
406	12	035	Iguala de la Independencia	1
407	12	036	Igualapa	1
408	12	037	Ixcateopan de Cuauhtémoc	1
409	12	038	Zihuatanejo de Azueta	1
410	12	039	Juan R. Escudero	1
411	12	040	Leonardo Bravo	1
412	12	041	Malinaltepec	1
413	12	042	Mártir de Cuilapan	1
414	12	043	Metlatónoc	1
415	12	044	Mochitlán	1
416	12	045	Olinalá	1
417	12	046	Ometepec	1
418	12	047	Pedro Ascencio Alquisiras	1
419	12	048	Petatlán	1
420	12	049	Pilcaya	1
421	12	050	Pungarabato	1
422	12	051	Quechultenango	1
423	12	052	San Luis Acatlán	1
424	12	053	San Marcos	1
425	12	054	San Miguel Totolapan	1
426	12	055	Taxco de Alarcón	1
427	12	056	Tecoanapa	1
428	12	057	Técpan de Galeana	1
429	12	058	Teloloapan	1
430	12	059	Tepecoacuilco de Trujano	1
431	12	060	Tetipac	1
432	12	061	Tixtla de Guerrero	1
433	12	062	Tlacoachistlahuaca	1
434	12	063	Tlacoapa	1
435	12	064	Tlalchapa	1
436	12	065	Tlalixtaquilla de Maldonado	1
437	12	066	Tlapa de Comonfort	1
438	12	067	Tlapehuala	1
439	12	068	La Unión de Isidoro Montes de Oca	1
440	12	069	Xalpatláhuac	1
441	12	070	Xochihuehuetlán	1
442	12	071	Xochistlahuaca	1
443	12	072	Zapotitlán Tablas	1
444	12	073	Zirándaro	1
445	12	074	Zitlala	1
446	12	075	Eduardo Neri	1
447	12	076	Acatepec	1
448	12	077	Marquelia	1
449	12	078	Cochoapa el Grande	1
450	12	079	José Joaquín de Herrera	1
451	12	080	Juchitán	1
452	12	081	Iliatenco	1
453	13	001	Acatlán	1
454	13	002	Acaxochitlán	1
455	13	003	Actopan	1
456	13	004	Agua Blanca de Iturbide	1
457	13	005	Ajacuba	1
458	13	006	Alfajayucan	1
459	13	007	Almoloya	1
460	13	008	Apan	1
461	13	009	El Arenal	1
462	13	010	Atitalaquia	1
463	13	011	Atlapexco	1
464	13	012	Atotonilco el Grande	1
465	13	013	Atotonilco de Tula	1
466	13	014	Calnali	1
467	13	015	Cardonal	1
468	13	016	Cuautepec de Hinojosa	1
469	13	017	Chapantongo	1
470	13	018	Chapulhuacán	1
471	13	019	Chilcuautla	1
472	13	020	Eloxochitlán	1
473	13	021	Emiliano Zapata	1
474	13	022	Epazoyucan	1
475	13	023	Francisco I. Madero	1
476	13	024	Huasca de Ocampo	1
477	13	025	Huautla	1
478	13	026	Huazalingo	1
479	13	027	Huehuetla	1
480	13	028	Huejutla de Reyes	1
481	13	029	Huichapan	1
482	13	030	Ixmiquilpan	1
483	13	031	Jacala de Ledezma	1
484	13	032	Jaltocán	1
485	13	033	Juárez Hidalgo	1
486	13	034	Lolotla	1
487	13	035	Metepec	1
488	13	036	San Agustín Metzquititlán	1
489	13	037	Metztitlán	1
490	13	038	Mineral del Chico	1
491	13	039	Mineral del Monte	1
492	13	040	La Misión	1
493	13	041	Mixquiahuala de Juárez	1
494	13	042	Molango de Escamilla	1
495	13	043	Nicolás Flores	1
496	13	044	Nopala de Villagrán	1
497	13	045	Omitlán de Juárez	1
498	13	046	San Felipe Orizatlán	1
499	13	047	Pacula	1
500	13	048	Pachuca de Soto	1
501	13	049	Pisaflores	1
502	13	050	Progreso de Obregón	1
503	13	051	Mineral de la Reforma	1
504	13	052	San Agustín Tlaxiaca	1
505	13	053	San Bartolo Tutotepec	1
506	13	054	San Salvador	1
507	13	055	Santiago de Anaya	1
508	13	056	Santiago Tulantepec de Lugo Guerrero	1
509	13	057	Singuilucan	1
510	13	058	Tasquillo	1
511	13	059	Tecozautla	1
512	13	060	Tenango de Doria	1
513	13	061	Tepeapulco	1
514	13	062	Tepehuacán de Guerrero	1
515	13	063	Tepeji del Río de Ocampo	1
516	13	064	Tepetitlán	1
517	13	065	Tetepango	1
518	13	066	Villa de Tezontepec	1
519	13	067	Tezontepec de Aldama	1
520	13	068	Tianguistengo	1
521	13	069	Tizayuca	1
522	13	070	Tlahuelilpan	1
523	13	071	Tlahuiltepa	1
524	13	072	Tlanalapa	1
525	13	073	Tlanchinol	1
526	13	074	Tlaxcoapan	1
527	13	075	Tolcayuca	1
528	13	076	Tula de Allende	1
529	13	077	Tulancingo de Bravo	1
530	13	078	Xochiatipan	1
531	13	079	Xochicoatlán	1
532	13	080	Yahualica	1
533	13	081	Zacualtipán de Ángeles	1
534	13	082	Zapotlán de Juárez	1
535	13	083	Zempoala	1
536	13	084	Zimapán	1
537	14	001	Acatic	1
538	14	002	Acatlán de Juárez	1
539	14	003	Ahualulco de Mercado	1
540	14	004	Amacueca	1
541	14	005	Amatitán	1
542	14	006	Ameca	1
543	14	007	San Juanito de Escobedo	1
544	14	008	Arandas	1
545	14	009	El Arenal	1
546	14	010	Atemajac de Brizuela	1
547	14	011	Atengo	1
548	14	012	Atenguillo	1
549	14	013	Atotonilco el Alto	1
550	14	014	Atoyac	1
551	14	015	Autlán de Navarro	1
552	14	016	Ayotlán	1
553	14	017	Ayutla	1
554	14	018	La Barca	1
555	14	019	Bolaños	1
556	14	020	Cabo Corrientes	1
557	14	021	Casimiro Castillo	1
558	14	022	Cihuatlán	1
559	14	023	Zapotlán el Grande	1
560	14	024	Cocula	1
561	14	025	Colotlán	1
562	14	026	Concepción de Buenos Aires	1
563	14	027	Cuautitlán de García Barragán	1
564	14	028	Cuautla	1
565	14	029	Cuquío	1
566	14	030	Chapala	1
567	14	031	Chimaltitán	1
568	14	032	Chiquilistlán	1
569	14	033	Degollado	1
570	14	034	Ejutla	1
571	14	035	Encarnación de Díaz	1
572	14	036	Etzatlán	1
573	14	037	El Grullo	1
574	14	038	Guachinango	1
575	14	039	Guadalajara	1
576	14	040	Hostotipaquillo	1
577	14	041	Huejúcar	1
578	14	042	Huejuquilla el Alto	1
579	14	043	La Huerta	1
580	14	044	Ixtlahuacán de los Membrillos	1
581	14	045	Ixtlahuacán del Río	1
582	14	046	Jalostotitlán	1
583	14	047	Jamay	1
584	14	048	Jesús María	1
585	14	049	Jilotlán de los Dolores	1
586	14	050	Jocotepec	1
587	14	051	Juanacatlán	1
588	14	052	Juchitlán	1
589	14	053	Lagos de Moreno	1
590	14	054	El Limón	1
591	14	055	Magdalena	1
592	14	056	Santa María del Oro	1
593	14	057	La Manzanilla de la Paz	1
594	14	058	Mascota	1
595	14	059	Mazamitla	1
596	14	060	Mexticacán	1
597	14	061	Mezquitic	1
598	14	062	Mixtlán	1
599	14	063	Ocotlán	1
600	14	064	Ojuelos de Jalisco	1
601	14	065	Pihuamo	1
602	14	066	Poncitlán	1
603	14	067	Puerto Vallarta	1
604	14	068	Villa Purificación	1
605	14	069	Quitupan	1
606	14	070	El Salto	1
607	14	071	San Cristóbal de la Barranca	1
608	14	072	San Diego de Alejandría	1
609	14	073	San Juan de los Lagos	1
610	14	074	San Julián	1
611	14	075	San Marcos	1
612	14	076	San Martín de Bolaños	1
613	14	077	San Martín Hidalgo	1
614	14	078	San Miguel el Alto	1
615	14	079	Gómez Farías	1
616	14	080	San Sebastián del Oeste	1
617	14	081	Santa María de los Ángeles	1
618	14	082	Sayula	1
619	14	083	Tala	1
620	14	084	Talpa de Allende	1
621	14	085	Tamazula de Gordiano	1
622	14	086	Tapalpa	1
623	14	087	Tecalitlán	1
624	14	088	Tecolotlán	1
625	14	089	Techaluta de Montenegro	1
626	14	090	Tenamaxtlán	1
627	14	091	Teocaltiche	1
628	14	092	Teocuitatlán de Corona	1
629	14	093	Tepatitlán de Morelos	1
630	14	094	Tequila	1
631	14	095	Teuchitlán	1
632	14	096	Tizapán el Alto	1
633	14	097	Tlajomulco de Zúñiga	1
634	14	098	San Pedro Tlaquepaque	1
635	14	099	Tolimán	1
636	14	100	Tomatlán	1
637	14	101	Tonalá	1
638	14	102	Tonaya	1
639	14	103	Tonila	1
640	14	104	Totatiche	1
641	14	105	Tototlán	1
642	14	106	Tuxcacuesco	1
643	14	107	Tuxcueca	1
644	14	108	Tuxpan	1
645	14	109	Unión de San Antonio	1
646	14	110	Unión de Tula	1
647	14	111	Valle de Guadalupe	1
648	14	112	Valle de Juárez	1
649	14	113	San Gabriel	1
650	14	114	Villa Corona	1
651	14	115	Villa Guerrero	1
652	14	116	Villa Hidalgo	1
653	14	117	Cañadas de Obregón	1
654	14	118	Yahualica de González Gallo	1
655	14	119	Zacoalco de Torres	1
656	14	120	Zapopan	1
657	14	121	Zapotiltic	1
658	14	122	Zapotitlán de Vadillo	1
659	14	123	Zapotlán del Rey	1
660	14	124	Zapotlanejo	1
661	14	125	San Ignacio Cerro Gordo	1
662	15	001	Acambay de Ruíz Castañeda	1
663	15	002	Acolman	1
664	15	003	Aculco	1
665	15	004	Almoloya de Alquisiras	1
666	15	005	Almoloya de Juárez	1
667	15	006	Almoloya del Río	1
668	15	007	Amanalco	1
669	15	008	Amatepec	1
670	15	009	Amecameca	1
671	15	010	Apaxco	1
672	15	011	Atenco	1
673	15	012	Atizapán	1
674	15	013	Atizapán de Zaragoza	1
675	15	014	Atlacomulco	1
676	15	015	Atlautla	1
677	15	016	Axapusco	1
678	15	017	Ayapango	1
679	15	018	Calimaya	1
680	15	019	Capulhuac	1
681	15	020	Coacalco de Berriozábal	1
682	15	021	Coatepec Harinas	1
683	15	022	Cocotitlán	1
684	15	023	Coyotepec	1
685	15	024	Cuautitlán	1
686	15	025	Chalco	1
687	15	026	Chapa de Mota	1
688	15	027	Chapultepec	1
689	15	028	Chiautla	1
690	15	029	Chicoloapan	1
691	15	030	Chiconcuac	1
692	15	031	Chimalhuacán	1
693	15	032	Donato Guerra	1
694	15	033	Ecatepec de Morelos	1
695	15	034	Ecatzingo	1
696	15	035	Huehuetoca	1
697	15	036	Hueypoxtla	1
698	15	037	Huixquilucan	1
699	15	038	Isidro Fabela	1
700	15	039	Ixtapaluca	1
701	15	040	Ixtapan de la Sal	1
702	15	041	Ixtapan del Oro	1
703	15	042	Ixtlahuaca	1
704	15	043	Xalatlaco	1
705	15	044	Jaltenco	1
706	15	045	Jilotepec	1
707	15	046	Jilotzingo	1
708	15	047	Jiquipilco	1
709	15	048	Jocotitlán	1
710	15	049	Joquicingo	1
711	15	050	Juchitepec	1
712	15	051	Lerma	1
713	15	052	Malinalco	1
714	15	053	Melchor Ocampo	1
715	15	054	Metepec	1
716	15	055	Mexicaltzingo	1
717	15	056	Morelos	1
718	15	057	Naucalpan de Juárez	1
719	15	058	Nezahualcóyotl	1
720	15	059	Nextlalpan	1
721	15	060	Nicolás Romero	1
722	15	061	Nopaltepec	1
723	15	062	Ocoyoacac	1
724	15	063	Ocuilan	1
725	15	064	El Oro	1
726	15	065	Otumba	1
727	15	066	Otzoloapan	1
728	15	067	Otzolotepec	1
729	15	068	Ozumba	1
730	15	069	Papalotla	1
731	15	070	La Paz	1
732	15	071	Polotitlán	1
733	15	072	Rayón	1
734	15	073	San Antonio la Isla	1
735	15	074	San Felipe del Progreso	1
736	15	075	San Martín de las Pirámides	1
737	15	076	San Mateo Atenco	1
738	15	077	San Simón de Guerrero	1
739	15	078	Santo Tomás	1
740	15	079	Soyaniquilpan de Juárez	1
741	15	080	Sultepec	1
742	15	081	Tecámac	1
743	15	082	Tejupilco	1
744	15	083	Temamatla	1
745	15	084	Temascalapa	1
746	15	085	Temascalcingo	1
747	15	086	Temascaltepec	1
748	15	087	Temoaya	1
749	15	088	Tenancingo	1
750	15	089	Tenango del Aire	1
751	15	090	Tenango del Valle	1
752	15	091	Teoloyucan	1
753	15	092	Teotihuacán	1
754	15	093	Tepetlaoxtoc	1
755	15	094	Tepetlixpa	1
756	15	095	Tepotzotlán	1
757	15	096	Tequixquiac	1
758	15	097	Texcaltitlán	1
759	15	098	Texcalyacac	1
760	15	099	Texcoco	1
761	15	100	Tezoyuca	1
762	15	101	Tianguistenco	1
763	15	102	Timilpan	1
764	15	103	Tlalmanalco	1
765	15	104	Tlalnepantla de Baz	1
766	15	105	Tlatlaya	1
767	15	106	Toluca	1
768	15	107	Tonatico	1
769	15	108	Tultepec	1
770	15	109	Tultitlán	1
771	15	110	Valle de Bravo	1
772	15	111	Villa de Allende	1
773	15	112	Villa del Carbón	1
774	15	113	Villa Guerrero	1
775	15	114	Villa Victoria	1
776	15	115	Xonacatlán	1
777	15	116	Zacazonapan	1
778	15	117	Zacualpan	1
779	15	118	Zinacantepec	1
780	15	119	Zumpahuacán	1
781	15	120	Zumpango	1
782	15	121	Cuautitlán Izcalli	1
783	15	122	Valle de Chalco Solidaridad	1
784	15	123	Luvianos	1
785	15	124	San José del Rincón	1
786	15	125	Tonanitla	1
787	16	001	Acuitzio	1
788	16	002	Aguililla	1
789	16	003	Álvaro Obregón	1
790	16	004	Angamacutiro	1
791	16	005	Angangueo	1
792	16	006	Apatzingán	1
793	16	007	Aporo	1
794	16	008	Aquila	1
795	16	009	Ario	1
796	16	010	Arteaga	1
797	16	011	Briseñas	1
798	16	012	Buenavista	1
799	16	013	Carácuaro	1
800	16	014	Coahuayana	1
801	16	015	Coalcomán de Vázquez Pallares	1
802	16	016	Coeneo	1
803	16	017	Contepec	1
804	16	018	Copándaro	1
805	16	019	Cotija	1
806	16	020	Cuitzeo	1
807	16	021	Charapan	1
808	16	022	Charo	1
809	16	023	Chavinda	1
810	16	024	Cherán	1
811	16	025	Chilchota	1
812	16	026	Chinicuila	1
813	16	027	Chucándiro	1
814	16	028	Churintzio	1
815	16	029	Churumuco	1
816	16	030	Ecuandureo	1
817	16	031	Epitacio Huerta	1
818	16	032	Erongarícuaro	1
819	16	033	Gabriel Zamora	1
820	16	034	Hidalgo	1
821	16	035	La Huacana	1
822	16	036	Huandacareo	1
823	16	037	Huaniqueo	1
824	16	038	Huetamo	1
825	16	039	Huiramba	1
826	16	040	Indaparapeo	1
827	16	041	Irimbo	1
828	16	042	Ixtlán	1
829	16	043	Jacona	1
830	16	044	Jiménez	1
831	16	045	Jiquilpan	1
832	16	046	Juárez	1
833	16	047	Jungapeo	1
834	16	048	Lagunillas	1
835	16	049	Madero	1
836	16	050	Maravatío	1
837	16	051	Marcos Castellanos	1
838	16	052	Lázaro Cárdenas	1
839	16	053	Morelia	1
840	16	054	Morelos	1
841	16	055	Múgica	1
842	16	056	Nahuatzen	1
843	16	057	Nocupétaro	1
844	16	058	Nuevo Parangaricutiro	1
845	16	059	Nuevo Urecho	1
846	16	060	Numarán	1
847	16	061	Ocampo	1
848	16	062	Pajacuarán	1
849	16	063	Panindícuaro	1
850	16	064	Parácuaro	1
851	16	065	Paracho	1
852	16	066	Pátzcuaro	1
853	16	067	Penjamillo	1
854	16	068	Peribán	1
855	16	069	La Piedad	1
856	16	070	Purépero	1
857	16	071	Puruándiro	1
858	16	072	Queréndaro	1
859	16	073	Quiroga	1
860	16	074	Cojumatlán de Régules	1
861	16	075	Los Reyes	1
862	16	076	Sahuayo	1
863	16	077	San Lucas	1
864	16	078	Santa Ana Maya	1
865	16	079	Salvador Escalante	1
866	16	080	Senguio	1
867	16	081	Susupuato	1
868	16	082	Tacámbaro	1
869	16	083	Tancítaro	1
870	16	084	Tangamandapio	1
871	16	085	Tangancícuaro	1
872	16	086	Tanhuato	1
873	16	087	Taretan	1
874	16	088	Tarímbaro	1
875	16	089	Tepalcatepec	1
876	16	090	Tingambato	1
877	16	091	Tingüindín	1
878	16	092	Tiquicheo de Nicolás Romero	1
879	16	093	Tlalpujahua	1
880	16	094	Tlazazalca	1
881	16	095	Tocumbo	1
882	16	096	Tumbiscatío	1
883	16	097	Turicato	1
884	16	098	Tuxpan	1
885	16	099	Tuzantla	1
886	16	100	Tzintzuntzan	1
887	16	101	Tzitzio	1
888	16	102	Uruapan	1
889	16	103	Venustiano Carranza	1
890	16	104	Villamar	1
891	16	105	Vista Hermosa	1
892	16	106	Yurécuaro	1
893	16	107	Zacapu	1
894	16	108	Zamora	1
895	16	109	Zináparo	1
896	16	110	Zinapécuaro	1
897	16	111	Ziracuaretiro	1
898	16	112	Zitácuaro	1
899	16	113	José Sixto Verduzco	1
900	17	001	Amacuzac	1
901	17	002	Atlatlahucan	1
902	17	003	Axochiapan	1
903	17	004	Ayala	1
904	17	005	Coatlán del Río	1
905	17	006	Cuautla	1
906	17	007	Cuernavaca	1
907	17	008	Emiliano Zapata	1
908	17	009	Huitzilac	1
909	17	010	Jantetelco	1
910	17	011	Jiutepec	1
911	17	012	Jojutla	1
912	17	013	Jonacatepec de Leandro Valle	1
913	17	014	Mazatepec	1
914	17	015	Miacatlán	1
915	17	016	Ocuituco	1
916	17	017	Puente de Ixtla	1
917	17	018	Temixco	1
918	17	019	Tepalcingo	1
919	17	020	Tepoztlán	1
920	17	021	Tetecala	1
921	17	022	Tetela del Volcán	1
922	17	023	Tlalnepantla	1
923	17	024	Tlaltizapán de Zapata	1
924	17	025	Tlaquiltenango	1
925	17	026	Tlayacapan	1
926	17	027	Totolapan	1
927	17	028	Xochitepec	1
928	17	029	Yautepec	1
929	17	030	Yecapixtla	1
930	17	031	Zacatepec	1
931	17	032	Zacualpan de Amilpas	1
932	17	033	Temoac	1
933	18	001	Acaponeta	1
934	18	002	Ahuacatlán	1
935	18	003	Amatlán de Cañas	1
936	18	004	Compostela	1
937	18	005	Huajicori	1
938	18	006	Ixtlán del Río	1
939	18	007	Jala	1
940	18	008	Xalisco	1
941	18	009	Del Nayar	1
942	18	010	Rosamorada	1
943	18	011	Ruíz	1
944	18	012	San Blas	1
945	18	013	San Pedro Lagunillas	1
946	18	014	Santa María del Oro	1
947	18	015	Santiago Ixcuintla	1
948	18	016	Tecuala	1
949	18	017	Tepic	1
950	18	018	Tuxpan	1
951	18	019	La Yesca	1
952	18	020	Bahía de Banderas	1
953	19	001	Abasolo	1
954	19	002	Agualeguas	1
955	19	003	Los Aldamas	1
956	19	004	Allende	1
957	19	005	Anáhuac	1
958	19	006	Apodaca	1
959	19	007	Aramberri	1
960	19	008	Bustamante	1
961	19	009	Cadereyta Jiménez	1
962	19	010	El Carmen	1
963	19	011	Cerralvo	1
964	19	012	Ciénega de Flores	1
965	19	013	China	1
966	19	014	Doctor Arroyo	1
967	19	015	Doctor Coss	1
968	19	016	Doctor González	1
969	19	017	Galeana	1
970	19	018	García	1
971	19	019	San Pedro Garza García	1
972	19	020	General Bravo	1
973	19	021	General Escobedo	1
974	19	022	General Terán	1
975	19	023	General Treviño	1
976	19	024	General Zaragoza	1
977	19	025	General Zuazua	1
978	19	026	Guadalupe	1
979	19	027	Los Herreras	1
980	19	028	Higueras	1
981	19	029	Hualahuises	1
982	19	030	Iturbide	1
983	19	031	Juárez	1
984	19	032	Lampazos de Naranjo	1
985	19	033	Linares	1
986	19	034	Marín	1
987	19	035	Melchor Ocampo	1
988	19	036	Mier y Noriega	1
989	19	037	Mina	1
990	19	038	Montemorelos	1
991	19	039	Monterrey	1
992	19	040	Parás	1
993	19	041	Pesquería	1
994	19	042	Los Ramones	1
995	19	043	Rayones	1
996	19	044	Sabinas Hidalgo	1
997	19	045	Salinas Victoria	1
998	19	046	San Nicolás de los Garza	1
999	19	047	Hidalgo	1
1000	19	048	Santa Catarina	1
1001	19	049	Santiago	1
1002	19	050	Vallecillo	1
1003	19	051	Villaldama	1
1004	20	001	Abejones	1
1005	20	002	Acatlán de Pérez Figueroa	1
1006	20	003	Asunción Cacalotepec	1
1007	20	004	Asunción Cuyotepeji	1
1008	20	005	Asunción Ixtaltepec	1
1009	20	006	Asunción Nochixtlán	1
1010	20	007	Asunción Ocotlán	1
1011	20	008	Asunción Tlacolulita	1
1012	20	009	Ayotzintepec	1
1013	20	010	El Barrio de la Soledad	1
1014	20	011	Calihualá	1
1015	20	012	Candelaria Loxicha	1
1016	20	013	Ciénega de Zimatlán	1
1017	20	014	Ciudad Ixtepec	1
1018	20	015	Coatecas Altas	1
1019	20	016	Coicoyán de las Flores	1
1020	20	017	La Compañía	1
1021	20	018	Concepción Buenavista	1
1022	20	019	Concepción Pápalo	1
1023	20	020	Constancia del Rosario	1
1024	20	021	Cosolapa	1
1025	20	022	Cosoltepec	1
1026	20	023	Cuilápam de Guerrero	1
1027	20	024	Cuyamecalco Villa de Zaragoza	1
1028	20	025	Chahuites	1
1029	20	026	Chalcatongo de Hidalgo	1
1030	20	027	Chiquihuitlán de Benito Juárez	1
1031	20	028	Heroica Ciudad de Ejutla de Crespo	1
1032	20	029	Eloxochitlán de Flores Magón	1
1033	20	030	El Espinal	1
1034	20	031	Tamazulápam del Espíritu Santo	1
1035	20	032	Fresnillo de Trujano	1
1036	20	033	Guadalupe Etla	1
1037	20	034	Guadalupe de Ramírez	1
1038	20	035	Guelatao de Juárez	1
1039	20	036	Guevea de Humboldt	1
1040	20	037	Mesones Hidalgo	1
1041	20	038	Villa Hidalgo	1
1042	20	039	Heroica Ciudad de Huajuapan de León	1
1043	20	040	Huautepec	1
1044	20	041	Huautla de Jiménez	1
1045	20	042	Ixtlán de Juárez	1
1046	20	043	Heroica Ciudad de Juchitán de Zaragoza	1
1047	20	044	Loma Bonita	1
1048	20	045	Magdalena Apasco	1
1049	20	046	Magdalena Jaltepec	1
1050	20	047	Santa Magdalena Jicotlán	1
1051	20	048	Magdalena Mixtepec	1
1052	20	049	Magdalena Ocotlán	1
1053	20	050	Magdalena Peñasco	1
1054	20	051	Magdalena Teitipac	1
1055	20	052	Magdalena Tequisistlán	1
1056	20	053	Magdalena Tlacotepec	1
1057	20	054	Magdalena Zahuatlán	1
1058	20	055	Mariscala de Juárez	1
1059	20	056	Mártires de Tacubaya	1
1060	20	057	Matías Romero Avendaño	1
1061	20	058	Mazatlán Villa de Flores	1
1062	20	059	Miahuatlán de Porfirio Díaz	1
1063	20	060	Mixistlán de la Reforma	1
1064	20	061	Monjas	1
1065	20	062	Natividad	1
1066	20	063	Nazareno Etla	1
1067	20	064	Nejapa de Madero	1
1068	20	065	Ixpantepec Nieves	1
1069	20	066	Santiago Niltepec	1
1070	20	067	Oaxaca de Juárez	1
1071	20	068	Ocotlán de Morelos	1
1072	20	069	La Pe	1
1073	20	070	Pinotepa de Don Luis	1
1074	20	071	Pluma Hidalgo	1
1075	20	072	San José del Progreso	1
1076	20	073	Putla Villa de Guerrero	1
1077	20	074	Santa Catarina Quioquitani	1
1078	20	075	Reforma de Pineda	1
1079	20	076	La Reforma	1
1080	20	077	Reyes Etla	1
1081	20	078	Rojas de Cuauhtémoc	1
1082	20	079	Salina Cruz	1
1083	20	080	San Agustín Amatengo	1
1084	20	081	San Agustín Atenango	1
1085	20	082	San Agustín Chayuco	1
1086	20	083	San Agustín de las Juntas	1
1087	20	084	San Agustín Etla	1
1088	20	085	San Agustín Loxicha	1
1089	20	086	San Agustín Tlacotepec	1
1090	20	087	San Agustín Yatareni	1
1091	20	088	San Andrés Cabecera Nueva	1
1092	20	089	San Andrés Dinicuiti	1
1093	20	090	San Andrés Huaxpaltepec	1
1094	20	091	San Andrés Huayápam	1
1095	20	092	San Andrés Ixtlahuaca	1
1096	20	093	San Andrés Lagunas	1
1097	20	094	San Andrés Nuxiño	1
1098	20	095	San Andrés Paxtlán	1
1099	20	096	San Andrés Sinaxtla	1
1100	20	097	San Andrés Solaga	1
1101	20	098	San Andrés Teotilálpam	1
1102	20	099	San Andrés Tepetlapa	1
1103	20	100	San Andrés Yaá	1
1104	20	101	San Andrés Zabache	1
1105	20	102	San Andrés Zautla	1
1106	20	103	San Antonino Castillo Velasco	1
1107	20	104	San Antonino el Alto	1
1108	20	105	San Antonino Monte Verde	1
1109	20	106	San Antonio Acutla	1
1110	20	107	San Antonio de la Cal	1
1111	20	108	San Antonio Huitepec	1
1112	20	109	San Antonio Nanahuatípam	1
1113	20	110	San Antonio Sinicahua	1
1114	20	111	San Antonio Tepetlapa	1
1115	20	112	San Baltazar Chichicápam	1
1116	20	113	San Baltazar Loxicha	1
1117	20	114	San Baltazar Yatzachi el Bajo	1
1118	20	115	San Bartolo Coyotepec	1
1119	20	116	San Bartolomé Ayautla	1
1120	20	117	San Bartolomé Loxicha	1
1121	20	118	San Bartolomé Quialana	1
1122	20	119	San Bartolomé Yucuañe	1
1123	20	120	San Bartolomé Zoogocho	1
1124	20	121	San Bartolo Soyaltepec	1
1125	20	122	San Bartolo Yautepec	1
1126	20	123	San Bernardo Mixtepec	1
1127	20	124	San Blas Atempa	1
1128	20	125	San Carlos Yautepec	1
1129	20	126	San Cristóbal Amatlán	1
1130	20	127	San Cristóbal Amoltepec	1
1131	20	128	San Cristóbal Lachirioag	1
1132	20	129	San Cristóbal Suchixtlahuaca	1
1133	20	130	San Dionisio del Mar	1
1134	20	131	San Dionisio Ocotepec	1
1135	20	132	San Dionisio Ocotlán	1
1136	20	133	San Esteban Atatlahuca	1
1137	20	134	San Felipe Jalapa de Díaz	1
1138	20	135	San Felipe Tejalápam	1
1139	20	136	San Felipe Usila	1
1140	20	137	San Francisco Cahuacuá	1
1141	20	138	San Francisco Cajonos	1
1142	20	139	San Francisco Chapulapa	1
1143	20	140	San Francisco Chindúa	1
1144	20	141	San Francisco del Mar	1
1145	20	142	San Francisco Huehuetlán	1
1146	20	143	San Francisco Ixhuatán	1
1147	20	144	San Francisco Jaltepetongo	1
1148	20	145	San Francisco Lachigoló	1
1149	20	146	San Francisco Logueche	1
1150	20	147	San Francisco Nuxaño	1
1151	20	148	San Francisco Ozolotepec	1
1152	20	149	San Francisco Sola	1
1153	20	150	San Francisco Telixtlahuaca	1
1154	20	151	San Francisco Teopan	1
1155	20	152	San Francisco Tlapancingo	1
1156	20	153	San Gabriel Mixtepec	1
1157	20	154	San Ildefonso Amatlán	1
1158	20	155	San Ildefonso Sola	1
1159	20	156	San Ildefonso Villa Alta	1
1160	20	157	San Jacinto Amilpas	1
1161	20	158	San Jacinto Tlacotepec	1
1162	20	159	San Jerónimo Coatlán	1
1163	20	160	San Jerónimo Silacayoapilla	1
1164	20	161	San Jerónimo Sosola	1
1165	20	162	San Jerónimo Taviche	1
1166	20	163	San Jerónimo Tecóatl	1
1167	20	164	San Jorge Nuchita	1
1168	20	165	San José Ayuquila	1
1169	20	166	San José Chiltepec	1
1170	20	167	San José del Peñasco	1
1171	20	168	San José Estancia Grande	1
1172	20	169	San José Independencia	1
1173	20	170	San José Lachiguiri	1
1174	20	171	San José Tenango	1
1175	20	172	San Juan Achiutla	1
1176	20	173	San Juan Atepec	1
1177	20	174	Ánimas Trujano	1
1178	20	175	San Juan Bautista Atatlahuca	1
1179	20	176	San Juan Bautista Coixtlahuaca	1
1180	20	177	San Juan Bautista Cuicatlán	1
1181	20	178	San Juan Bautista Guelache	1
1182	20	179	San Juan Bautista Jayacatlán	1
1302	20	299	San Pablo Yaganiza	1
1183	20	180	San Juan Bautista Lo de Soto	1
1184	20	181	San Juan Bautista Suchitepec	1
1185	20	182	San Juan Bautista Tlacoatzintepec	1
1186	20	183	San Juan Bautista Tlachichilco	1
1187	20	184	San Juan Bautista Tuxtepec	1
1188	20	185	San Juan Cacahuatepec	1
1189	20	186	San Juan Cieneguilla	1
1190	20	187	San Juan Coatzóspam	1
1191	20	188	San Juan Colorado	1
1192	20	189	San Juan Comaltepec	1
1193	20	190	San Juan Cotzocón	1
1194	20	191	San Juan Chicomezúchil	1
1195	20	192	San Juan Chilateca	1
1196	20	193	San Juan del Estado	1
1197	20	194	San Juan del Río	1
1198	20	195	San Juan Diuxi	1
1199	20	196	San Juan Evangelista Analco	1
1200	20	197	San Juan Guelavía	1
1201	20	198	San Juan Guichicovi	1
1202	20	199	San Juan Ihualtepec	1
1203	20	200	San Juan Juquila Mixes	1
1204	20	201	San Juan Juquila Vijanos	1
1205	20	202	San Juan Lachao	1
1206	20	203	San Juan Lachigalla	1
1207	20	204	San Juan Lajarcia	1
1208	20	205	San Juan Lalana	1
1209	20	206	San Juan de los Cués	1
1210	20	207	San Juan Mazatlán	1
1211	20	208	San Juan Mixtepec	1
1212	20	209	San Juan Mixtepec	1
1213	20	210	San Juan Ñumí	1
1214	20	211	San Juan Ozolotepec	1
1215	20	212	San Juan Petlapa	1
1216	20	213	San Juan Quiahije	1
1217	20	214	San Juan Quiotepec	1
1218	20	215	San Juan Sayultepec	1
1219	20	216	San Juan Tabaá	1
1220	20	217	San Juan Tamazola	1
1221	20	218	San Juan Teita	1
1222	20	219	San Juan Teitipac	1
1223	20	220	San Juan Tepeuxila	1
1224	20	221	San Juan Teposcolula	1
1225	20	222	San Juan Yaeé	1
1226	20	223	San Juan Yatzona	1
1227	20	224	San Juan Yucuita	1
1228	20	225	San Lorenzo	1
1229	20	226	San Lorenzo Albarradas	1
1230	20	227	San Lorenzo Cacaotepec	1
1231	20	228	San Lorenzo Cuaunecuiltitla	1
1232	20	229	San Lorenzo Texmelúcan	1
1233	20	230	San Lorenzo Victoria	1
1234	20	231	San Lucas Camotlán	1
1235	20	232	San Lucas Ojitlán	1
1236	20	233	San Lucas Quiaviní	1
1237	20	234	San Lucas Zoquiápam	1
1238	20	235	San Luis Amatlán	1
1239	20	236	San Marcial Ozolotepec	1
1240	20	237	San Marcos Arteaga	1
1241	20	238	San Martín de los Cansecos	1
1242	20	239	San Martín Huamelúlpam	1
1243	20	240	San Martín Itunyoso	1
1244	20	241	San Martín Lachilá	1
1245	20	242	San Martín Peras	1
1246	20	243	San Martín Tilcajete	1
1247	20	244	San Martín Toxpalan	1
1248	20	245	San Martín Zacatepec	1
1249	20	246	San Mateo Cajonos	1
1250	20	247	Capulálpam de Méndez	1
1251	20	248	San Mateo del Mar	1
1252	20	249	San Mateo Yoloxochitlán	1
1253	20	250	San Mateo Etlatongo	1
1254	20	251	San Mateo Nejápam	1
1255	20	252	San Mateo Peñasco	1
1256	20	253	San Mateo Piñas	1
1257	20	254	San Mateo Río Hondo	1
1258	20	255	San Mateo Sindihui	1
1259	20	256	San Mateo Tlapiltepec	1
1260	20	257	San Melchor Betaza	1
1261	20	258	San Miguel Achiutla	1
1262	20	259	San Miguel Ahuehuetitlán	1
1263	20	260	San Miguel Aloápam	1
1264	20	261	San Miguel Amatitlán	1
1265	20	262	San Miguel Amatlán	1
1266	20	263	San Miguel Coatlán	1
1267	20	264	San Miguel Chicahua	1
1268	20	265	San Miguel Chimalapa	1
1269	20	266	San Miguel del Puerto	1
1270	20	267	San Miguel del Río	1
1271	20	268	San Miguel Ejutla	1
1272	20	269	San Miguel el Grande	1
1273	20	270	San Miguel Huautla	1
1274	20	271	San Miguel Mixtepec	1
1275	20	272	San Miguel Panixtlahuaca	1
1276	20	273	San Miguel Peras	1
1277	20	274	San Miguel Piedras	1
1278	20	275	San Miguel Quetzaltepec	1
1279	20	276	San Miguel Santa Flor	1
1280	20	277	Villa Sola de Vega	1
1281	20	278	San Miguel Soyaltepec	1
1282	20	279	San Miguel Suchixtepec	1
1283	20	280	Villa Talea de Castro	1
1284	20	281	San Miguel Tecomatlán	1
1285	20	282	San Miguel Tenango	1
1286	20	283	San Miguel Tequixtepec	1
1287	20	284	San Miguel Tilquiápam	1
1288	20	285	San Miguel Tlacamama	1
1289	20	286	San Miguel Tlacotepec	1
1290	20	287	San Miguel Tulancingo	1
1291	20	288	San Miguel Yotao	1
1292	20	289	San Nicolás	1
1293	20	290	San Nicolás Hidalgo	1
1294	20	291	San Pablo Coatlán	1
1295	20	292	San Pablo Cuatro Venados	1
1296	20	293	San Pablo Etla	1
1297	20	294	San Pablo Huitzo	1
1298	20	295	San Pablo Huixtepec	1
1299	20	296	San Pablo Macuiltianguis	1
1300	20	297	San Pablo Tijaltepec	1
1301	20	298	San Pablo Villa de Mitla	1
1303	20	300	San Pedro Amuzgos	1
1304	20	301	San Pedro Apóstol	1
1305	20	302	San Pedro Atoyac	1
1306	20	303	San Pedro Cajonos	1
1307	20	304	San Pedro Coxcaltepec Cántaros	1
1308	20	305	San Pedro Comitancillo	1
1309	20	306	San Pedro el Alto	1
1310	20	307	San Pedro Huamelula	1
1311	20	308	San Pedro Huilotepec	1
1312	20	309	San Pedro Ixcatlán	1
1313	20	310	San Pedro Ixtlahuaca	1
1314	20	311	San Pedro Jaltepetongo	1
1315	20	312	San Pedro Jicayán	1
1316	20	313	San Pedro Jocotipac	1
1317	20	314	San Pedro Juchatengo	1
1318	20	315	San Pedro Mártir	1
1319	20	316	San Pedro Mártir Quiechapa	1
1320	20	317	San Pedro Mártir Yucuxaco	1
1321	20	318	San Pedro Mixtepec	1
1322	20	319	San Pedro Mixtepec	1
1323	20	320	San Pedro Molinos	1
1324	20	321	San Pedro Nopala	1
1325	20	322	San Pedro Ocopetatillo	1
1326	20	323	San Pedro Ocotepec	1
1327	20	324	San Pedro Pochutla	1
1328	20	325	San Pedro Quiatoni	1
1329	20	326	San Pedro Sochiápam	1
1330	20	327	San Pedro Tapanatepec	1
1331	20	328	San Pedro Taviche	1
1332	20	329	San Pedro Teozacoalco	1
1333	20	330	San Pedro Teutila	1
1334	20	331	San Pedro Tidaá	1
1335	20	332	San Pedro Topiltepec	1
1336	20	333	San Pedro Totolápam	1
1337	20	334	Villa de Tututepec	1
1338	20	335	San Pedro Yaneri	1
1339	20	336	San Pedro Yólox	1
1340	20	337	San Pedro y San Pablo Ayutla	1
1341	20	338	Villa de Etla	1
1342	20	339	San Pedro y San Pablo Teposcolula	1
1343	20	340	San Pedro y San Pablo Tequixtepec	1
1344	20	341	San Pedro Yucunama	1
1345	20	342	San Raymundo Jalpan	1
1346	20	343	San Sebastián Abasolo	1
1347	20	344	San Sebastián Coatlán	1
1348	20	345	San Sebastián Ixcapa	1
1349	20	346	San Sebastián Nicananduta	1
1350	20	347	San Sebastián Río Hondo	1
1351	20	348	San Sebastián Tecomaxtlahuaca	1
1352	20	349	San Sebastián Teitipac	1
1353	20	350	San Sebastián Tutla	1
1354	20	351	San Simón Almolongas	1
1355	20	352	San Simón Zahuatlán	1
1356	20	353	Santa Ana	1
1357	20	354	Santa Ana Ateixtlahuaca	1
1358	20	355	Santa Ana Cuauhtémoc	1
1359	20	356	Santa Ana del Valle	1
1360	20	357	Santa Ana Tavela	1
1361	20	358	Santa Ana Tlapacoyan	1
1362	20	359	Santa Ana Yareni	1
1363	20	360	Santa Ana Zegache	1
1364	20	361	Santa Catalina Quierí	1
1365	20	362	Santa Catarina Cuixtla	1
1366	20	363	Santa Catarina Ixtepeji	1
1367	20	364	Santa Catarina Juquila	1
1368	20	365	Santa Catarina Lachatao	1
1369	20	366	Santa Catarina Loxicha	1
1370	20	367	Santa Catarina Mechoacán	1
1371	20	368	Santa Catarina Minas	1
1372	20	369	Santa Catarina Quiané	1
1373	20	370	Santa Catarina Tayata	1
1374	20	371	Santa Catarina Ticuá	1
1375	20	372	Santa Catarina Yosonotú	1
1376	20	373	Santa Catarina Zapoquila	1
1377	20	374	Santa Cruz Acatepec	1
1378	20	375	Santa Cruz Amilpas	1
1379	20	376	Santa Cruz de Bravo	1
1380	20	377	Santa Cruz Itundujia	1
1381	20	378	Santa Cruz Mixtepec	1
1382	20	379	Santa Cruz Nundaco	1
1383	20	380	Santa Cruz Papalutla	1
1384	20	381	Santa Cruz Tacache de Mina	1
1385	20	382	Santa Cruz Tacahua	1
1386	20	383	Santa Cruz Tayata	1
1387	20	384	Santa Cruz Xitla	1
1388	20	385	Santa Cruz Xoxocotlán	1
1389	20	386	Santa Cruz Zenzontepec	1
1390	20	387	Santa Gertrudis	1
1391	20	388	Santa Inés del Monte	1
1392	20	389	Santa Inés Yatzeche	1
1393	20	390	Santa Lucía del Camino	1
1394	20	391	Santa Lucía Miahuatlán	1
1395	20	392	Santa Lucía Monteverde	1
1396	20	393	Santa Lucía Ocotlán	1
1397	20	394	Santa María Alotepec	1
1398	20	395	Santa María Apazco	1
1399	20	396	Santa María la Asunción	1
1400	20	397	Heroica Ciudad de Tlaxiaco	1
1401	20	398	Ayoquezco de Aldama	1
1402	20	399	Santa María Atzompa	1
1403	20	400	Santa María Camotlán	1
1404	20	401	Santa María Colotepec	1
1405	20	402	Santa María Cortijo	1
1406	20	403	Santa María Coyotepec	1
1407	20	404	Santa María Chachoápam	1
1408	20	405	Villa de Chilapa de Díaz	1
1409	20	406	Santa María Chilchotla	1
1410	20	407	Santa María Chimalapa	1
1411	20	408	Santa María del Rosario	1
1412	20	409	Santa María del Tule	1
1413	20	410	Santa María Ecatepec	1
1414	20	411	Santa María Guelacé	1
1415	20	412	Santa María Guienagati	1
1416	20	413	Santa María Huatulco	1
1417	20	414	Santa María Huazolotitlán	1
1418	20	415	Santa María Ipalapa	1
1419	20	416	Santa María Ixcatlán	1
1420	20	417	Santa María Jacatepec	1
1421	20	418	Santa María Jalapa del Marqués	1
1422	20	419	Santa María Jaltianguis	1
1423	20	420	Santa María Lachixío	1
1424	20	421	Santa María Mixtequilla	1
1425	20	422	Santa María Nativitas	1
1426	20	423	Santa María Nduayaco	1
1427	20	424	Santa María Ozolotepec	1
1428	20	425	Santa María Pápalo	1
1429	20	426	Santa María Peñoles	1
1430	20	427	Santa María Petapa	1
1431	20	428	Santa María Quiegolani	1
1432	20	429	Santa María Sola	1
1433	20	430	Santa María Tataltepec	1
1434	20	431	Santa María Tecomavaca	1
1435	20	432	Santa María Temaxcalapa	1
1436	20	433	Santa María Temaxcaltepec	1
1437	20	434	Santa María Teopoxco	1
1438	20	435	Santa María Tepantlali	1
1439	20	436	Santa María Texcatitlán	1
1440	20	437	Santa María Tlahuitoltepec	1
1441	20	438	Santa María Tlalixtac	1
1442	20	439	Santa María Tonameca	1
1443	20	440	Santa María Totolapilla	1
1444	20	441	Santa María Xadani	1
1445	20	442	Santa María Yalina	1
1446	20	443	Santa María Yavesía	1
1447	20	444	Santa María Yolotepec	1
1448	20	445	Santa María Yosoyúa	1
1449	20	446	Santa María Yucuhiti	1
1450	20	447	Santa María Zacatepec	1
1451	20	448	Santa María Zaniza	1
1452	20	449	Santa María Zoquitlán	1
1453	20	450	Santiago Amoltepec	1
1454	20	451	Santiago Apoala	1
1455	20	452	Santiago Apóstol	1
1456	20	453	Santiago Astata	1
1457	20	454	Santiago Atitlán	1
1458	20	455	Santiago Ayuquililla	1
1459	20	456	Santiago Cacaloxtepec	1
1460	20	457	Santiago Camotlán	1
1461	20	458	Santiago Comaltepec	1
1462	20	459	Santiago Chazumba	1
1463	20	460	Santiago Choápam	1
1464	20	461	Santiago del Río	1
1465	20	462	Santiago Huajolotitlán	1
1466	20	463	Santiago Huauclilla	1
1467	20	464	Santiago Ihuitlán Plumas	1
1468	20	465	Santiago Ixcuintepec	1
1469	20	466	Santiago Ixtayutla	1
1470	20	467	Santiago Jamiltepec	1
1471	20	468	Santiago Jocotepec	1
1472	20	469	Santiago Juxtlahuaca	1
1473	20	470	Santiago Lachiguiri	1
1474	20	471	Santiago Lalopa	1
1475	20	472	Santiago Laollaga	1
1476	20	473	Santiago Laxopa	1
1477	20	474	Santiago Llano Grande	1
1478	20	475	Santiago Matatlán	1
1479	20	476	Santiago Miltepec	1
1480	20	477	Santiago Minas	1
1481	20	478	Santiago Nacaltepec	1
1482	20	479	Santiago Nejapilla	1
1483	20	480	Santiago Nundiche	1
1484	20	481	Santiago Nuyoó	1
1485	20	482	Santiago Pinotepa Nacional	1
1486	20	483	Santiago Suchilquitongo	1
1487	20	484	Santiago Tamazola	1
1488	20	485	Santiago Tapextla	1
1489	20	486	Villa Tejúpam de la Unión	1
1490	20	487	Santiago Tenango	1
1491	20	488	Santiago Tepetlapa	1
1492	20	489	Santiago Tetepec	1
1493	20	490	Santiago Texcalcingo	1
1494	20	491	Santiago Textitlán	1
1495	20	492	Santiago Tilantongo	1
1496	20	493	Santiago Tillo	1
1497	20	494	Santiago Tlazoyaltepec	1
1498	20	495	Santiago Xanica	1
1499	20	496	Santiago Xiacuí	1
1500	20	497	Santiago Yaitepec	1
1501	20	498	Santiago Yaveo	1
1502	20	499	Santiago Yolomécatl	1
1503	20	500	Santiago Yosondúa	1
1504	20	501	Santiago Yucuyachi	1
1505	20	502	Santiago Zacatepec	1
1506	20	503	Santiago Zoochila	1
1507	20	504	Nuevo Zoquiápam	1
1508	20	505	Santo Domingo Ingenio	1
1509	20	506	Santo Domingo Albarradas	1
1510	20	507	Santo Domingo Armenta	1
1511	20	508	Santo Domingo Chihuitán	1
1512	20	509	Santo Domingo de Morelos	1
1513	20	510	Santo Domingo Ixcatlán	1
1514	20	511	Santo Domingo Nuxaá	1
1515	20	512	Santo Domingo Ozolotepec	1
1516	20	513	Santo Domingo Petapa	1
1517	20	514	Santo Domingo Roayaga	1
1518	20	515	Santo Domingo Tehuantepec	1
1519	20	516	Santo Domingo Teojomulco	1
1520	20	517	Santo Domingo Tepuxtepec	1
1521	20	518	Santo Domingo Tlatayápam	1
1522	20	519	Santo Domingo Tomaltepec	1
1523	20	520	Santo Domingo Tonalá	1
1524	20	521	Santo Domingo Tonaltepec	1
1525	20	522	Santo Domingo Xagacía	1
1526	20	523	Santo Domingo Yanhuitlán	1
1527	20	524	Santo Domingo Yodohino	1
1528	20	525	Santo Domingo Zanatepec	1
1529	20	526	Santos Reyes Nopala	1
1530	20	527	Santos Reyes Pápalo	1
1531	20	528	Santos Reyes Tepejillo	1
1532	20	529	Santos Reyes Yucuná	1
1533	20	530	Santo Tomás Jalieza	1
1534	20	531	Santo Tomás Mazaltepec	1
1535	20	532	Santo Tomás Ocotepec	1
1536	20	533	Santo Tomás Tamazulapan	1
1537	20	534	San Vicente Coatlán	1
1538	20	535	San Vicente Lachixío	1
1539	20	536	San Vicente Nuñú	1
1540	20	537	Silacayoápam	1
1541	20	538	Sitio de Xitlapehua	1
1542	20	539	Soledad Etla	1
1543	20	540	Villa de Tamazulápam del Progreso	1
1544	20	541	Tanetze de Zaragoza	1
1545	20	542	Taniche	1
1546	20	543	Tataltepec de Valdés	1
1547	20	544	Teococuilco de Marcos Pérez	1
1548	20	545	Teotitlán de Flores Magón	1
1549	20	546	Teotitlán del Valle	1
1550	20	547	Teotongo	1
1551	20	548	Tepelmeme Villa de Morelos	1
1552	20	549	Heroica Villa Tezoatlán de Segura y Luna, Cuna de la Independencia de Oaxaca	1
1553	20	550	San Jerónimo Tlacochahuaya	1
1554	20	551	Tlacolula de Matamoros	1
1555	20	552	Tlacotepec Plumas	1
1556	20	553	Tlalixtac de Cabrera	1
1557	20	554	Totontepec Villa de Morelos	1
1558	20	555	Trinidad Zaachila	1
1559	20	556	La Trinidad Vista Hermosa	1
1560	20	557	Unión Hidalgo	1
1561	20	558	Valerio Trujano	1
1562	20	559	San Juan Bautista Valle Nacional	1
1563	20	560	Villa Díaz Ordaz	1
1564	20	561	Yaxe	1
1565	20	562	Magdalena Yodocono de Porfirio Díaz	1
1566	20	563	Yogana	1
1567	20	564	Yutanduchi de Guerrero	1
1568	20	565	Villa de Zaachila	1
1569	20	566	San Mateo Yucutindoo	1
1570	20	567	Zapotitlán Lagunas	1
1571	20	568	Zapotitlán Palmas	1
1572	20	569	Santa Inés de Zaragoza	1
1573	20	570	Zimatlán de Álvarez	1
1574	21	001	Acajete	1
1575	21	002	Acateno	1
1576	21	003	Acatlán	1
1577	21	004	Acatzingo	1
1578	21	005	Acteopan	1
1579	21	006	Ahuacatlán	1
1580	21	007	Ahuatlán	1
1581	21	008	Ahuazotepec	1
1582	21	009	Ahuehuetitla	1
1583	21	010	Ajalpan	1
1584	21	011	Albino Zertuche	1
1585	21	012	Aljojuca	1
1586	21	013	Altepexi	1
1587	21	014	Amixtlán	1
1588	21	015	Amozoc	1
1589	21	016	Aquixtla	1
1590	21	017	Atempan	1
1591	21	018	Atexcal	1
1592	21	019	Atlixco	1
1593	21	020	Atoyatempan	1
1594	21	021	Atzala	1
1595	21	022	Atzitzihuacán	1
1596	21	023	Atzitzintla	1
1597	21	024	Axutla	1
1598	21	025	Ayotoxco de Guerrero	1
1599	21	026	Calpan	1
1600	21	027	Caltepec	1
1601	21	028	Camocuautla	1
1602	21	029	Caxhuacan	1
1603	21	030	Coatepec	1
1604	21	031	Coatzingo	1
1605	21	032	Cohetzala	1
1606	21	033	Cohuecan	1
1607	21	034	Coronango	1
1608	21	035	Coxcatlán	1
1609	21	036	Coyomeapan	1
1610	21	037	Coyotepec	1
1611	21	038	Cuapiaxtla de Madero	1
1612	21	039	Cuautempan	1
1613	21	040	Cuautinchán	1
1614	21	041	Cuautlancingo	1
1615	21	042	Cuayuca de Andrade	1
1616	21	043	Cuetzalan del Progreso	1
1617	21	044	Cuyoaco	1
1618	21	045	Chalchicomula de Sesma	1
1619	21	046	Chapulco	1
1620	21	047	Chiautla	1
1621	21	048	Chiautzingo	1
1622	21	049	Chiconcuautla	1
1623	21	050	Chichiquila	1
1624	21	051	Chietla	1
1625	21	052	Chigmecatitlán	1
1626	21	053	Chignahuapan	1
1627	21	054	Chignautla	1
1628	21	055	Chila	1
1629	21	056	Chila de la Sal	1
1630	21	057	Honey	1
1631	21	058	Chilchotla	1
1632	21	059	Chinantla	1
1633	21	060	Domingo Arenas	1
1634	21	061	Eloxochitlán	1
1635	21	062	Epatlán	1
1636	21	063	Esperanza	1
1637	21	064	Francisco Z. Mena	1
1638	21	065	General Felipe Ángeles	1
1639	21	066	Guadalupe	1
1640	21	067	Guadalupe Victoria	1
1641	21	068	Hermenegildo Galeana	1
1642	21	069	Huaquechula	1
1643	21	070	Huatlatlauca	1
1644	21	071	Huauchinango	1
1645	21	072	Huehuetla	1
1646	21	073	Huehuetlán el Chico	1
1647	21	074	Huejotzingo	1
1648	21	075	Hueyapan	1
1649	21	076	Hueytamalco	1
1650	21	077	Hueytlalpan	1
1651	21	078	Huitzilan de Serdán	1
1652	21	079	Huitziltepec	1
1653	21	080	Atlequizayan	1
1654	21	081	Ixcamilpa de Guerrero	1
1655	21	082	Ixcaquixtla	1
1656	21	083	Ixtacamaxtitlán	1
1657	21	084	Ixtepec	1
1658	21	085	Izúcar de Matamoros	1
1659	21	086	Jalpan	1
1660	21	087	Jolalpan	1
1661	21	088	Jonotla	1
1662	21	089	Jopala	1
1663	21	090	Juan C. Bonilla	1
1664	21	091	Juan Galindo	1
1665	21	092	Juan N. Méndez	1
1666	21	093	Lafragua	1
1667	21	094	Libres	1
1668	21	095	La Magdalena Tlatlauquitepec	1
1669	21	096	Mazapiltepec de Juárez	1
1670	21	097	Mixtla	1
1671	21	098	Molcaxac	1
1672	21	099	Cañada Morelos	1
1673	21	100	Naupan	1
1674	21	101	Nauzontla	1
1675	21	102	Nealtican	1
1676	21	103	Nicolás Bravo	1
1677	21	104	Nopalucan	1
1678	21	105	Ocotepec	1
1679	21	106	Ocoyucan	1
1680	21	107	Olintla	1
1681	21	108	Oriental	1
1682	21	109	Pahuatlán	1
1683	21	110	Palmar de Bravo	1
1684	21	111	Pantepec	1
1685	21	112	Petlalcingo	1
1686	21	113	Piaxtla	1
1687	21	114	Puebla	1
1688	21	115	Quecholac	1
1689	21	116	Quimixtlán	1
1690	21	117	Rafael Lara Grajales	1
1691	21	118	Los Reyes de Juárez	1
1692	21	119	San Andrés Cholula	1
1693	21	120	San Antonio Cañada	1
1694	21	121	San Diego la Mesa Tochimiltzingo	1
1695	21	122	San Felipe Teotlalcingo	1
1696	21	123	San Felipe Tepatlán	1
1697	21	124	San Gabriel Chilac	1
1698	21	125	San Gregorio Atzompa	1
1699	21	126	San Jerónimo Tecuanipan	1
1700	21	127	San Jerónimo Xayacatlán	1
1701	21	128	San José Chiapa	1
1702	21	129	San José Miahuatlán	1
1703	21	130	San Juan Atenco	1
1704	21	131	San Juan Atzompa	1
1705	21	132	San Martín Texmelucan	1
1706	21	133	San Martín Totoltepec	1
1707	21	134	San Matías Tlalancaleca	1
1708	21	135	San Miguel Ixitlán	1
1709	21	136	San Miguel Xoxtla	1
1710	21	137	San Nicolás Buenos Aires	1
1711	21	138	San Nicolás de los Ranchos	1
1712	21	139	San Pablo Anicano	1
1713	21	140	San Pedro Cholula	1
1714	21	141	San Pedro Yeloixtlahuaca	1
1715	21	142	San Salvador el Seco	1
1716	21	143	San Salvador el Verde	1
1717	21	144	San Salvador Huixcolotla	1
1718	21	145	San Sebastián Tlacotepec	1
1719	21	146	Santa Catarina Tlaltempan	1
1720	21	147	Santa Inés Ahuatempan	1
1721	21	148	Santa Isabel Cholula	1
1722	21	149	Santiago Miahuatlán	1
1723	21	150	Huehuetlán el Grande	1
1724	21	151	Santo Tomás Hueyotlipan	1
1725	21	152	Soltepec	1
1726	21	153	Tecali de Herrera	1
1727	21	154	Tecamachalco	1
1728	21	155	Tecomatlán	1
1729	21	156	Tehuacán	1
1730	21	157	Tehuitzingo	1
1731	21	158	Tenampulco	1
1732	21	159	Teopantlán	1
1733	21	160	Teotlalco	1
1734	21	161	Tepanco de López	1
1735	21	162	Tepango de Rodríguez	1
1736	21	163	Tepatlaxco de Hidalgo	1
1737	21	164	Tepeaca	1
1738	21	165	Tepemaxalco	1
1739	21	166	Tepeojuma	1
1740	21	167	Tepetzintla	1
1741	21	168	Tepexco	1
1742	21	169	Tepexi de Rodríguez	1
1743	21	170	Tepeyahualco	1
1744	21	171	Tepeyahualco de Cuauhtémoc	1
1745	21	172	Tetela de Ocampo	1
1746	21	173	Teteles de Avila Castillo	1
1747	21	174	Teziutlán	1
1748	21	175	Tianguismanalco	1
1749	21	176	Tilapa	1
1750	21	177	Tlacotepec de Benito Juárez	1
1751	21	178	Tlacuilotepec	1
1752	21	179	Tlachichuca	1
1753	21	180	Tlahuapan	1
1754	21	181	Tlaltenango	1
1755	21	182	Tlanepantla	1
1756	21	183	Tlaola	1
1757	21	184	Tlapacoya	1
1758	21	185	Tlapanalá	1
1759	21	186	Tlatlauquitepec	1
1760	21	187	Tlaxco	1
1761	21	188	Tochimilco	1
1762	21	189	Tochtepec	1
1763	21	190	Totoltepec de Guerrero	1
1764	21	191	Tulcingo	1
1765	21	192	Tuzamapan de Galeana	1
1766	21	193	Tzicatlacoyan	1
1767	21	194	Venustiano Carranza	1
1768	21	195	Vicente Guerrero	1
1769	21	196	Xayacatlán de Bravo	1
1770	21	197	Xicotepec	1
1771	21	198	Xicotlán	1
1772	21	199	Xiutetelco	1
1773	21	200	Xochiapulco	1
1774	21	201	Xochiltepec	1
1775	21	202	Xochitlán de Vicente Suárez	1
1776	21	203	Xochitlán Todos Santos	1
1777	21	204	Yaonáhuac	1
1778	21	205	Yehualtepec	1
1779	21	206	Zacapala	1
1780	21	207	Zacapoaxtla	1
1781	21	208	Zacatlán	1
1782	21	209	Zapotitlán	1
1783	21	210	Zapotitlán de Méndez	1
1784	21	211	Zaragoza	1
1785	21	212	Zautla	1
1786	21	213	Zihuateutla	1
1787	21	214	Zinacatepec	1
1788	21	215	Zongozotla	1
1789	21	216	Zoquiapan	1
1790	21	217	Zoquitlán	1
1791	22	001	Amealco de Bonfil	1
1792	22	002	Pinal de Amoles	1
1793	22	003	Arroyo Seco	1
1794	22	004	Cadereyta de Montes	1
1795	22	005	Colón	1
1796	22	006	Corregidora	1
1797	22	007	Ezequiel Montes	1
1798	22	008	Huimilpan	1
1799	22	009	Jalpan de Serra	1
1800	22	010	Landa de Matamoros	1
1801	22	011	El Marqués	1
1802	22	012	Pedro Escobedo	1
1803	22	013	Peñamiller	1
1804	22	014	Querétaro	1
1805	22	015	San Joaquín	1
1806	22	016	San Juan del Río	1
1807	22	017	Tequisquiapan	1
1808	22	018	Tolimán	1
1809	23	001	Cozumel	1
1810	23	002	Felipe Carrillo Puerto	1
1811	23	003	Isla Mujeres	1
1812	23	004	Othón P. Blanco	1
1813	23	005	Benito Juárez	1
1814	23	006	José María Morelos	1
1815	23	007	Lázaro Cárdenas	1
1816	23	008	Solidaridad	1
1817	23	009	Tulum	1
1818	23	010	Bacalar	1
1819	23	011	Puerto Morelos	1
1820	24	001	Ahualulco	1
1821	24	002	Alaquines	1
1822	24	003	Aquismón	1
1823	24	004	Armadillo de los Infante	1
1824	24	005	Cárdenas	1
1825	24	006	Catorce	1
1826	24	007	Cedral	1
1827	24	008	Cerritos	1
1828	24	009	Cerro de San Pedro	1
1829	24	010	Ciudad del Maíz	1
1830	24	011	Ciudad Fernández	1
1831	24	012	Tancanhuitz	1
1832	24	013	Ciudad Valles	1
1833	24	014	Coxcatlán	1
1834	24	015	Charcas	1
1835	24	016	Ebano	1
1836	24	017	Guadalcázar	1
1837	24	018	Huehuetlán	1
1838	24	019	Lagunillas	1
1839	24	020	Matehuala	1
1840	24	021	Mexquitic de Carmona	1
1841	24	022	Moctezuma	1
1842	24	023	Rayón	1
1843	24	024	Rioverde	1
1844	24	025	Salinas	1
1845	24	026	San Antonio	1
1846	24	027	San Ciro de Acosta	1
1847	24	028	San Luis Potosí	1
1848	24	029	San Martín Chalchicuautla	1
1849	24	030	San Nicolás Tolentino	1
1850	24	031	Santa Catarina	1
1851	24	032	Santa María del Río	1
1852	24	033	Santo Domingo	1
1853	24	034	San Vicente Tancuayalab	1
1854	24	035	Soledad de Graciano Sánchez	1
1855	24	036	Tamasopo	1
1856	24	037	Tamazunchale	1
1857	24	038	Tampacán	1
1858	24	039	Tampamolón Corona	1
1859	24	040	Tamuín	1
1860	24	041	Tanlajás	1
1861	24	042	Tanquián de Escobedo	1
1862	24	043	Tierra Nueva	1
1863	24	044	Vanegas	1
1864	24	045	Venado	1
1865	24	046	Villa de Arriaga	1
1866	24	047	Villa de Guadalupe	1
1867	24	048	Villa de la Paz	1
1868	24	049	Villa de Ramos	1
1869	24	050	Villa de Reyes	1
1870	24	051	Villa Hidalgo	1
1871	24	052	Villa Juárez	1
1872	24	053	Axtla de Terrazas	1
1873	24	054	Xilitla	1
1874	24	055	Zaragoza	1
1875	24	056	Villa de Arista	1
1876	24	057	Matlapa	1
1877	24	058	El Naranjo	1
1878	25	001	Ahome	1
1879	25	002	Angostura	1
1880	25	003	Badiraguato	1
1881	25	004	Concordia	1
1882	25	005	Cosalá	1
1883	25	006	Culiacán	1
1884	25	007	Choix	1
1885	25	008	Elota	1
1886	25	009	Escuinapa	1
1887	25	010	El Fuerte	1
1888	25	011	Guasave	1
1889	25	012	Mazatlán	1
1890	25	013	Mocorito	1
1891	25	014	Rosario	1
1892	25	015	Salvador Alvarado	1
1893	25	016	San Ignacio	1
1894	25	017	Sinaloa	1
1895	25	018	Navolato	1
1896	26	001	Aconchi	1
1897	26	002	Agua Prieta	1
1898	26	003	Alamos	1
1899	26	004	Altar	1
1900	26	005	Arivechi	1
1901	26	006	Arizpe	1
1902	26	007	Atil	1
1903	26	008	Bacadéhuachi	1
1904	26	009	Bacanora	1
1905	26	010	Bacerac	1
1906	26	011	Bacoachi	1
1907	26	012	Bácum	1
1908	26	013	Banámichi	1
1909	26	014	Baviácora	1
1910	26	015	Bavispe	1
1911	26	016	Benjamín Hill	1
1912	26	017	Caborca	1
1913	26	018	Cajeme	1
1914	26	019	Cananea	1
1915	26	020	Carbó	1
1916	26	021	La Colorada	1
1917	26	022	Cucurpe	1
1918	26	023	Cumpas	1
1919	26	024	Divisaderos	1
1920	26	025	Empalme	1
1921	26	026	Etchojoa	1
1922	26	027	Fronteras	1
1923	26	028	Granados	1
1924	26	029	Guaymas	1
1925	26	030	Hermosillo	1
1926	26	031	Huachinera	1
1927	26	032	Huásabas	1
1928	26	033	Huatabampo	1
1929	26	034	Huépac	1
1930	26	035	Imuris	1
1931	26	036	Magdalena	1
1932	26	037	Mazatán	1
1933	26	038	Moctezuma	1
1934	26	039	Naco	1
1935	26	040	Nácori Chico	1
1936	26	041	Nacozari de García	1
1937	26	042	Navojoa	1
1938	26	043	Nogales	1
1939	26	044	Onavas	1
1940	26	045	Opodepe	1
1941	26	046	Oquitoa	1
1942	26	047	Pitiquito	1
1943	26	048	Puerto Peñasco	1
1944	26	049	Quiriego	1
1945	26	050	Rayón	1
1946	26	051	Rosario	1
1947	26	052	Sahuaripa	1
1948	26	053	San Felipe de Jesús	1
1949	26	054	San Javier	1
1950	26	055	San Luis Río Colorado	1
1951	26	056	San Miguel de Horcasitas	1
1952	26	057	San Pedro de la Cueva	1
1953	26	058	Santa Ana	1
1954	26	059	Santa Cruz	1
1955	26	060	Sáric	1
1956	26	061	Soyopa	1
1957	26	062	Suaqui Grande	1
1958	26	063	Tepache	1
1959	26	064	Trincheras	1
1960	26	065	Tubutama	1
1961	26	066	Ures	1
1962	26	067	Villa Hidalgo	1
1963	26	068	Villa Pesqueira	1
1964	26	069	Yécora	1
1965	26	070	General Plutarco Elías Calles	1
1966	26	071	Benito Juárez	1
1967	26	072	San Ignacio Río Muerto	1
1968	27	001	Balancán	1
1969	27	002	Cárdenas	1
1970	27	003	Centla	1
1971	27	004	Centro	1
1972	27	005	Comalcalco	1
1973	27	006	Cunduacán	1
1974	27	007	Emiliano Zapata	1
1975	27	008	Huimanguillo	1
1976	27	009	Jalapa	1
1977	27	010	Jalpa de Méndez	1
1978	27	011	Jonuta	1
1979	27	012	Macuspana	1
1980	27	013	Nacajuca	1
1981	27	014	Paraíso	1
1982	27	015	Tacotalpa	1
1983	27	016	Teapa	1
1984	27	017	Tenosique	1
1985	28	001	Abasolo	1
1986	28	002	Aldama	1
1987	28	003	Altamira	1
1988	28	004	Antiguo Morelos	1
1989	28	005	Burgos	1
1990	28	006	Bustamante	1
1991	28	007	Camargo	1
1992	28	008	Casas	1
1993	28	009	Ciudad Madero	1
1994	28	010	Cruillas	1
1995	28	011	Gómez Farías	1
1996	28	012	González	1
1997	28	013	Güémez	1
1998	28	014	Guerrero	1
1999	28	015	Gustavo Díaz Ordaz	1
2000	28	016	Hidalgo	1
2001	28	017	Jaumave	1
2002	28	018	Jiménez	1
2003	28	019	Llera	1
2004	28	020	Mainero	1
2005	28	021	El Mante	1
2006	28	022	Matamoros	1
2007	28	023	Méndez	1
2008	28	024	Mier	1
2009	28	025	Miguel Alemán	1
2010	28	026	Miquihuana	1
2011	28	027	Nuevo Laredo	1
2012	28	028	Nuevo Morelos	1
2013	28	029	Ocampo	1
2014	28	030	Padilla	1
2015	28	031	Palmillas	1
2016	28	032	Reynosa	1
2017	28	033	Río Bravo	1
2018	28	034	San Carlos	1
2019	28	035	San Fernando	1
2020	28	036	San Nicolás	1
2021	28	037	Soto la Marina	1
2022	28	038	Tampico	1
2023	28	039	Tula	1
2024	28	040	Valle Hermoso	1
2025	28	041	Victoria	1
2026	28	042	Villagrán	1
2027	28	043	Xicoténcatl	1
2028	29	001	Amaxac de Guerrero	1
2029	29	002	Apetatitlán de Antonio Carvajal	1
2030	29	003	Atlangatepec	1
2031	29	004	Atltzayanca	1
2032	29	005	Apizaco	1
2033	29	006	Calpulalpan	1
2034	29	007	El Carmen Tequexquitla	1
2035	29	008	Cuapiaxtla	1
2036	29	009	Cuaxomulco	1
2037	29	010	Chiautempan	1
2038	29	011	Muñoz de Domingo Arenas	1
2039	29	012	Españita	1
2040	29	013	Huamantla	1
2041	29	014	Hueyotlipan	1
2042	29	015	Ixtacuixtla de Mariano Matamoros	1
2043	29	016	Ixtenco	1
2044	29	017	Mazatecochco de José María Morelos	1
2045	29	018	Contla de Juan Cuamatzi	1
2046	29	019	Tepetitla de Lardizábal	1
2047	29	020	Sanctórum de Lázaro Cárdenas	1
2048	29	021	Nanacamilpa de Mariano Arista	1
2049	29	022	Acuamanala de Miguel Hidalgo	1
2050	29	023	Natívitas	1
2051	29	024	Panotla	1
2052	29	025	San Pablo del Monte	1
2053	29	026	Santa Cruz Tlaxcala	1
2054	29	027	Tenancingo	1
2055	29	028	Teolocholco	1
2056	29	029	Tepeyanco	1
2057	29	030	Terrenate	1
2058	29	031	Tetla de la Solidaridad	1
2059	29	032	Tetlatlahuca	1
2060	29	033	Tlaxcala	1
2061	29	034	Tlaxco	1
2062	29	035	Tocatlán	1
2063	29	036	Totolac	1
2064	29	037	Ziltlaltépec de Trinidad Sánchez Santos	1
2065	29	038	Tzompantepec	1
2066	29	039	Xaloztoc	1
2067	29	040	Xaltocan	1
2068	29	041	Papalotla de Xicohténcatl	1
2069	29	042	Xicohtzinco	1
2070	29	043	Yauhquemehcan	1
2071	29	044	Zacatelco	1
2072	29	045	Benito Juárez	1
2073	29	046	Emiliano Zapata	1
2074	29	047	Lázaro Cárdenas	1
2075	29	048	La Magdalena Tlaltelulco	1
2076	29	049	San Damián Texóloc	1
2077	29	050	San Francisco Tetlanohcan	1
2078	29	051	San Jerónimo Zacualpan	1
2079	29	052	San José Teacalco	1
2080	29	053	San Juan Huactzinco	1
2081	29	054	San Lorenzo Axocomanitla	1
2082	29	055	San Lucas Tecopilco	1
2083	29	056	Santa Ana Nopalucan	1
2084	29	057	Santa Apolonia Teacalco	1
2085	29	058	Santa Catarina Ayometla	1
2086	29	059	Santa Cruz Quilehtla	1
2087	29	060	Santa Isabel Xiloxoxtla	1
2088	30	001	Acajete	1
2089	30	002	Acatlán	1
2090	30	003	Acayucan	1
2091	30	004	Actopan	1
2092	30	005	Acula	1
2093	30	006	Acultzingo	1
2094	30	007	Camarón de Tejeda	1
2095	30	008	Alpatláhuac	1
2096	30	009	Alto Lucero de Gutiérrez Barrios	1
2097	30	010	Altotonga	1
2098	30	011	Alvarado	1
2099	30	012	Amatitlán	1
2100	30	013	Naranjos Amatlán	1
2101	30	014	Amatlán de los Reyes	1
2102	30	015	Angel R. Cabada	1
2103	30	016	La Antigua	1
2104	30	017	Apazapan	1
2105	30	018	Aquila	1
2106	30	019	Astacinga	1
2107	30	020	Atlahuilco	1
2108	30	021	Atoyac	1
2109	30	022	Atzacan	1
2110	30	023	Atzalan	1
2111	30	024	Tlaltetela	1
2112	30	025	Ayahualulco	1
2113	30	026	Banderilla	1
2114	30	027	Benito Juárez	1
2115	30	028	Boca del Río	1
2116	30	029	Calcahualco	1
2117	30	030	Camerino Z. Mendoza	1
2118	30	031	Carrillo Puerto	1
2119	30	032	Catemaco	1
2120	30	033	Cazones de Herrera	1
2121	30	034	Cerro Azul	1
2122	30	035	Citlaltépetl	1
2123	30	036	Coacoatzintla	1
2124	30	037	Coahuitlán	1
2125	30	038	Coatepec	1
2126	30	039	Coatzacoalcos	1
2127	30	040	Coatzintla	1
2128	30	041	Coetzala	1
2129	30	042	Colipa	1
2130	30	043	Comapa	1
2131	30	044	Córdoba	1
2132	30	045	Cosamaloapan de Carpio	1
2133	30	046	Cosautlán de Carvajal	1
2134	30	047	Coscomatepec	1
2135	30	048	Cosoleacaque	1
2136	30	049	Cotaxtla	1
2137	30	050	Coxquihui	1
2138	30	051	Coyutla	1
2139	30	052	Cuichapa	1
2140	30	053	Cuitláhuac	1
2141	30	054	Chacaltianguis	1
2142	30	055	Chalma	1
2143	30	056	Chiconamel	1
2144	30	057	Chiconquiaco	1
2145	30	058	Chicontepec	1
2146	30	059	Chinameca	1
2147	30	060	Chinampa de Gorostiza	1
2148	30	061	Las Choapas	1
2149	30	062	Chocamán	1
2150	30	063	Chontla	1
2151	30	064	Chumatlán	1
2152	30	065	Emiliano Zapata	1
2153	30	066	Espinal	1
2154	30	067	Filomeno Mata	1
2155	30	068	Fortín	1
2156	30	069	Gutiérrez Zamora	1
2157	30	070	Hidalgotitlán	1
2158	30	071	Huatusco	1
2159	30	072	Huayacocotla	1
2160	30	073	Hueyapan de Ocampo	1
2161	30	074	Huiloapan de Cuauhtémoc	1
2162	30	075	Ignacio de la Llave	1
2163	30	076	Ilamatlán	1
2164	30	077	Isla	1
2165	30	078	Ixcatepec	1
2166	30	079	Ixhuacán de los Reyes	1
2167	30	080	Ixhuatlán del Café	1
2168	30	081	Ixhuatlancillo	1
2169	30	082	Ixhuatlán del Sureste	1
2170	30	083	Ixhuatlán de Madero	1
2171	30	084	Ixmatlahuacan	1
2172	30	085	Ixtaczoquitlán	1
2173	30	086	Jalacingo	1
2174	30	087	Xalapa	1
2175	30	088	Jalcomulco	1
2176	30	089	Jáltipan	1
2177	30	090	Jamapa	1
2178	30	091	Jesús Carranza	1
2179	30	092	Xico	1
2180	30	093	Jilotepec	1
2181	30	094	Juan Rodríguez Clara	1
2182	30	095	Juchique de Ferrer	1
2183	30	096	Landero y Coss	1
2184	30	097	Lerdo de Tejada	1
2185	30	098	Magdalena	1
2186	30	099	Maltrata	1
2187	30	100	Manlio Fabio Altamirano	1
2188	30	101	Mariano Escobedo	1
2189	30	102	Martínez de la Torre	1
2190	30	103	Mecatlán	1
2191	30	104	Mecayapan	1
2192	30	105	Medellín de Bravo	1
2193	30	106	Miahuatlán	1
2194	30	107	Las Minas	1
2195	30	108	Minatitlán	1
2196	30	109	Misantla	1
2197	30	110	Mixtla de Altamirano	1
2198	30	111	Moloacán	1
2199	30	112	Naolinco	1
2200	30	113	Naranjal	1
2201	30	114	Nautla	1
2202	30	115	Nogales	1
2203	30	116	Oluta	1
2204	30	117	Omealca	1
2205	30	118	Orizaba	1
2206	30	119	Otatitlán	1
2207	30	120	Oteapan	1
2208	30	121	Ozuluama de Mascareñas	1
2209	30	122	Pajapan	1
2210	30	123	Pánuco	1
2211	30	124	Papantla	1
2212	30	125	Paso del Macho	1
2213	30	126	Paso de Ovejas	1
2214	30	127	La Perla	1
2215	30	128	Perote	1
2216	30	129	Platón Sánchez	1
2217	30	130	Playa Vicente	1
2218	30	131	Poza Rica de Hidalgo	1
2219	30	132	Las Vigas de Ramírez	1
2220	30	133	Pueblo Viejo	1
2221	30	134	Puente Nacional	1
2222	30	135	Rafael Delgado	1
2223	30	136	Rafael Lucio	1
2224	30	137	Los Reyes	1
2225	30	138	Río Blanco	1
2226	30	139	Saltabarranca	1
2227	30	140	San Andrés Tenejapan	1
2228	30	141	San Andrés Tuxtla	1
2229	30	142	San Juan Evangelista	1
2230	30	143	Santiago Tuxtla	1
2231	30	144	Sayula de Alemán	1
2232	30	145	Soconusco	1
2233	30	146	Sochiapa	1
2234	30	147	Soledad Atzompa	1
2235	30	148	Soledad de Doblado	1
2236	30	149	Soteapan	1
2237	30	150	Tamalín	1
2238	30	151	Tamiahua	1
2239	30	152	Tampico Alto	1
2240	30	153	Tancoco	1
2241	30	154	Tantima	1
2242	30	155	Tantoyuca	1
2243	30	156	Tatatila	1
2244	30	157	Castillo de Teayo	1
2245	30	158	Tecolutla	1
2246	30	159	Tehuipango	1
2247	30	160	Álamo Temapache	1
2248	30	161	Tempoal	1
2249	30	162	Tenampa	1
2250	30	163	Tenochtitlán	1
2251	30	164	Teocelo	1
2252	30	165	Tepatlaxco	1
2253	30	166	Tepetlán	1
2254	30	167	Tepetzintla	1
2255	30	168	Tequila	1
2256	30	169	José Azueta	1
2257	30	170	Texcatepec	1
2258	30	171	Texhuacán	1
2259	30	172	Texistepec	1
2260	30	173	Tezonapa	1
2261	30	174	Tierra Blanca	1
2262	30	175	Tihuatlán	1
2263	30	176	Tlacojalpan	1
2264	30	177	Tlacolulan	1
2265	30	178	Tlacotalpan	1
2266	30	179	Tlacotepec de Mejía	1
2267	30	180	Tlachichilco	1
2268	30	181	Tlalixcoyan	1
2269	30	182	Tlalnelhuayocan	1
2270	30	183	Tlapacoyan	1
2271	30	184	Tlaquilpa	1
2272	30	185	Tlilapan	1
2273	30	186	Tomatlán	1
2274	30	187	Tonayán	1
2275	30	188	Totutla	1
2276	30	189	Tuxpan	1
2277	30	190	Tuxtilla	1
2278	30	191	Ursulo Galván	1
2279	30	192	Vega de Alatorre	1
2280	30	193	Veracruz	1
2281	30	194	Villa Aldama	1
2282	30	195	Xoxocotla	1
2283	30	196	Yanga	1
2284	30	197	Yecuatla	1
2285	30	198	Zacualpan	1
2286	30	199	Zaragoza	1
2287	30	200	Zentla	1
2288	30	201	Zongolica	1
2289	30	202	Zontecomatlán de López y Fuentes	1
2290	30	203	Zozocolco de Hidalgo	1
2291	30	204	Agua Dulce	1
2292	30	205	El Higo	1
2293	30	206	Nanchital de Lázaro Cárdenas del Río	1
2294	30	207	Tres Valles	1
2295	30	208	Carlos A. Carrillo	1
2296	30	209	Tatahuicapan de Juárez	1
2297	30	210	Uxpanapa	1
2298	30	211	San Rafael	1
2299	30	212	Santiago Sochiapan	1
2300	31	001	Abalá	1
2301	31	002	Acanceh	1
2302	31	003	Akil	1
2303	31	004	Baca	1
2304	31	005	Bokobá	1
2305	31	006	Buctzotz	1
2306	31	007	Cacalchén	1
2307	31	008	Calotmul	1
2308	31	009	Cansahcab	1
2309	31	010	Cantamayec	1
2310	31	011	Celestún	1
2311	31	012	Cenotillo	1
2312	31	013	Conkal	1
2313	31	014	Cuncunul	1
2314	31	015	Cuzamá	1
2315	31	016	Chacsinkín	1
2316	31	017	Chankom	1
2317	31	018	Chapab	1
2318	31	019	Chemax	1
2319	31	020	Chicxulub Pueblo	1
2320	31	021	Chichimilá	1
2321	31	022	Chikindzonot	1
2322	31	023	Chocholá	1
2323	31	024	Chumayel	1
2324	31	025	Dzán	1
2325	31	026	Dzemul	1
2326	31	027	Dzidzantún	1
2327	31	028	Dzilam de Bravo	1
2328	31	029	Dzilam González	1
2329	31	030	Dzitás	1
2330	31	031	Dzoncauich	1
2331	31	032	Espita	1
2332	31	033	Halachó	1
2333	31	034	Hocabá	1
2334	31	035	Hoctún	1
2335	31	036	Homún	1
2336	31	037	Huhí	1
2337	31	038	Hunucmá	1
2338	31	039	Ixil	1
2339	31	040	Izamal	1
2340	31	041	Kanasín	1
2341	31	042	Kantunil	1
2342	31	043	Kaua	1
2343	31	044	Kinchil	1
2344	31	045	Kopomá	1
2345	31	046	Mama	1
2346	31	047	Maní	1
2347	31	048	Maxcanú	1
2348	31	049	Mayapán	1
2349	31	050	Mérida	1
2350	31	051	Mocochá	1
2351	31	052	Motul	1
2352	31	053	Muna	1
2353	31	054	Muxupip	1
2354	31	055	Opichén	1
2355	31	056	Oxkutzcab	1
2356	31	057	Panabá	1
2357	31	058	Peto	1
2358	31	059	Progreso	1
2359	31	060	Quintana Roo	1
2360	31	061	Río Lagartos	1
2361	31	062	Sacalum	1
2362	31	063	Samahil	1
2363	31	064	Sanahcat	1
2364	31	065	San Felipe	1
2365	31	066	Santa Elena	1
2366	31	067	Seyé	1
2367	31	068	Sinanché	1
2368	31	069	Sotuta	1
2369	31	070	Sucilá	1
2370	31	071	Sudzal	1
2371	31	072	Suma	1
2372	31	073	Tahdziú	1
2373	31	074	Tahmek	1
2374	31	075	Teabo	1
2375	31	076	Tecoh	1
2376	31	077	Tekal de Venegas	1
2377	31	078	Tekantó	1
2378	31	079	Tekax	1
2379	31	080	Tekit	1
2380	31	081	Tekom	1
2381	31	082	Telchac Pueblo	1
2382	31	083	Telchac Puerto	1
2383	31	084	Temax	1
2384	31	085	Temozón	1
2385	31	086	Tepakán	1
2386	31	087	Tetiz	1
2387	31	088	Teya	1
2388	31	089	Ticul	1
2389	31	090	Timucuy	1
2390	31	091	Tinum	1
2391	31	092	Tixcacalcupul	1
2392	31	093	Tixkokob	1
2393	31	094	Tixmehuac	1
2394	31	095	Tixpéhual	1
2395	31	096	Tizimín	1
2396	31	097	Tunkás	1
2397	31	098	Tzucacab	1
2398	31	099	Uayma	1
2399	31	100	Ucú	1
2400	31	101	Umán	1
2401	31	102	Valladolid	1
2402	31	103	Xocchel	1
2403	31	104	Yaxcabá	1
2404	31	105	Yaxkukul	1
2405	31	106	Yobaín	1
2406	32	001	Apozol	1
2407	32	002	Apulco	1
2408	32	003	Atolinga	1
2409	32	004	Benito Juárez	1
2410	32	005	Calera	1
2411	32	006	Cañitas de Felipe Pescador	1
2412	32	007	Concepción del Oro	1
2413	32	008	Cuauhtémoc	1
2414	32	009	Chalchihuites	1
2415	32	010	Fresnillo	1
2416	32	011	Trinidad García de la Cadena	1
2417	32	012	Genaro Codina	1
2418	32	013	General Enrique Estrada	1
2419	32	014	General Francisco R. Murguía	1
2420	32	015	El Plateado de Joaquín Amaro	1
2421	32	016	General Pánfilo Natera	1
2422	32	017	Guadalupe	1
2423	32	018	Huanusco	1
2424	32	019	Jalpa	1
2425	32	020	Jerez	1
2426	32	021	Jiménez del Teul	1
2427	32	022	Juan Aldama	1
2428	32	023	Juchipila	1
2429	32	024	Loreto	1
2430	32	025	Luis Moya	1
2431	32	026	Mazapil	1
2432	32	027	Melchor Ocampo	1
2433	32	028	Mezquital del Oro	1
2434	32	029	Miguel Auza	1
2435	32	030	Momax	1
2436	32	031	Monte Escobedo	1
2437	32	032	Morelos	1
2438	32	033	Moyahua de Estrada	1
2439	32	034	Nochistlán de Mejía	1
2440	32	035	Noria de Ángeles	1
2441	32	036	Ojocaliente	1
2442	32	037	Pánuco	1
2443	32	038	Pinos	1
2444	32	039	Río Grande	1
2445	32	040	Sain Alto	1
2446	32	041	El Salvador	1
2447	32	042	Sombrerete	1
2448	32	043	Susticacán	1
2449	32	044	Tabasco	1
2450	32	045	Tepechitlán	1
2451	32	046	Tepetongo	1
2452	32	047	Teúl de González Ortega	1
2453	32	048	Tlaltenango de Sánchez Román	1
2454	32	049	Valparaíso	1
2455	32	050	Vetagrande	1
2456	32	051	Villa de Cos	1
2457	32	052	Villa García	1
2458	32	053	Villa González Ortega	1
2459	32	054	Villa Hidalgo	1
2460	32	055	Villanueva	1
2461	32	056	Zacatecas	1
2462	32	057	Trancoso	1
2463	32	058	Santa María de la Paz	1
\.


--
-- Data for Name: paciente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paciente (curp, nombre, edad, dir, tel, idestado, idmunicipio) FROM stdin;
ABHA911215	ABAD HERNANDEZ ALDO	19	conocida	55555555	\N	\N
ACEC890217	APARICIO CORAZA ELOISA CONSUELO	21	conocida	55555555	\N	\N
ACNC880920	AVILA COLIN NURIA DEL CARMEN	22	conocida	55555555	\N	\N
AGRK800719	AGUILAR RUIZ KEYLA	23	Campo Deportivo 618	7198835	\N	\N
AMAU890611	ARVIZU MENDOZA AGUSTIN URIEL	21	conocida	55555555	\N	\N
AMDI890318	ARELLANES MOLINA DAMIAN ISAID	22	conocida	55555555	\N	\N
APJC880522	AGUILA PEREZ JUAN CARLOS	22	conocida	55555555	\N	\N
AZHE900116	AGUILAR ZUÑIGA HECTOR EFREN	20	conocida	55555555	\N	\N
BBJG881021	BENITEZ BAUTISTA JORGE GABRIEL	22	conocida	55555555	\N	\N
BLAB891122	BLANCO ALVAREZ BRENDA	21	conocida	55555555	\N	\N
BRAE880419	BRAVO ALVAREZ EDGAR	22	conocida	55555555	\N	\N
CAGA901223	CAZARES GOMEZ ALFREDO	20	conocida	55555555	\N	\N
CHJJ900321	CRUZ HERNANDEZ JOSE ALEJANDRO	20	conocida	55555555	\N	\N
CHPN890520	CHAVEZ HERNANDEZ PATRICIA NAYELY	21	conocida	55555555	\N	\N
COCE900621	COLIN CRUZ ERICK	20	conocida	55555555	\N	\N
CRCP910124	CRUZ CABALLERO PEDRO	19	conocida	55555555	\N	\N
DGYO910722	DELGADO GONZALEZ YAMIL OMAR	19	conocida	55555555	\N	\N
DHCH911102	DE HARO CASTILLO HECTOR	19	conocida	55555555	\N	\N
FALI911025	FUENTES ANGELES LINDA ISABEL	19	conocida	55555555	\N	\N
FEBJ920101	FERNANDEZ BENHUMEA JONATHAN	18	conocida	55555555	\N	\N
FMFE920225	FLORES MARTINEZ FABIAN ERNESTO	18	conocida	55555555	\N	\N
FRBL920221	FLORES RAMIREZ BLANCA LISET	18	conocida	55555555	\N	\N
FRRA920924	FRANCO ROJAS ALEJANDRO	18	conocida	55555555	\N	\N
FSAY910823	FLORES SALAS ANAYELI YADIRA	18	conocida	55555555	\N	\N
GAHA900528	GUTIERREZ ALVAREZ HECTOR ALBERTO	20	conocida	55555555	\N	\N
GARO750423	GARCIA RIOS OMAR	28	Leona Vicario 88	7121113	\N	\N
GGDJ891227	GOMEZ GONZALEZ DAVID JORGE	21	conocida	55555555	\N	\N
GHJA910326	GONZALEZ HERNANDEZ JOSE AUGUSTO	18	conocida	55555555	\N	\N
GMAL901126	GIL MALDONADO ANA LAURA	20	conocida	55555555	\N	\N
GOMF880128	GOMEZ MENESES FERNANDO	22	conocida	55555555	\N	\N
GOMM880229	GONZALEZ MARCOS MONSERRAT	22	conocida	55555555	\N	\N
GOPR740604	GOMEZ PABLO RAMIRO	29	Av. Los Prismas 988	7144187	\N	\N
GORF910427	GONZALEZ RIVERO FRANCISCO	19	conocida	55555555	\N	\N
GUOE890629	GUTIERREZ ORTINEZ EDUARDO	21	conocida	55555555	\N	\N
HCJC910312	HERNANDEZ CORTES JUAN CIPRIANO	19	conocida	55555555	\N	\N
HGKA880730	HERMOSILLO GARCIA KAREN ADRIANA	22	conocida	55555555	\N	\N
HLJR900604	HERNANDEZ LOPEZ JOSE ROGELIO	20	conocida	55555555	\N	\N
HMLC880831	HERNANDEZ MEJIA LUIS CARLOS	22	conocida	55555555	\N	\N
HSAE890330	HERNANDEZ SANCHEZ ABIGAIN ELISA	21	conocida	55555555	\N	\N
JSJD890901	JOAQUIN SANDOVAL JOSE DOMINGO	21	conocida	55555555	\N	\N
LARM901002	LANDERO REYES MAURICIO	20	conocida	55555555	\N	\N
LCJA890618	LINARES CERON JUAN ANTONIO	21	conocida	55555555	\N	\N
LEEE730315	LEZAMA ESTRADA ELIZABETH	30	Av. Fco. I Madero	7168802	\N	\N
LOPM760606	LOPEZ PALACIOS MIRIAM NAYELI	27	Volcan Paricutin 170	7159129	\N	\N
LRJR900431	LEON REYNOSO JOSE ROBERTO	20	conocida	55555555	\N	\N
MACI790901	MARTINEZ CORONEL ITZEL	24	Real de los Diamantes 527	7140472	\N	\N
MACO920317	MORENO AGUILLON CRISTHIAN OMAR	18	conocida	55555555	\N	\N
MAFE771111	MARTINEZ FRANCO ESLY	26	Blvd Felipe Angeles 1221	7141487	\N	\N
MAGL881030	MARTINEZ GALICIA LITAEL	22	conocida	55555555	\N	\N
MALD770810	MARTINEZ LOPEZ DANIEL	26	Rio Papaloapan 306	7113863	\N	\N
MALN880818	MARTINEZ LUNA NICOLAS	22	conocida	55555555	\N	\N
MAMI891201	MARTINEZ MONTOYA IVONNE	21	conocida	55555555	\N	\N
MAMM910501	MANCILLAS MAYEN MARIBEL	19	conocida	55555555	\N	\N
MCGI910122	MEDRANO CARRASCO GABRIELA ITZEL	19	conocida	55555555	\N	\N
MESR731128	MENDOZA SOLIS RUBI	30	San Luis Potosi 3684	7171778	\N	\N
MJJA911102	MARTINEZ JIMENEZ JOSE ALFREDO	19	conocida	55555555	\N	\N
MLMG920602	MONROY LOPEZ MARIA GUADALUPE	18	conocida	55555555	\N	\N
MOBJ920703	MORALES BÀEZ JORGE	18	conocida	55555555	\N	\N
MOJA900219	MARTINEZ PEÑA JESUS ADRIAN	20	conocida	55555555	\N	\N
MOMA910804	MORALES MACEDA ADRIANA	19	conocida	55555555	\N	\N
MRME921203	MORA REYES MARIO EDUARDO	18	conocida	55555555	\N	\N
MUHE921010	MUÑOZ HERNANDEZ EDGAR	18	conocida	55555555	\N	\N
NICK920104	NIETO CASTILLO LIZBETH	18	conocida	55555555	\N	\N
ODJA910205	ONOFRE DIAZ JORGE ANTONIO	19	conocida	55555555	\N	\N
OPVI910805	OLVERA PADILLA VICTOR IVAN	19	conocida	55555555	\N	\N
ORGA900306	ORTEGA GARCIA ABRAHAM	20	conocida	55555555	\N	\N
ORRD900905	ORTIZ RAMIREZ DIANA	20	conocida	55555555	\N	\N
ORVE790526	ORTIZ VARGAS ERIKA	24	José Ma Morelos 741	7131415	\N	\N
OSMS900721	OSORNIO MORENO SALVADOR	20	conocida	55555555	\N	\N
PAAA891006	PACHECO ANTONIO ARTURO	21	conocida	55555555	\N	\N
PABS791225	PALACIOS BAEZA SAMANTA	24	Venustiano Carranza 321	7154400	\N	\N
PAPN751201	PALACIOS PEREZ NESTOR	28	Unidad Vecinal 2	7123234	\N	\N
PBFX881107	PALMA BELTRAN FRANCISCO XAVIER	22	conocida	55555555	\N	\N
PCMA890109	PIEDRAS CARRILLO MIGUEL ANGEL	21	conocida	55555555	\N	\N
PENR881208	PEREZ NICOLAS RAFAEL	22	conocida	55555555	\N	\N
PEPN740714	PEREZ PEREZ NOHEMI	29	Republica del Peru 469	7155744	\N	\N
PGAB890411	PAZ GUTIERREZ ARTURO BENJAMIN	21	conocida	55555555	\N	\N
PGRI880520	PEREZ GONZALEZ RODRIGO ISRAEL	22	conocida	55555555	\N	\N
QSSD900210	QUINTANA SANCHEZ SERGIO DAVID	20	conocida	55555555	\N	\N
QUOG890407	QUIROZ ORTIZ GUADALUPE	21	conocida	55555555	\N	\N
RARS880908	RANGEL ROBLEDO SAMUEL	22	conocida	55555555	\N	\N
RHJA880508	REYES HERNANDEZ JUAN ALFREDO	22	conocida	55555555	\N	\N
ROBJ780102	RODRIGUEZ BARRERA JAEL	27	Av. Los Cisnes 278	7168987	\N	\N
ROEG770112	RODRIGUEZ ESPINDOLA GUADALUPE	26	Puerto Alvarado Depar Manz 6	7156003	\N	\N
ROMJ890221	ROQUE MORALES JORGE	21	conocida	55555555	\N	\N
ROOJ880609	RODRIGUEZ OCHOA JUAN	22	conocida	55555555	\N	\N
RPCA910311	ROCHA PIEDRAS CARLOS ALBERTO	19	conocida	55555555	\N	\N
SAED910808	SANCHEZ AVILA EDGAR DANIEL	19	conocida	55555555	\N	\N
SOBA890710	SOLORIO BAUTISTA ABRAHAM	21	conocida	55555555	\N	\N
SOLJ900715	SOTELO LLAMAS JOEL	20	conocida	55555555	\N	\N
SPOC900811	STREVEL PEREZ OLIVER CARLOS	20	conocida	55555555	\N	\N
SPUA920413	SANCHEZ PEREZ URIEL AXEL	18	conocida	55555555	\N	\N
SPVA920506	SANTIAGO PONCE VICTOR ADRIAN	18	conocida	55555555	\N	\N
SRGR920513	SANCHEZ RAMIREZ GUSTAVO RAFAEL	18	conocida	55555555	\N	\N
SSJL910614	SANCHEZ SANCHEZ JULIA LETICIA	19	conocida	55555555	\N	\N
SVLE920412	SALCEDO VAZQUEZ LUIS EDUARDO	18	conocida	55555555	\N	\N
SVOE900815	SALAZAR VILLAGRAN OSCAR EDUARDO	20	conocida	55555555	\N	\N
VECR900716	VEGA CASTILLO RAMON	20	conocida	55555555	\N	\N
VELF890818	VELAZQUEZ LOPEZ FRANCISCO	21	conocida	55555555	\N	\N
VFJA910611	VAZQUEZ FLORES JORGE AARON	19	conocida	55555555	\N	\N
VGKM890816	VAZQUEZ GUTIERREZ KAREN MARISOL	21	conocida	55555555	\N	\N
VHGD910912	VALDES HERNANDEZ GUSTAVO DANIEL	19	conocida	55555555	\N	\N
VJMA921013	VAZQUEZ HERNANDEZ MIGUEL ANGEL	18	conocida	55555555	\N	\N
VSDI880917	VIVERO SEGURA DAVID ISRAEL	22	conocida	55555555	\N	\N
VSJA921114	VILLANUEVA SOTO JOSE ANTONIO	18	conocida	55555555	\N	\N
ZAJC881018	ZEPEDA ALVAREZ JULIO CESAR	22	conocida	55555555	\N	\N
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (idusuario, correo, password, nombreusuario, paterno, materno, nombre, foto) FROM stdin;
\.


--
-- Name: causahosp_idcausahosp_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.causahosp_idcausahosp_seq', 1, false);


--
-- Name: edocuarto_idedocuarto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.edocuarto_idedocuarto_seq', 1, false);


--
-- Name: estado_idestado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estado_idestado_seq', 1, false);


--
-- Name: historial_idhistorial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historial_idhistorial_seq', 1, false);


--
-- Name: municipio_idmunicipio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.municipio_idmunicipio_seq', 1, false);


--
-- Name: usuario_idusuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_idusuario_seq', 1, false);


--
-- Name: causahosp causahosp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.causahosp
    ADD CONSTRAINT causahosp_pkey PRIMARY KEY (idcausahosp);


--
-- Name: cuarto cuarto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuarto
    ADD CONSTRAINT cuarto_pkey PRIMARY KEY (nocuarto);


--
-- Name: edocuarto edocuarto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edocuarto
    ADD CONSTRAINT edocuarto_pkey PRIMARY KEY (idedocuarto);


--
-- Name: especialidad especialidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especialidad
    ADD CONSTRAINT especialidad_pkey PRIMARY KEY (idesp);


--
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (idestado);


--
-- Name: historial historial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial
    ADD CONSTRAINT historial_pkey PRIMARY KEY (idhistorial);


--
-- Name: medico medico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medico
    ADD CONSTRAINT medico_pkey PRIMARY KEY (cedula);


--
-- Name: municipio municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT municipio_pkey PRIMARY KEY (idmunicipio);


--
-- Name: paciente paciente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_pkey PRIMARY KEY (curp);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (idusuario);


--
-- Name: cuarto cuarto_idedocuarto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuarto
    ADD CONSTRAINT cuarto_idedocuarto_fkey FOREIGN KEY (idedocuarto) REFERENCES public.edocuarto(idedocuarto) ON UPDATE CASCADE;


--
-- Name: historial historial_cedula_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial
    ADD CONSTRAINT historial_cedula_fkey FOREIGN KEY (cedula) REFERENCES public.medico(cedula);


--
-- Name: historial historial_curp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial
    ADD CONSTRAINT historial_curp_fkey FOREIGN KEY (curp) REFERENCES public.paciente(curp);


--
-- Name: historial historial_idcausahosp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial
    ADD CONSTRAINT historial_idcausahosp_fkey FOREIGN KEY (idcausahosp) REFERENCES public.causahosp(idcausahosp) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: historial historial_nocuarto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial
    ADD CONSTRAINT historial_nocuarto_fkey FOREIGN KEY (nocuarto) REFERENCES public.cuarto(nocuarto);


--
-- Name: medico medico_idesp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medico
    ADD CONSTRAINT medico_idesp_fkey FOREIGN KEY (idesp) REFERENCES public.especialidad(idesp) ON UPDATE CASCADE;


--
-- Name: municipio municipio_idestado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT municipio_idestado_fkey FOREIGN KEY (idestado) REFERENCES public.estado(idestado) ON UPDATE CASCADE;


--
-- Name: paciente paciente_idestado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_idestado_fkey FOREIGN KEY (idestado) REFERENCES public.estado(idestado) ON UPDATE CASCADE;


--
-- Name: paciente paciente_idmunicipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_idmunicipio_fkey FOREIGN KEY (idmunicipio) REFERENCES public.municipio(idmunicipio) ON UPDATE CASCADE;


--
-- PostgreSQL database dump complete
--

