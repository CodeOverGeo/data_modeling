-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  artist_id SERIAL PRIMARY KEY,
  artist TEXT NOT NULL
);

CREATE TABLE producers
(
  producer_id SERIAL PRIMARY KEY,
  producer TEXT NOT NULL
);

CREATE TABLE songs
(
  song_id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artist INT NOT NULL REFERENCES artists,
  collaborator INT REFERENCES artists,
  album TEXT NOT NULL,
  producer INT NOT NULL REFERENCES producers,
  co_producer INT REFERENCES producers
);

INSERT INTO artists
(artist)
VALUES
('Hanson'),
('Queen'),
('Mariah Carey'),
('Boyz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny''s Child');

INSERT INTO producers
(producer)
VALUES
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parashar'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Darkchild');

INSERT INTO songs
  (title, duration_in_seconds, release_date, artist, collaborator, album, producer, co_producer)
VALUES
  ('MMMBop', 238, '04-15-1997', 1, NULL, 'Middle of Nowhere', 1,2),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2, NULL, 'A Night at the Opera', 3, NULL),
  ('One Sweet Day', 282, '11-14-1995', 3, 4, 'Daydream', 4, NULL),
  ('Shallow', 216, '09-27-2018', 5,6, 'A Star Is Born', 5, NULL),
  ('How You Remind Me', 223, '08-21-2001', 7, NULL, 'Silver Side Up', 6, NULL),
  ('New York State of Mind', 276, '10-20-2009', 8, 9, 'The Blueprint 3', 7, NULL),
  ('Dark Horse', 215, '12-17-2013', 10, 11, 'Prism', 8, 9),
  ('Moves Like Jagger', 201, '06-21-2011', 12, 13, 'Hands All Over', 10, 11),
  ('Complicated', 244, '05-14-2002', 14, NULL, 'Let Go', 12, NULL),
  ('Say My Name', 240, '11-07-1999', 15, NULL, 'The Writing''s on the Wall', 13, NULL);
