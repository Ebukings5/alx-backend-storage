-- SQL script to create a stored procedure AddBonus
-- Drop the procedure if it already exists
-- Delimiter change to handle procedure creation
-- Create the procedure
DROP PROCEDURE IF EXISTS AddBonus;
DELIMITER $$
CREATE PROCEDURE AddBonus (
	user_id INT,
	project_name VARCHAR(255),
	score FLOAT
)
BEGIN
	DECLARE project_count INT DEFAULT 0;
	DECLARE project_id INT DEFAULT 0;

	SELECT COUNT(id)
		INTO project_count
		FROM projects
		WHERE name = project_name;
	
	IF project_count = 0 THEN
		INSERT INTO projects (name)
			VALUES (project_name);
	END IF;
	SELECT id
		INTO projects_id
		FROM projects
		WHERE name = project_name;
	INSERT INTO
corrections(user_id, project_id, score)
		VALUES (user_id, project_id, score);
END$$
DELIMITER ;
