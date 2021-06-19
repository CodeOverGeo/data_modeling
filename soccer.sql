CREATE TYPE "game_result" AS ENUM (
  'won',
  'lost',
  'draw'
);

CREATE TABLE "Teams" (
  "team_id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE,
  "city" varchar UNIQUE
);

CREATE TABLE "Players" (
  "player_id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE,
  "position" varchar,
  "team_id" int
);

CREATE TABLE "Games" (
  "game_id" SERIAL PRIMARY KEY,
  "home_team" int,
  "away_team" int,
  "date" timestamp,
  "lead_ref" int,
  "side_ref" int,
  "back_ref" int,
  "season_id" int
);

CREATE TABLE "Referees" (
  "ref_id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE,
  "years" int
);

CREATE TABLE "Season" (
  "season_id" SERIAL PRIMARY KEY,
  "start_date" date,
  "end_date" date
);

CREATE TABLE "Goals" (
  "id" SERIAL PRIMARY KEY,
  "player_id" int,
  "game_id" int
);

CREATE TABLE "Results" (
  "id" SERIAL PRIMARY KEY,
  "team_id" int,
  "game_id" int,
  "result" game_result
);

ALTER TABLE "Teams" ADD FOREIGN KEY ("team_id") REFERENCES "Players" ("team_id");

ALTER TABLE "Teams" ADD FOREIGN KEY ("team_id") REFERENCES "Games" ("home_team");

ALTER TABLE "Teams" ADD FOREIGN KEY ("team_id") REFERENCES "Games" ("away_team");

ALTER TABLE "Referees" ADD FOREIGN KEY ("ref_id") REFERENCES "Games" ("lead_ref");

ALTER TABLE "Referees" ADD FOREIGN KEY ("ref_id") REFERENCES "Games" ("side_ref");

ALTER TABLE "Referees" ADD FOREIGN KEY ("ref_id") REFERENCES "Games" ("back_ref");

ALTER TABLE "Season" ADD FOREIGN KEY ("season_id") REFERENCES "Games" ("season_id");

ALTER TABLE "Players" ADD FOREIGN KEY ("player_id") REFERENCES "Goals" ("player_id");

ALTER TABLE "Games" ADD FOREIGN KEY ("game_id") REFERENCES "Goals" ("game_id");

ALTER TABLE "Teams" ADD FOREIGN KEY ("team_id") REFERENCES "Results" ("team_id");

ALTER TABLE "Games" ADD FOREIGN KEY ("game_id") REFERENCES "Results" ("game_id");
