CREATE DATABASE musik;

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

CREATE TABLE songs (
	song_title TEXT,
   	track_num INT CHECK (track_num > 0),
	release_title TEXT,
	artist_name TEXT,
    	PRIMARY KEY (artist_name, release_title, track_num),
	FOREIGN KEY (artist_name, release_title) REFERENCES releases(artist_name, release_title),
    	duration INTERVAL,
    	total_spotify_plays INT CHECK (total_spotify_plays >= 0)
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
  
INSERT INTO songs (song_title, release_title, artist_name, track_num, duration, total_spotify_plays)
    VALUES ('Speak to Me','The Dark Side of the Moon','Pink Floyd','1','00:01:05','89987353'),
    ('Breath (In the Air)','The Dark Side of the Moon','Pink Floyd','2','00:02:49','294711776'),
    ('On the Run','The Dark Side of the Moon','Pink Floyd','3','00:03:45','94575978'),
    ('Time','The Dark Side of the Moon','Pink Floyd','4','00:06:53','327232696'),
    ('The Great Gig in the Sky','The Dark Side of the Moon','Pink Floyd','5','00:04:43','251328565'),
    ('Money','The Dark Side of the Moon','Pink Floyd','6','00:06:22','460220926'),
    ('Us and Them','The Dark Side of the Moon','Pink Floyd','7','00:07:49','163521090'),
    ('Any Colour You Like','The Dark Side of the Moon','Pink Floyd','8','00:03:26','91807496'),
    ('Brain Damage','The Dark Side of the Moon','Pink Floyd','9','00:03:46','173041831'),
    ('Eclipse','The Dark Side of the Moon','Pink Floyd','10','00:02:10','76690315'),
    ('Divinity','Worlds','Porter Robinson','1','00:06:08','53688250'),
	('Sad Machine','Worlds','Porter Robinson','2','00:05:50','87459966'),
	('Years Of War','Worlds','Porter Robinson','3','00:03:56','17817367'),
	('Flicker','Worlds','Porter Robinson','4','00:04:39','31105501'),
	('Fresh Static Snow','Worlds','Porter Robinson','5','00:05:58','12901126'),
	('Polygon Dust','Worlds','Porter Robinson','6','00:03:29','10329485'),
	('Hear The Bells','Worlds','Porter Robinson','7','00:04:46','10640809'),
	('Natural Light','Worlds','Porter Robinson','8','00:02:21','7781457'),
	('Lionhearted','Worlds','Porter Robinson','9','00:04:26','33732753'),
	('Sea Of Voices','Worlds','Porter Robinson','10','00:04:58','32959544'),
	('Fellow Feeling','Worlds','Porter Robinson','11','00:05:50','10712591'),
	('Goodbye To A World','Worlds','Porter Robinson','12','00:05:28','78551256'),
    ('Champagne Poetry','Certified Lover Boy','Drake','1','00:05:36','269087802'),
    ('Papi''s Home','Certified Lover Boy','Drake','2','00:02:58','132879330'),
    ('Girls Want Girls','Certified Lover Boy','Drake','3','00:03:41','409031052'),
    ('In The Bible','Certified Lover Boy','Drake','4','00:04:56','154334673'),
    ('Love All','Certified Lover Boy','Drake','5','00:03:48','144497735'),
    ('Fair Trade','Certified Lover Boy','Drake','6','00:04:51','683442484'),
    ('Way 2 Sexy','Certified Lover Boy','Drake','7','00:04:17','518697401'),
    ('TSU','Certified Lover Boy','Drake','8','00:05:08','173418351'),
    ('N 2 Deep','Certified Lover Boy','Drake','9','00:04:33','120243824'),
    ('Pipe Down','Certified Lover Boy','Drake','10','00:03:25','131063746'),
    ('Yebba''s Heartbreak','Certified Lover Boy','Drake','11','00:02:13','252486350'),
    ('No Friends In The Industry','Certified Lover Boy','Drake','12','00:03:24','195998787'),
    ('Knife Talk','Certified Lover Boy','Drake','13','00:04:02','651164073'),
    ('7am On Bridle Path','Certified Lover Boy','Drake','14','00:03:59','77400258'),
    ('Race My Mind','Certified Lover Boy','Drake','15','00:04:29','95109575'),
    ('Fountains','Certified Lover Boy','Drake','16','00:03:12','135859275'),
    ('Get Along Better','Certified Lover Boy','Drake','17','00:03:49','97341152'),
    ('You Only Live Twice','Certified Lover Boy','Drake','18','00:03:33','79823047'),
    ('IMY2','Certified Lover Boy','Drake','19','00:04:12','111427378'),
    ('F*****g Fans','Certified Lover Boy','Drake','20','00:04:05','60953311'),
    ('The Remorse','Certified Lover Boy','Drake','21','00:05:51','44485189');


