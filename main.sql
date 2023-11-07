CREATE TABLE genres (
    genre_name text,
    genre_desc text,
    CONSTRAINT genres_key PRIMARY KEY (genre_name)
);

INSERT INTO genres (genre_name, genre_desc) 
    VALUES
        ('rock', 'a type of popular dance music originating in the 1950s, characterized by heavy beats and uncomplicated melodies; rock first emerged as a fusion between R&B and country music'),
        ('dance/electronic', 'a broad genre of percussive electronic music intended for dancing; originally made for nightclubs, raves, and festivals'),
        ('hip-hop/rap', 'a genre of music characterized primarily by a strong, rhythmic beat and rapping vocals');