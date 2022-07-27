const sqlite3 = require("sqlite3").verbose();
const db = new sqlite3.Database("data/database.db");

db.serialize(function () {
    
    db.run("PRAGMA foreign_keys = ON;");
    let sqlString = `DROP TABLE IF EXISTS credits;
            DROP TABLE IF EXISTS productions;
            DROP TABLE IF EXISTS movies;
            DROP TABLE IF EXISTS people;
            DROP TABLE IF EXISTS production_companies;`;
    db.exec(sqlString);

    /******************************************************************************/
    /*                                 MOVIES                                     */  
    /******************************************************************************/

    sqlString = `CREATE TABLE movies (
        title TEXT NOT NULL,
        year INTEGER NOT NULL,
        runtime INTEGER,
        genre TEXT,
        language TEXT,
        primary key (title, year));`;
    db.run(sqlString);
        
    sqlString = `INSERT INTO movies VALUES 
        ("WALL-E", 2008, 97, "Animation, Children, Fantasy, Sci-Fi", "English"),
        ("Inside Out", 2015, 95, "Animation, Adventure, Comedy, Drama, Family, Fantasy", "English"),
        ("The Dark Knight", 2008, 152, "Action, Crime, Drama, Thriller", "English")
    ;`;
    db.run(sqlString);
        
        
    /******************************************************************************/
    /*                                 PEOPLE                                     */
    /******************************************************************************/
    
    sqlString = `CREATE TABLE people (
        name TEXT NOT NULL PRIMARY KEY,
        age INTEGER,
        nationality TEXT);`;
    db.run(sqlString);
    
    sqlString = `INSERT INTO people VALUES 
        ("Andrew Stanton", 56, "American"),
        ("Pete Docter", 53, "American"),
        ("Thomas Newman", 66, "American"),
        ("Michael Giacchino", 54, "American"),
        ("Christopher Nolan", 51, "British-American"),
        ("Hans Zimmer", 64, "German"),
        ("James Newton Howard", 70, "American")
    ;`;
    db.run(sqlString);


    /******************************************************************************/
    /*                          PRODUCTION COMPANIES                              */
    /******************************************************************************/

    sqlString = `CREATE TABLE production_companies (
        name TEXT NOT NULL PRIMARY KEY,
        year_founded INTEGER,
        founders TEXT,
        headquarters TEXT);`;
    db.run(sqlString);

    sqlString = `INSERT INTO production_companies VALUES
        ("Walt Disney Pictures", 1983, "Walt Disney, Roy O. Disney", "Burbank, California, U.S."),
        ("Pixar Animation Studios", 1979, "Edwin Catmull, Alvy Ray Smith", "Emeryville, California, U.S."),
        ("Walt Disney Studios Motion Pictures", 1953, "df", "Burbank, California, U.S."),
        ("Warner Bros. Pictures", 1923, "Harry Warner, Albert Warner, Sam Warner, Jack L. Warner", "Burbank, California, U.S."),
        ("Legendary Pictures Productions LLC", 2000, "Thomas Tull", "Burbank, California, U.S."),
        ("Syncopy Inc.", 2001, "Christopher Nolan, Emma Thomas", "Los Angeles, California, U.S.")
    ;`;
    db.run(sqlString);


    /******************************************************************************/
    /*                                  CREDITS                                   */
    /******************************************************************************/

    sqlString = `CREATE TABLE credits (
        movie TEXT,
		year INTEGER,
        name TEXT,
        credited_as TEXT NOT NULL,
        PRIMARY KEY (movie, year, name, credited_as),
        FOREIGN KEY(movie, year) REFERENCES movies(title, year),
        FOREIGN KEY(name) REFERENCES people(name));`;
    db.run(sqlString);


    sqlString = `INSERT INTO credits VALUES
        ("The Dark Knight", 2008, "Christopher Nolan", "Director")
    ;`;
    db.run(sqlString);



    /******************************************************************************/
    /*                                PRODUCTIONS                                 */
    /******************************************************************************/

    sqlString = `CREATE TABLE productions (
        movie TEXT NOT NULL,
        studio TEXT NOT NULL,
        FOREIGN KEY (movie) REFERENCES movies (title),
        FOREIGN KEY (studio) REFERENCES people (name));`;
    db.run(sqlString);



});
