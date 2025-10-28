-- INNER JOIN: Users and their bookings
SELECT 
    u.user_id,
    u.name AS user_name,
    b.booking_id,
    b.property_id,
    b.booking_date
FROM users AS u
INNER JOIN bookings AS b
    ON u.user_id = b.user_id
ORDER BY b.booking_date DESC;

-- LEFT JOIN: Properties with and without reviews
SELECT 
    p.property_id,
    p.property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM properties AS p
LEFT JOIN reviews AS r
    ON p.property_id = r.property_id
ORDER BY p.property_id;

-- FULL OUTER JOIN (emulated with UNION for MySQL)
SELECT 
    u.user_id,
    u.name AS user_name,
    b.booking_id,
    b.property_id
FROM users AS u
LEFT JOIN bookings AS b
    ON u.user_id = b.user_id

UNION

SELECT 
    u.user_id,
    u.name AS user_name,
    b.booking_id,
    b.property_id
FROM users AS u
RIGHT JOIN bookings AS b
    ON u.user_id = b.user_id
ORDER BY user_id;
