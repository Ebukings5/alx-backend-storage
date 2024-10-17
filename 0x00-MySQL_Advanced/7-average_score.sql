-- SQL script to create a stored procedure ComputeAverageScoreForUser

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;

DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser (
	    IN p_user_id INT
)
BEGIN
	    DECLARE v_avg_score DECIMAL(10,2);

	    -- Calculate average score
    SELECT AVG(score) INTO v_avg_score
    FROM corrections
    WHERE user_id = p_user_id;

    -- Update average_score in users table
    UPDATE users
    SET average_score = v_avg_score
    WHERE id = p_user_id;
    
END$$

DELIMITER ;
