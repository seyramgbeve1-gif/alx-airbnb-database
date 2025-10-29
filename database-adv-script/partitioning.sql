-- ============================================================
-- PARTITIONING LARGE TABLES
-- Project: alx-airbnb-database
-- Task 5 - Partitioning the Bookings table
-- ============================================================

-- ------------------------------------------------------------
-- 1️⃣ Drop old table if it exists (for testing)
-- ------------------------------------------------------------
DROP TABLE IF EXISTS bookings_partitioned;

-- ------------------------------------------------------------
-- 2️⃣ Create a partitioned version of bookings
-- ------------------------------------------------------------
-- Partitioning by YEAR of start_date for efficient range queries

CREATE TABLE bookings_partitioned (
    id INT PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (property_id) REFERENCES properties(id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax  VALUES LESS THAN MAXVALUE
);

-- ------------------------------------------------------------
-- 3️⃣ Insert sample data
-- ------------------------------------------------------------
INSERT INTO bookings_partitioned (id, user_id, property_id, start_date, end_date, status)
VALUES
(1, 2, 1, '2022-11-05', '2022-11-10', 'confirmed'),
(2, 3, 2, '2023-03-12', '2023-03-14', 'cancelled'),
(3, 1, 3, '2024-05-20', '2024-05-23', 'confirmed'),
(4, 4, 1, '2024-10-01', '2024-10-05', 'confirmed');

-- ------------------------------------------------------------
-- 4️⃣ Query before partitioning (simulate unpartitioned query)
-- ------------------------------------------------------------
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

-- ------------------------------------------------------------
-- 5️⃣ Query after partitioning (on partitioned table)
-- ------------------------------------------------------------
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
