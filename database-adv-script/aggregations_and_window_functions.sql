-- Task 2: Apply Aggregations and Window Functions

-- 1️⃣ Query: Total number of bookings made by each user
SELECT 
    u.user_id,
    u.name AS user_name,
    COUNT(b.booking_id) AS total_bookings
FROM users AS u
LEFT JOIN bookings AS b
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.name
ORDER BY total_bookings DESC;



-- 2️⃣ Query: Rank properties by number of bookings (using window functions)
-- First compute total bookings per property, then apply window functions.
WITH prop_counts AS (
    SELECT 
        p.property_id,
        p.property_name,
        COUNT(b.booking_id) AS total_bookings
    FROM properties AS p
    LEFT JOIN bookings AS b
        ON p.property_id = b.property_id
    GROUP BY p.property_id, p.property_name
)

SELECT
    property_id,
    property_name,
    total_bookings,
    -- RANK: ties get same rank, gaps may appear
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank,
    -- DENSE_RANK: ties get same rank, no gaps
    DENSE_RANK() OVER (ORDER BY total_bookings DESC) AS booking_dense_rank,
    -- ROW_NUMBER: unique sequential number (breaks ties arbitrarily)
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS booking_row_number
FROM prop_counts
ORDER BY total_bookings DESC;
