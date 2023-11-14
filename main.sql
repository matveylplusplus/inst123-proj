
CREATE DATABASE musik;


CREATE TYPE ATYPE AS ENUM
('Solo','Group','Band','Collective','Other')
;


CREATE TABLE artists (
	name varchar(50),
	type ATYPE,
	PRIMARY KEY (name)
);


INSERT INTO artists (name, type)
	VALUES ('Pink Floyd','Band'),
	('Porter Robinson','Solo'),
	('Drake','Solo')
;




CREATE TABLE genres (
    genre_name TEXT CONSTRAINT genres_key PRIMARY KEY,
    genre_desc TEXT
);

INSERT INTO genres (genre_name, genre_desc) 
    VALUES
        ('rock', 'a type of popular dance music originating in the 1950s, characterized by heavy beats and uncomplicated melodies; rock first emerged as a fusion between R&B and country music'),
        ('dance/electronic', 'a broad genre of percussive electronic music intended for dancing; originally made for nightclubs, raves, and festivals'),
        ('hip-hop/rap', 'a genre of music characterized primarily by a strong, rhythmic beat and rapping vocals');
