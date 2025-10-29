-- ============================================================
-- COMPLEX QUERY PERFORMANCE TEST
-- Project: alx-airbnb-database
-- Task: 4 - Optimize Complex Queries
-- ============================================================

-- ------------------------------------------------------------
-- 1️⃣ INITIAL (UNOPTIMIZED) QUERY
-- ------------------------------------------------------------
-- This query retrieves all bookings with user, property, and payment info
-- It performs multiple joins without filters, which can cause full scans.

EXPLAIN ANALYZE
SELECT b.id AS booking_id,
       b.user_id,
       b.property_id,
       b.status,
       u.name AS user_name,
       u.email,
       p.title AS property_title,
       p.location,
       pay.amount,
       pay.payment_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;

-- ------------------------------------------------------------
-- 2️⃣ OPTIMIZED QUERY
-- ------------------------------------------------------------
-- Improvements:
-- - Filters results to confirmed bookings
-- - Uses only necessary columns
-- - Relies on existing indexes (user_id, status, property_id)
-- - Avoids unnecessary sorting or joins

EXPLAIN ANALYZE
SELECT b.id AS booking_id,
       u.name AS user_name,
       u.email,
       p.title AS property_title,
       pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
WHERE b.status = 'confirmed';
