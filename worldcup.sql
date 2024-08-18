--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (281, 2018, 'Final', 506, 507, 4, 2);
INSERT INTO public.games VALUES (282, 2018, 'Third Place', 508, 509, 2, 0);
INSERT INTO public.games VALUES (283, 2018, 'Semi-Final', 507, 509, 2, 1);
INSERT INTO public.games VALUES (284, 2018, 'Semi-Final', 506, 508, 1, 0);
INSERT INTO public.games VALUES (285, 2018, 'Quarter-Final', 507, 510, 3, 2);
INSERT INTO public.games VALUES (286, 2018, 'Quarter-Final', 509, 511, 2, 0);
INSERT INTO public.games VALUES (287, 2018, 'Quarter-Final', 508, 512, 2, 1);
INSERT INTO public.games VALUES (288, 2018, 'Quarter-Final', 506, 513, 2, 0);
INSERT INTO public.games VALUES (289, 2018, 'Eighth-Final', 509, 514, 2, 1);
INSERT INTO public.games VALUES (290, 2018, 'Eighth-Final', 511, 515, 1, 0);
INSERT INTO public.games VALUES (291, 2018, 'Eighth-Final', 508, 516, 3, 2);
INSERT INTO public.games VALUES (292, 2018, 'Eighth-Final', 512, 517, 2, 0);
INSERT INTO public.games VALUES (293, 2018, 'Eighth-Final', 507, 518, 2, 1);
INSERT INTO public.games VALUES (294, 2018, 'Eighth-Final', 510, 519, 2, 1);
INSERT INTO public.games VALUES (295, 2018, 'Eighth-Final', 513, 520, 2, 1);
INSERT INTO public.games VALUES (296, 2018, 'Eighth-Final', 506, 521, 4, 3);
INSERT INTO public.games VALUES (297, 2014, 'Final', 522, 521, 1, 0);
INSERT INTO public.games VALUES (298, 2014, 'Third Place', 523, 512, 3, 0);
INSERT INTO public.games VALUES (299, 2014, 'Semi-Final', 521, 523, 1, 0);
INSERT INTO public.games VALUES (300, 2014, 'Semi-Final', 522, 512, 7, 1);
INSERT INTO public.games VALUES (301, 2014, 'Quarter-Final', 523, 524, 1, 0);
INSERT INTO public.games VALUES (302, 2014, 'Quarter-Final', 521, 508, 1, 0);
INSERT INTO public.games VALUES (303, 2014, 'Quarter-Final', 512, 514, 2, 1);
INSERT INTO public.games VALUES (304, 2014, 'Quarter-Final', 522, 506, 1, 0);
INSERT INTO public.games VALUES (305, 2014, 'Eighth-Final', 512, 525, 2, 1);
INSERT INTO public.games VALUES (306, 2014, 'Eighth-Final', 514, 513, 2, 0);
INSERT INTO public.games VALUES (307, 2014, 'Eighth-Final', 506, 526, 2, 0);
INSERT INTO public.games VALUES (308, 2014, 'Eighth-Final', 522, 527, 2, 1);
INSERT INTO public.games VALUES (309, 2014, 'Eighth-Final', 523, 517, 2, 1);
INSERT INTO public.games VALUES (310, 2014, 'Eighth-Final', 524, 528, 2, 1);
INSERT INTO public.games VALUES (311, 2014, 'Eighth-Final', 521, 515, 1, 0);
INSERT INTO public.games VALUES (312, 2014, 'Eighth-Final', 508, 529, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (506, 'France');
INSERT INTO public.teams VALUES (507, 'Croatia');
INSERT INTO public.teams VALUES (508, 'Belgium');
INSERT INTO public.teams VALUES (509, 'England');
INSERT INTO public.teams VALUES (510, 'Russia');
INSERT INTO public.teams VALUES (511, 'Sweden');
INSERT INTO public.teams VALUES (512, 'Brazil');
INSERT INTO public.teams VALUES (513, 'Uruguay');
INSERT INTO public.teams VALUES (514, 'Colombia');
INSERT INTO public.teams VALUES (515, 'Switzerland');
INSERT INTO public.teams VALUES (516, 'Japan');
INSERT INTO public.teams VALUES (517, 'Mexico');
INSERT INTO public.teams VALUES (518, 'Denmark');
INSERT INTO public.teams VALUES (519, 'Spain');
INSERT INTO public.teams VALUES (520, 'Portugal');
INSERT INTO public.teams VALUES (521, 'Argentina');
INSERT INTO public.teams VALUES (522, 'Germany');
INSERT INTO public.teams VALUES (523, 'Netherlands');
INSERT INTO public.teams VALUES (524, 'Costa Rica');
INSERT INTO public.teams VALUES (525, 'Chile');
INSERT INTO public.teams VALUES (526, 'Nigeria');
INSERT INTO public.teams VALUES (527, 'Algeria');
INSERT INTO public.teams VALUES (528, 'Greece');
INSERT INTO public.teams VALUES (529, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 312, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 529, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games fk_opponent; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_opponent FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games fk_winner; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_winner FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

