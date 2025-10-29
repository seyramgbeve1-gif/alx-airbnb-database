-- ============================================================
-- COMPLEX QUERY PERFORMANCE TEST
-- Project: alx-airbnb-database
-- Task: 4 - Optimize Complex Queries
-- ============================================================

-- ------------------------------------------------------------
-- 1️⃣ INITIAL (UNOPTIMIZED) QUERY
-- ------------------------------------------------------------
-- Retrieves all bookings with user, property, and payment info
-- Performs multiple joins without filters, causing full scans

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
-- - Uses WHERE with multiple filters (AND)
-- - Uses only necessary columns
-- - Takes advantage of indexes on status, user_id, and property_id

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
WHERE b.status = 'confirmed'
  AND pay.amount > 0;
