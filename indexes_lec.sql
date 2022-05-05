use codeup_test_db;

ALTER TABLE users
ADD UNIQUE (username);

DESCRIBE users;

# INSERT INTO users(username, email, first_name, last_name, middle_name)
# VALUES ('bob', 'newbob@bob.com', 'Roberts', 'Robby', 'Bob');

CREATE TABLE IF NOT EXISTS posts
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

DESCRIBE posts;

INSERT INTO posts(title, content, user_id)
VALUES ('New Post', 'Some stuff', 1);