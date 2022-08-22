CREATE TABLE films (
	id SERIAL PRIMARY KEY,
	title VARCHAR(50) UNIQUE,
	genre VARCHAR(50),
	release_year INTEGER,
	score INTEGER
)

insert into films(title, genre, release_year, score) VALUES ('The Shawshank Redemption', 'Drama', 1994, 9);
insert into films(title, genre, release_year, score) VALUES ('The Godfather', 'Crime', 1972, 9);
insert into films(title, genre, release_year, score) VALUES ('The Dark Knight', 'Action', 2008, 9);
insert into films(title, genre, release_year, score) VALUES ('Alien', 'SciFi', 1979, 9);
insert into films(title, genre, release_year, score) VALUES ('Total Recall', 'SciFi', 1990, 8);
insert into films(title, genre, release_year, score) VALUES ('The Matrix', 'SciFi', 1999, 8);
insert into films(title, genre, release_year, score) VALUES ('The Matrix Resurrections', 'SciFi', 2021, 5);
insert into films(title, genre, release_year, score) VALUES ('The Matrix Reloaded', 'SciFi', 2003, 6);
insert into films(title, genre, release_year, score) VALUES ('The Hunt for Red October', 'Thriller', 1990, 7);
insert into films(title, genre, release_year, score) VALUES ('Misery', 'Thriller', 1990, 7);
insert into films(title, genre, release_year, score) VALUES ('The Power Of The Dog', 'Western', 2021, 6);
insert into films(title, genre, release_year, score) VALUES ('Hell or High Water', 'Western', 2016, 8);
insert into films(title, genre, release_year, score) VALUES ('The Good the Bad and the Ugly', 'Western', 1966, 9);
insert into films(title, genre, release_year, score) VALUES ('Unforgiven', 'Western', 1992, 7);

SELECT * FROM films
SELECT * FROM films ORDER BY score DESC
SELECT * FROM films ORDER BY release_year ASC
SELECT * FROM films WHERE score >= 8
SELECT * FROM films WHERE score <= 7
SELECT * FROM films WHERE release_year = 1990
SELECT * FROM films WHERE release_year < 2000
SELECT * FROM films WHERE release_year > 1990
SELECT * FROM films WHERE release_year BETWEEN 1990 and 1999
SELECT * FROM films WHERE genre = 'SciFi'
SELECT * FROM films WHERE genre = 'SciFi' OR  genre = 'Western'
SELECT * FROM films WHERE genre != 'SciFi' 
SELECT * FROM films WHERE genre = 'Western' AND release_year < 2000
SELECT * FROM films WHERE title LIKE '%Matrix%'



-- EXTENSION 1

SELECT AVG(score) FROM films
SELECT AVG(score)::numeric(10, 2) FROM films
SELECT COUNT(*) FROM films
SELECT genre, AVG(score) FROM films GROUP BY genre
SELECT genre, AVG(score)::numeric(10, 2) FROM films GROUP BY genre


-- EXTENSION 2

CREATE TABLE directors (
	id SERIAL PRIMARY KEY UNIQUE,
	name VARCHAR(50)
)

insert into directors(name) VALUES ('Michael Whatshisname'), ('Sarah Whosherface'), ('Jane Somethingorother'), ('Tony Ohilovethatguy');

TRUNCATE films

ALTER TABLE films ADD directorId INTEGER

ALTER TABLE films RENAME COLUMN directorID TO director_id

insert into films(title, genre, release_year, score, director_id) VALUES ('The Shawshank Redemption', 'Drama', 1994, 9, 1),
																		('The Godfather', 'Crime', 1972, 9, 2),
																		('The Dark Knight', 'Action', 2008, 9, 4),
																		('Alien', 'SciFi', 1979, 9, 2),
																		('Total Recall', 'SciFi', 1990, 8, 1),
																		('The Matrix', 'SciFi', 1999, 8, 3),
																		('The Matrix Resurrections', 'SciFi', 2021, 5, 1),
																		('The Matrix Reloaded', 'SciFi', 2003, 6, 2),
																		('The Hunt for Red October', 'Thriller', 1990, 7, 4),
																		('Misery', 'Thriller', 1990, 7, 1),
																		('The Power Of The Dog', 'Western', 2021, 6, 2),
																		('Hell or High Water', 'Western', 2016, 8, 3),
																		('The Good the Bad and the Ugly', 'Western', 1966, 9, 2),
																		('Unforgiven', 'Western', 1992, 7, 4)

SELECT films, directors FROM films INNER JOIN directors ON films.director_id = directors.id
SELECT films.title, directors.name FROM films INNER JOIN directors ON films.director_id = directors.id



-- EXTENSION 3

select directors.name, 
    count(films)
from directors
    JOIN films on films.director_id = directors.id
group by directors.name;