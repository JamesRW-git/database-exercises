USE codeup_test_db;

INSERT INTO users(username, email, first_name, last_name, middle_name)
VALUES ('james.woodward', 'jamesrobertwoodward@gmail.com', 'James', 'Woodward', 'Robert');

INSERT INTO users(username, email, first_name, last_name, middle_name)
VALUES ('haley.davis', 'haleyrdavis@gmail.com', 'Haley', 'Davis', 'Rebecca');

SELECT id, username, email
FROM users;

# SELECT *
# FROM users
# WHERE middle_name IS NULL;

SELECT *
FROM users
WHERE last_name = 'Davis';

SELECT *
FROM users
WHERE last_name LIKE 'W%';

UPDATE users
SET last_name = 'Woodward'
WHERE first_name = 'James';