CREATE DATABASE musik;

<<<<<<< HEAD
_______oBBBBB8o______oBBBBBBB 
_____o8BBBBBBBBBBB__BBBBBBBBB8________o88o, 
___o8BBBBBB**8BBBB__BBBBBBBBBB_____oBBBBBBBo, 
__oBBBBBBB*___***___BBBBBBBBBB_____BBBBBBBBBBo, 
_8BBBBBBBBBBooooo___*BBBBBBB8______*BB*_8BBBBBBo, 
_8BBBBBBBBBBBBBBBB8ooBBBBBBB8___________8BBBBBBB8, 
__*BBBBBBBBBBBBBBBBBBBBBBBBBB8_o88BB88BBBBBBBBBBBB, 
____*BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB8, 
______**8BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB*, 
___________*BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB8*, 
____________*BBBBBBBBBBBBBBBBBBBBBBBB8888**, 
_____________BBBBBBBBBBBBBBBBBBBBBBB*, 
_____________*BBBBBBBBBBBBBBBBBBBBB*, 
______________*BBBBBBBBBBBBBBBBBB8, 
_______________*BBBBBBBBBBBBBBBB*, 
________________8BBBBBBBBBBBBBBB8, 
_________________8BBBBBBBBBBBBBBBo, 
__________________BBBBBBBBBBBBBBB8, 
__________________BBBBBBBBBBBBBBBB, 
__________________8BBBBBBBBBBBBBBB8, 
__________________*BBBBBBBBBBBBBBBB, 
__________________8BBBBBBBBBBBBBBBB8, 
_________________oBBBBBBBBBBBBBBBBBB, 
________________oBBBBBBBBBBBBBBBBBBB, 
________________BBBBBBBBBBBBBBBBBBBB, 
_______________8BBBBBBBBBBBBBBBBBBB8, 
______________oBBBBBBBBB88BBBBBBBBB8, 
______________8BBBBBBBBB*8BBBBBBBBB*, 
______________BBBBBBBBB*_BBBBBBBBB8, 
______________BBBBBBBB8_oBBBBBBBBB*, 
______________8BBBBBBB__oBBBBBBBB*, 
______________BBBBBBB*__8BBBBBBB*, 
_____________8BBBBBB*___BBBBBBB*, 
____________8BBBBBB8___oBBBBBB8, 
___________8BBBBBB8____8BBBBBB*, 
__________oBBBBBB8____BBBBBBB8, 
__________BBBBBBB8___BBBBBBBB*, 
_________oBBBBBBB8___BBBBBBBB, 
_________8BBBBBB8____BBBBBBB*, 
_________BBBBBB*_____8BBBBB*, 
________oBBBB8_______BBBBB*, 
________oBBB8________BBBB*, 
______8BBBB*_______*BBBBBBBB8o, 
______BBBBB*____________*88BBBo
=======
CREATE TYPE ATYPE AS ENUM
('Solo','Group','Band','Collective','Other');
CREATE TABLE artists (
	artist_name varchar(50),
	artist_type ATYPE,
	PRIMARY KEY (artist_name)
);

CREATE TABLE genres (
    genre_name TEXT CONSTRAINT genres_key PRIMARY KEY,
    genre_desc TEXT
);
        
CREATE TYPE RTYPE AS ENUM
('Single', 'Album', 'EP', 'Other');
CREATE TABLE releases (
  release_title TEXT,
  artist_name TEXT REFERENCES artists(artist_name),
  PRIMARY KEY(release_title, artist_name),
  release_type RTYPE NOT NULL,
  track_count INT NOT NULL CHECK (track_count > 0),
  duration INTERVAL NOT NULL CHECK (EXTRACT(epoch FROM duration) > 0),
  release_date DATE,
  genre_name TEXT NOT NULL REFERENCES genres(genre_name),
  peak_chart_pos_us INT CHECK (peak_chart_pos_us > 0),
  peak_chart_pos_uk INT CHECK (peak_chart_pos_uk > 0),
  am_rating NUMERIC(2,1) CHECK (am_rating BETWEEN 0 AND 5),
  rym_rating NUMERIC(3,2) CHECK (rym_rating BETWEEN 0 AND 5),
  pitchfork_rating NUMERIC (3,1) CHECK (pitchfork_rating BETWEEN 0 AND 10)
);

INSERT INTO genres (genre_name, genre_desc) 
    VALUES
        ('rock', 'a type of popular dance music originating in the 1950s, characterized by heavy beats and uncomplicated melodies; rock first emerged as a fusion between R&B and country music'),
        ('dance/electronic', 'a broad genre of percussive electronic music intended for dancing; originally made for nightclubs, raves, and festivals'),
        ('hip-hop/rap', 'a genre of music characterized primarily by a strong, rhythmic beat and rapping vocals');

INSERT INTO artists (artist_name, artist_type)
	VALUES ('Pink Floyd','Band'),
	('Porter Robinson','Solo'),
	('Drake','Solo');

INSERT INTO releases
(release_title, artist_name, release_type, track_count, duration, release_date, 
genre_name, peak_chart_pos_us, peak_chart_pos_uk, am_rating, 
rym_rating, pitchfork_rating) VALUES
  ('The Dark Side of the Moon', 'Pink Floyd', 'Album', 
  10, '00:42:50', '1973-03-23', 'rock', 1, 2, 5.0, 4.23,
  9.3),
  ('Worlds', 'Porter Robinson', 'Album', 12, '00:57:49', 
  '2014-08-12', 'dance/electronic', 18, 13, 4.0, 3.55,
  6.9),
  ('Certified Lover Boy', 'Drake', 'Album', 21, '01:26:02',
  '2021-09-03', 'hip-hop/rap', 1, 1, 2.5, 1.78, 6.6);
>>>>>>> 1ee0a338531fedb0a74307b827677ef27c519512
