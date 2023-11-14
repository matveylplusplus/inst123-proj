CREATE DATABASE musik;

CREATE TYPE RTYPE AS ENUM
('Single', 'Album', 'EP', 'Other');
CREATE TABLE releases (
  title TEXT,
  artist TEXT REFERENCES artists(name),
  PRIMARY KEY(title, artist),
  type RTYPE,
  track_count INT CHECK (track_count > 0),
  duration INTERVAL CHECK (EXTRACT(epoch FROM duration) > 0),
  release_date DATE,
  genre TEXT REFERENCES genres(genre_name),
  peak_chart_pos_us INT CHECK (peak_chart_pos_us > 0),
  peak_chart_pos_uk INT CHECK (peak_chart_pos_uk > 0),
  am_rating NUMERIC(2,1) CHECK (am_rating BETWEEN 0 AND 5),
  rym_rating NUMERIC(3,2) CHECK (rym_rating BETWEEN 0 AND 5)
);

INSERT INTO releases
(title, artist, type, track_count, duration, release_date, 
genre, peak_chart_pos_us, peak_chart_pos_uk, am_rating, 
rym_rating) VALUES
  ('The Dark Side of the Moon', 'Pink Floyd', 'Album', 
  10, '00:42:50', '1973-03-23', 'rock', 1, 2, 5.0, 4.23),
  ('Worlds', 'Porter Robinson', 'Album', 12, '00:57:49', 
  '2014-08-12', 'dance/electronic', 18, 13, 4.0, 3.55),
  ('Certified Lover Boy', 'Drake', 'Album', 21, '01:26:02',
  '2021-09-03', 'hip-hop/rap', 1, 1, 2.5, 1.78);