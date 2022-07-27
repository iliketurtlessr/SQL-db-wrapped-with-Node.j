const PORT = 3000;
const express = require('express');
const app = express();
const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database('data/testdb.db');


// Setting middleware
app.set("view engine", "pug");
app.use(express.static("public"));
app.use(express.urlencoded({extended: true}));

app.use(function(req, res, next) {
    console.log("*******************************");
    console.log(req.method, req.url);
    next();
});


/******************************************************************************/
/*                                 ROUTES                                     */  
/******************************************************************************/
// Send Homepage
app.get(["/", "/home"], (req, res)=> res.render("index"));

app.get("/people?", /* express.json(), */ getPersons, (_, res) => res.render("partials/results"));
app.get("/people/:person", getPerson, (_, res) => res.render("partials/result"));

app.get("/movies?", /* express.json(), */ getMovies, (_, res) => res.render("partials/results"));
app.get("/movies/:movie", getMovie, (_, res) => res.render("partials/result"));


function getPersons(req, res, next) {

    let sql = `SELECT * FROM people WHERE name LIKE '%${req.query.name}%' ORDER BY name;`;
    console.log(`RUNNING SQL: ${sql}`);
    db.all(sql, function(err, rows){
        if (err) {
            console.log(err); 
            return;
        }
        else {
            console.log(rows.length);
            res.locals.people = rows;
            next();
        }
    });
}


function getMovies(req, res, next) {

    let sql = `SELECT * FROM movies WHERE title LIKE '%${req.query.title}%' ORDER BY title;`;
    console.log(`RUNNING SQL: ${sql}`);
    db.all(sql, function(err, rows){
        if (err) {
            console.log(err);
            return;
        }
        else {
            console.log(rows.length);
            res.locals.movies = rows;
            next();
        }
    });
}


function getPerson(req, res, next) {

    let sql = `SELECT * FROM people WHERE name IS '${req.params.person}';`;
    console.log(`RUNNING SQL: ${sql}`);
    db.get(sql, function (err, person){
        if (err) {
            console.log(err); 
            return;
        }
        else {
            console.log(person);
            res.locals.p = person;
            sql = `SELECT * FROM credits WHERE name IS '${req.params.person}' GROUP BY movie;`;
            console.log(`RUNNING SQL: ${sql}`);
            db.all(sql, function(err, movies){
                if (err) {
                    console.log(err); 
                    return;
                }
                else {
                    // movies = movies.map(m => m.movie);
                    console.log(movies);
                    res.locals.movies = movies;
                    next();
                }
            });
        }
    });
}

function getMovie(req, res, next) {

    let sql = `SELECT * FROM movies WHERE title IS '${req.params.movie}';`;
    console.log(`RUNNING SQL: ${sql}`);
    db.get(sql, function (err, movie){
        if (err) {
            console.log(err); 
            return;
        }
        else {
            console.log(movie);
            res.locals.m = movie;
            sql = `SELECT * FROM credits WHERE movie IS '${req.params.movie}';`;
            console.log(`RUNNING SQL: ${sql}`);
            db.all(sql, function(err, people){
                if (err) {
                    console.log(err); 
                    return;
                }
                else {
                    // people = people.map(p => p.name);
                    console.log(people);
                    res.locals.people = people;
                    next();
                }
            });
        }
    });
}


app.listen(PORT);
console.log(`Server listening at http://localhost:${PORT}`);