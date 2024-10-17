-- Drop the index if it already exists
DROP INDEX IF EXISTS idx_name_first_score ON names;

-- Create the index
CREATE INDEX idx_name_first_score ON names (LEFT(name, 1), score);
