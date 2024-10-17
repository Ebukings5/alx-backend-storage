-- SQL script to create a trigger that resets valid_email attribute when email is changed
-- Drop the trigger if it already exists
-- Delimiter change to handle trigger creation
-- Create the trigger
-- Check if the email field is being updated
-- Reset valid_email to 0
-- Reset the delimiter
DROP TRIGGER IF EXISTS reset_valid_email_on_change;
DELIMITER $$
CREATE TRIGGER reset_valid_email_on_change
BEFORE UPDATE ON users
FOR EACH ROW
	BEGIN IF NEW.email != OLD.email
		THEN SET NEW.valid_email = 0;
	END IF;
END$$ DELIMITER;
