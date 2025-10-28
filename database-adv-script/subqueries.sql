-- Query 1: Find properties where the average rating is greater than 4.0
SELECT 
    p.property_id,
    p.property_name,
    p.location
FROM properties AS p
WHERE p.property_id IN (
    SELECT 
        r.property_id
    FROM reviews AS r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
)
ORDER BY p.property_id;


-- Query 2: Find users who have made more than 3 bookings
SELECT 
    u.user_id,
    u.name AS user_name,
    u.email
FROM users AS u
WHERE (
    SELECT COUNT(*)
    FROM bookings AS b
    WHERE b.user_id = u.user_id
) > 3
ORDER BY u.user_id;
