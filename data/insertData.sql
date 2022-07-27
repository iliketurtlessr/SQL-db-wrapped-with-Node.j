PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;

-- PRELIMNARY STUFF
DROP TABLE IF EXISTS credits;
DROP TABLE IF EXISTS productions;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS production_companies;


-- Movies
CREATE TABLE movies (
        title TEXT NOT NULL,
        year INTEGER NOT NULL,
        runtime INTEGER,
        genre TEXT,
        language TEXT,
        primary key (title, year)
);
INSERT INTO movies VALUES('WALL-E',2008,97,'Animation, Children, Fantasy, Sci-Fi','English'),
        ('Inside Out',2015,95,'Animation, Adventure, Comedy, Drama, Family, Fantasy','English'),
        ('The Dark Knight',2008,152,'Action, Crime, Drama, Thriller','English'),
        ('Raya and the Last Dragon',2021,107,'Animation, Action, Adventure, Comedy, Drama, Family, Fantasy','English'),
        ('Black Panther',2018,134,'Action, Adventure, Sci-Fi','English'),
        ('Tenet',2020,150,'Action, Sci-Fi, Thriller, Spy','English'),
        ('Inception',2010,148,'Action, Sci-Fi, Adventure, Thriller', 'English')
;


-- PEOPLE
CREATE TABLE people (
        name TEXT NOT NULL PRIMARY KEY,
        age INTEGER,
        nationality TEXT
);
INSERT INTO people VALUES('Andrew Stanton',56,'American'),
        ('Pete Docter',53,'American'),
        ('Jim Reardon',56, 'American'),
        ('Stephen Schaffer', NULL,'American'),
        ('Thomas Newman',66,'American'),
        ('Michael Giacchino',54,'American'),
        ('Christopher Nolan',51,'British-American'),
        ('Jonathan Nolan',45,'British-American'),
        ('Hans Zimmer',64,'German'),
        ('James Newton Howard',70,'American'),
        ('Ronnie del Carmen',62,'Filipino'),
        ('Meg LeFauve',52,'American'),
        ('Joshua Cooley',42,'American'),
        ('David S Goyer',56,'American'),
        ('Lee Smith',62,'Australian'),
        ('Kevin Nolting',NULL,NULL),
        ('Don Hall',53,'American'),
        ('Carlos López Estrada',33,'Mexican'),
        ('Qui Nguyen',NULL,'American'),
        ('Adele Lim',NULL,'Malaysian'),
        ('Paul Briggs',48,'American'),
        ('Kiel Murray',NULL,NULL),
        ('John Ripa',NULL,NULL),
        ('Dean Wellins',51,'Spanish'),
        ('Fabienne Rawley',NULL,NULL),
        ('Shannon Stein',NULL,NULL),
        ('Ryan Coogler',35,'American'),
        ('Joe Robert Cole',42,'American'),
        ('Rachel Morrison',43,'American'),
        ('Michael P. Shawver',37,'American'),
        ('Debbie Berman',43,'South African'),
        ('Ludwig Göransson',43,'Swedish'),
        ('Hoyte van Hoytema',50,'Dutch-Swedish'),
        ('Jennifer Lame',NULL,'American'),
        ('Wally Pfister',60,'American')


;


-- CREDITS
CREATE TABLE credits (
        movie TEXT,
        year INTEGER,
        name TEXT,
        credited_as TEXT NOT NULL,
        PRIMARY KEY (movie, year, name, credited_as),
        FOREIGN KEY(movie, year) REFERENCES movies(title, year),
        FOREIGN KEY(name) REFERENCES people(name)
);
INSERT INTO credits VALUES
        ('WALL-E',2008,'Andrew Stanton', 'Director'),
        ('WALL-E',2008,'Andrew Stanton', 'Screenplay'),
        ('WALL-E',2008,'Jim Reardon', 'Screenplay'),
        ('WALL-E',2008,'Andrew Stanton', 'Storywriter'),
        ('WALL-E',2008,'Pete Docter', 'Storywriter'),
        ('WALL-E',2008,'Stephen Schaffer', 'Editor'),
        ('WALL-E',2008,'Thomas Newman', 'Music Composer'),
        ('Inside Out',2015,'Pete Docter', 'Director'),
        ('Inside Out',2015,'Pete Docter', 'Screenplay'),
        ('Inside Out',2015,'Meg LeFauve', 'Screenplay'),
        ('Inside Out',2015,'Joshua Cooley', 'Screenplay'),
        ('Inside Out',2015,'Pete Docter', 'Storywriter'),
        ('Inside Out',2015,'Ronnie del Carmen', 'Storywriter'),
        ('Inside Out',2015,'Kevin Nolting', 'Editor'),
        ('Inside Out',2015,'Michael Giacchino', 'Music Composer'),
        ('The Dark Knight',2008,'Christopher Nolan', 'Director'),
        ('The Dark Knight',2008,'Christopher Nolan', 'Screenplay'),
        ('The Dark Knight',2008,'Jonathan Nolan', 'Screenplay'),
        ('The Dark Knight',2008,'Christopher Nolan', 'Storywriter'),
        ('The Dark Knight',2008,'David S Goyer', 'Storywriter'),
        ('The Dark Knight',2008,'Lee Smith', 'Editor'),
        ('The Dark Knight',2008,'Hans Zimmer', 'Music Composer'),
        ('The Dark Knight',2008,'James Newton Howard', 'Music Composer'),
        ('Raya and the Last Dragon',2021,'Don Hall','Director'),
        ('Raya and the Last Dragon',2021,'Carlos López Estrada','Director'),
        ('Raya and the Last Dragon',2021,'Qui Nguyen','Screenplay'),
        ('Raya and the Last Dragon',2021,'Adele Lim','Screenplay'),
        ('Raya and the Last Dragon',2021,'Paul Briggs','Storywriter'),
        ('Raya and the Last Dragon',2021,'Don Hall','Storywriter'),
        ('Raya and the Last Dragon',2021,'Adele Lim','Storywriter'),
        ('Raya and the Last Dragon',2021,'Carlos López Estrada','Storywriter'),
        ('Raya and the Last Dragon',2021,'Kiel Murray','Storywriter'),
        ('Raya and the Last Dragon',2021,'Qui Nguyen','Storywriter'),
        ('Raya and the Last Dragon',2021,'John Ripa','Storywriter'),
        ('Raya and the Last Dragon',2021,'Dean Wellins','Storywriter'),
        ('Raya and the Last Dragon',2021,'Shannon Stein','Editor'),
        ('Raya and the Last Dragon',2021,'Fabienne Rawley','Editor'),
        ('Raya and the Last Dragon',2021,'James Newton Howard','Music Composer'),
        ('Black Panther',2018,'Ryan Coogler','Director'),
        ('Black Panther',2018,'Ryan Coogler','Storywriter'),
        ('Black Panther',2018,'Joe Robert Cole','Storywriter'),
        ('Black Panther',2018,'Michael P. Shawver','Editor'),
        ('Black Panther',2018,'Debbie Berman','Editor'),
        ('Black Panther',2018,'Rachel Morrison','Cinematographer'),
        ('Black Panther',2018,'Ludwig Göransson','Music Composer'),
        ('Tenet',2020,'Christopher Nolan','Director'),
        ('Tenet',2020,'Christopher Nolan','Storywriter'),
        ('Tenet',2020,'Hoyte van Hoytema','Cinematographer'),
        ('Tenet',2020,'Jennifer Lame','Editor'),
        ('Tenet',2020,'Ludwig Göransson','Music Composer'),
        ('Inception',2010,'Christopher Nolan', 'Director'),
        ('Inception',2010,'Christopher Nolan', 'Storywriter'),
        ('Inception',2010,'Lee Smith', 'Editor'),
        ('Inception',2010,'Hans Zimmer', 'Music Composer')

;


-- PRODUCTION COMPANIES
CREATE TABLE production_companies (
        name TEXT NOT NULL PRIMARY KEY,
        year_founded INTEGER,
        founders TEXT,
        headquarters TEXT
);
INSERT INTO production_companies VALUES('Walt Disney Pictures',1983,'Walt Disney, Roy O. Disney','Burbank, California, U.S.'),
        ('Pixar Animation Studios',1979,'Edwin Catmull, Alvy Ray Smith','Emeryville, California, U.S.'),
        ('Walt Disney Studios Motion Pictures',1953,'df','Burbank, California, U.S.'),
        ('Warner Bros. Pictures',1923,'Harry Warner, Albert Warner, Sam Warner, Jack L. Warner','Burbank, California, U.S.'),
        ('Legendary Pictures Productions LLC',2000,'Thomas Tull','Burbank, California, U.S.'),
        ('Walt Disney Animation Studios',1923,'	Walt Disney, Roy O. Disney','Burbank, California, U.S.'),
        ('Syncopy Inc.',2001,'Christopher Nolan, Emma Thomas','Los Angeles, California, U.S.'),
        ('Marvel Studios',1933,'Avi Arad, Toy Biz','Burbank, California, U.S.')
;


-- PRODUCTIONS
CREATE TABLE productions (
        movie TEXT NOT NULL,
        year INTEGER,
        studio TEXT NOT NULL,
        FOREIGN KEY (movie,year) REFERENCES movies (title,year),
        FOREIGN KEY (studio) REFERENCES production_companies (name)
);
INSERT INTO productions VALUES ('WALL-E',2008,'Walt Disney Pictures'),
        ('WALL-E',2008,'Pixar Animation Studios'),
        ('Inside Out',2015,'Walt Disney Pictures'),
        ('Inside Out',2015,'Pixar Animation Studios'),
        ('The Dark Knight',2008,'Warner Bros. Pictures'),
        ('The Dark Knight',2008,'Legendary Pictures Productions LLC'),
        ('The Dark Knight',2008,'Syncopy Inc.'),
        ('Raya and the Last Dragon',2021,'Walt Disney Pictures'),
        ('Raya and the Last Dragon',2021,'Walt Disney Animation Studios'),
        ('Black Panther',2018,'Marvel Studios'),
        ('Tenet',2020,'Syncopy Inc.'),
        ('Inception',2010,'Warner Bros. Pictures'),
        ('Inception',2010,'Legendary Pictures Productions LLC'),
        ('Inception',2010,'Syncopy Inc.')

;



COMMIT;
