DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE Regions (
  id SERIAL PRIMARY KEY,
  city varchar(20)
);

CREATE TABLE Users(
  id SERIAL PRIMARY KEY,
  user_name varchar(20) UNIQUE,
  password varchar(20),
  date_joined timestamp,
  pref_region int
);

CREATE TABLE Catergories (
  id SERIAL PRIMARY KEY,
  category varchar(20)
);

CREATE TABLE Posts (
  id SERIAL PRIMARY KEY,
  title varchar(15),
  comment text,
  username int,
  post_loc varchar(20),
  post_region int,
  date_posted timestamp,
  post_cat int
);

ALTER TABLE Users ADD FOREIGN KEY (pref_region) REFERENCES Regions (id);

ALTER TABLE Posts ADD FOREIGN KEY (username) REFERENCES Users (id);

ALTER TABLE Posts ADD FOREIGN KEY (post_region) REFERENCES Regions (id);

ALTER TABLE Posts ADD FOREIGN KEY (post_cat) REFERENCES Catergories (id);
