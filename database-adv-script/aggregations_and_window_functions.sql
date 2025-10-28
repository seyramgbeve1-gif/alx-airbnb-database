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

-- Explanation:
-- This query counts how many bookings each user has made.
-- LEFT JOIN ensures users with zero bookings also appear (with a count of 0).



-- 2️⃣ Query: Rank properties by number of bookings (using window functions)
SELECT 
    p.property_id,
    p.property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM properties AS p
LEFT JOIN bookings AS b
    ON p.property_id = b.property_id
GROUP BY p.property_id, p.property_name
ORDER BY booking_rank;

-- Explanation:
-- COUNT aggregates the number of bookings per property.
-- RANK() assigns rankings based on total bookings.
-- Properties with equal booking counts share the same rank.
