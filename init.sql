-- Set the date format to DMY (Day-Month-Year) before importing
SET datestyle = 'ISO, DMY';

CREATE TABLE IF NOT EXISTS pizza_sales (
    pizza_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    pizza_name_id VARCHAR(50),
    quantity INTEGER,
    order_date DATE,
    order_time TIME,
    unit_price DECIMAL(10,2),
    total_price DECIMAL(10,2),
    pizza_size VARCHAR(12),
    pizza_category VARCHAR(50),
    pizza_ingredients TEXT,
    pizza_name VARCHAR(100)
);

-- Load data from CSV
COPY pizza_sales FROM '/tmp/pizza_sales.csv' DELIMITER ',' CSV HEADER;
