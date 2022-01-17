-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music



--create an artists table
CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist_name TEXT[] NOT NULL
);

--create a producers table
CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer_name TEXT[] NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  -- artist_id INTEGER REFERENCES artists (id),
  album TEXT NOT NULL
  -- producer_id INTEGER REFERENCES producers (id)
);

--create a table to refer artists to the song
CREATE TABLE songs_artists
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs (id),
  artist_id INTEGER REFERENCES artists (id)
);


--create a table to refer producers to song
CREATE TABLE songs_producers
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs (id),
  producer_id INTEGER REFERENCES producers (id)
);


--insert values into the artists table
INSERT INTO artists
  (artist_name)
VALUES
('{"Hanson"}'),
('{"Queen"}'),
('{"Mariah Cary"}'),
('{"Boyz II Men"}'),
('{"Lady Gaga"}'),
('{"Bradley Cooper"}'), 
('{"Nickelback"}'),
('{"Jay Z"}'), 
('{"Alicia Keys"}'),
('{"Katy Perry"}'), 
('{"Juicy J"}'),
('{"Maroon 5"}'),
('{"Christina Aguilera"}'),
('{"Avril Lavigne"}'),
('{"Destiny''s Child"}');

--insert values into the producers table
INSERT INTO producers
  (producer_name)
VALUES
  ('{"Dust Brothers"}'),
  ('{"Stephen Lironi"}'),
  ('{"Roy Thomas Baker"}'),
  ('{"Walter Afanasieff"}'),
  ('{"Benjamin Rice"}'),
  ('{"Rick Parashar"}'),
  ('{"Al Shux"}'),
  ('{"Max Martin"}'),
  ('{"Cirkut"}'),
  ('{"Shellback"}'),
  ('{"Benny Blanco"}'),
  ('{"The Matrix"}'),
  ('{"Darkchild"}');

--insert values to the song table using referenced ids from artist and producer tables
INSERT INTO songs
  (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '04-15-1997', 'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, '10-31-1975', 'A Night at the Opera'),
  ('One Sweet Day', 282, '11-14-1995', 'Daydream'),
  ('Shallow', 216, '09-27-2018', 'A Star Is Born'),
  ('How You Remind Me', 223, '08-21-2001', 'Silver Side Up'),
  ('New York State of Mind', 276, '10-20-2009', 'The Blueprint 3'),
  ('Dark Horse', 215, '12-17-2013', 'Prism'),
  ('Moves Like Jagger', 201, '06-21-2011', 'Hands All Over'),
  ('Complicated', 244, '05-14-2002', 'Let Go'),
  ('Say My Name', 240, '11-07-1999', 'The Writing''s on the Wall');


-- insert values into table to refer artists to the song
INSERT INTO songs_artists
  (song_id,  artist_id)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 5),
(4, 6),
(5, 7),
(6, 8),
(6, 9),
(7, 10),
(7, 11),
(8, 12),
(8, 13),
(9, 14),
(10, 15);


--INSERT values into table to refer producers to the song
INSERT INTO songs_producers
  (song_id, producer_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(7, 9),
(8, 10),
(8, 11),
(9, 12),
(10, 13);

