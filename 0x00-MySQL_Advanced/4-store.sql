-- SQL script to create a trigger that decreases quantity in items table after adding a new order
-- Delimiter change to handle trigger creation
-- Drop the trigger if it already exists
-- Create the trigger
-- Update the items table to decrease the quantity of the item_name
-- Reset the delimiter
DROP TRIGGER IF EXISTS decrease_quantity_after_order;
DELIMITER $$
CREATE TRIGGER decrease_quantity_after_order
AFTER INSERT ON orders FOR EACH ROW
BEGIN UPDATE items
	SET quantity = quantity - NEW.number
	WHERE name = NEW.item_name;
	END$$ DELIMITER ;
