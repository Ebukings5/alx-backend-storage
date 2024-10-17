-- Create a user table even if it exists.

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(225) NOT NULL UNIQUE,
	email VARCHAR(225)
);
