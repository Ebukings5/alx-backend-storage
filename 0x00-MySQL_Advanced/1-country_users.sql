-- Create a user even if it exists.

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(225) NOT NULL UNIQUE,
	name VARCHAR(225),
	country ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US'
);
