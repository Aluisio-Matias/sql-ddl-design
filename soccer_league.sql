DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league


CREATE TABLE teams (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE players (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    birthday DATE NOT NULL,
    height TEXT NOT NULL,
    current_team_id INTEGER REFERENCES teams (id)
);

CREATE TABLE season (
    id INTEGER PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE referees (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE matches (
    id INTEGER PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams (id),
    away_team_id INTEGER REFERENCES teams (id),
    location TEXT NOT NULL,
    date DATE NOT NULL,
    start_time TIME NOT NULL,
    season_id INTEGER REFERENCES season (id),
    head_referee_id INTEGER REFERENCES referees (id),
    assistent_referee_1_id INTEGER REFERENCES referees (id),
    assistent_referee_2_id INTEGER REFERENCES referees (id)
);

CREATE TABLE goals (
    id INTEGER PRIMARY KEY,
    player_id INTEGER REFERENCES players (id),
    match_id INTEGER REFERENCES matches (id)
);

CREATE TABLE lineups (
    id INTEGER PRIMARY KEY,
    player_id INTEGER REFERENCES players (id),
    match_id INTEGER REFERENCES matches (id),
    team_id INTEGER REFERENCES teams (id)
);

CREATE TABLE results (
    id INTEGER PRIMARY KEY,
    team_id INTEGER REFERENCES teams (id),
    match_id INTEGER REFERENCES matches (id),
    match_result TEXT NOT NULL
);


