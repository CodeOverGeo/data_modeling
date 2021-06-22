DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer;

CREATE TYPE game_result AS ENUM (
  'won',
  'lost',
  'draw'
);

CREATE TABLE Teams (
  team_id SERIAL PRIMARY KEY,
  name varchar UNIQUE NOT NULL,
  city varchar UNIQUE NOT NULL
);

CREATE TABLE Players (
  player_id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL,
  birthdate date,
  height int,
  weight int,
  position varchar(10),
  team_id int REFERENCES Teams
);

CREATE TABLE Referees (
  ref_id SERIAL PRIMARY KEY,
  name varchar UNIQUE NOT NULL,
  years int 
);

CREATE TABLE Season (
  season_id SERIAL PRIMARY KEY,
  start_date date NOT NULL,
  end_date date NOT NULL
);

CREATE TABLE Games (
  game_id SERIAL PRIMARY KEY,
  home_team int REFERENCES Teams,
  away_team int REFERENCES Teams,
  location string,
  date date,
  start_time timestamp,
  end_time timestamp
  lead_ref int REFERENCES Referees,
  side_ref int REFERENCES Referees,
  back_ref int REFERENCES Referees,
  season_id int REFERENCES Season
);

CREATE TABLE Goals (
  id SERIAL PRIMARY KEY,
  player_id int REFERENCES Players,
  game_id int REFERENCES Games
);

CREATE TABLE Results (
  id SERIAL PRIMARY KEY,
  team_id int REFERENCES Teams,
  game_id int REFERENCES Games,
  result game_result NOT NULL
);

