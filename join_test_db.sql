CREATE DATABASE IF NOT EXISTS join_test_db;

CREATE TABLE roles
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name    VARCHAR(100) NOT NULL,
    email   VARCHAR(100) NOT NULL,
    role_id INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name)
VALUES ('admin');
INSERT INTO roles (name)
VALUES ('author');
INSERT INTO roles (name)
VALUES ('reviewer');
INSERT INTO roles (name)
VALUES ('commenter');

INSERT INTO users (name, email, role_id)
VALUES ('bob', 'bob@example.com', 1),
       ('joe', 'joe@example.com', 2),
       ('sally', 'sally@example.com', 3),
       ('adam', 'adam@example.com', 3),
       ('jane', 'jane@example.com', null),
       ('mike', 'mike@example.com', null);

INSERT INTO users (name, email, role_id)
VALUES ('james', 'james@example.com', 2),
       ('jack', 'jack@example.com', 2),
       ('hunter', 'hunter@example.com', 2),
       ('kyle', 'kyle@example.com', null);

#Gives us the user names as long as they have a role associated
SELECT u.name as 'User Name', r.name as 'Role'
FROM users as u
         JOIN roles as r on u.role_id = r.id;

#Gives us ALL the user names even if they are null
SELECT u.name as 'User Name', r.name as 'Role'
FROM users as u
         LEFT JOIN roles as r on u.role_id = r.id;

#Gives us ALL roles with associated users, including roles that have no users and are thus null
SELECT u.name as 'User Name', r.name as 'Role'
FROM users as u
         RIGHT JOIN roles as r on u.role_id = r.id;

#Gives us all the roles with associated counts
SELECT r.name as 'Role', COUNT(*) as Count
from roles as r
LEFT JOIN users as u on u.role_id = r.id
GROUP BY Role;

