-- Drop the table if it exists
DROP TABLE IF EXISTS Period;

-- Create the Period table
CREATE TABLE Period (
    id INT AUTO_INCREMENT NOT NULL, -- Auto-increment integer
    name VARCHAR(50) NOT NULL, -- Variable character field
    start_date DATE, -- Date field
    end_date DATE, -- Date field
    type VARCHAR(50) NOT NULL, -- Variable character field
    PRIMARY KEY (id) -- Primary key on id
);

-- Create an index on the "type" column
CREATE INDEX ix_period_type ON Period (type);

-- Insert values into the Period table (id will auto-increment)
INSERT INTO Period (name, start_date, end_date, type) VALUES
('Tax Year 2020', '2020-01-01', '2020-12-31', 'regular');

INSERT INTO Period (name, start_date, end_date, type) VALUES
('Tax Year 2021', '2021-01-01', '2021-12-31', 'regular');