CREATE DATABASE IF NOT EXISTS fortran_db;
USE fortran_db;

CREATE TABLE IF NOT EXISTS teams
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS players
(
    id            INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name    VARCHAR(255) NOT NULL,
    last_name     VARCHAR(255) NOT NULL,
    jersey_number INT UNSIGNED NOT NULL,
    is_active     TINYINT UNSIGNED NOT NULL,
    team_id       INT UNSIGNED,
    FOREIGN KEY (team_id) REFERENCES teams (id)
);

CREATE TABLE IF NOT EXISTS positions
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    position CHAR(2)
);

#Join table will not have a primary key
#Naming convention is table_table
CREATE TABLE IF NOT EXISTS player_position
(
    player_id   INT UNSIGNED NOT NULL,
    position_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (player_id) REFERENCES players (id),
    FOREIGN KEY (position_id) references positions (id)
);

#Now let's insert some data
INSERT INTO teams (city, name)
VALUES ('Arlington', 'Texas Rangers'),
       ('Houston', 'Astros'),
       ('Los Angeles', 'Dodgers'),
       ('Washington', 'Nationals'),
       ('San Francisco', 'Giants'),
       ('Boston', 'Red Sox'),
       ('Cleveland', 'Guardians');

INSERT INTO players (first_name, last_name, jersey_number, is_active, team_id)
VALUES ('Corey', 'Seager', 5, 1, 1),
       ('Luis', 'Garcia', 77, 1, 2),
       ('Kenny', 'Powers', 99, 0, NULL);

INSERT INTO positions (position)
VALUES ('SS'),
       ('2B'),
       ('P'),
       ('C'),
       ('RF'),
       ('CF'),
       ('LF');

INSERT INTO player_position
VALUES (1, 1),
       (2, 3),
       (3, 3);

#INNER JOIN
#WHAT DO WE WANT?!
#Get player and team name for each player that has a team associated
SELECT CONCAT(p.first_name, ' ', p.last_name) AS Player, t.name as Team
#From where?
FROM players AS p
#Make connection between tables
JOIN teams AS t on p.team_id = t.id;

#LEFT JOIN
#WHAT DO WE WANT?!
#Get player and team name for each player that has a team associated
SELECT CONCAT(p.first_name, ' ', p.last_name) AS Player, t.name as Team
#From where?
FROM players AS p
#Make connection between tables (by using LEFT join we are getting all values
#from our LEFT table, i.e. the FROM table
LEFT JOIN teams AS t on p.team_id = t.id;

#RIGHT JOIN
#WHAT DO WE WANT?!
#Get player and team name for each player that has a team associated
SELECT CONCAT(p.first_name, ' ', p.last_name) AS Player, t.name as Team
#From where?
FROM players AS p
#Make connection between tables (by using RIGHT join we are getting all values
#from our RIGHT table
RIGHT JOIN teams AS t on p.team_id = t.id;

SELECT CONCAT(p.first_name, ' ', p.last_name) AS Player,
       pos.position AS Position
FROM players AS p
JOIN player_position AS pp on p.id = pp.player_id
JOIN positions as pos on pp.position_id = pos.id;

SELECT CONCAT(p.first_name, ' ', p.last_name) AS Player,
       pos.position AS Position
FROM players AS p
JOIN player_position AS pp on p.id = pp.player_id
JOIN positions as pos on pp.position_id = pos.id
WHERE pos.position = 'p';

USE employees;
SELECT d.dept_name AS 'Department Name',
       CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
JOIN dept_manager dm on e.emp_no = dm.emp_no
JOIN departments AS d ON d.dept_no = dm.dept_no
WHERE dm.to_date > CURDATE();
