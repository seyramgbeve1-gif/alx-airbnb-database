-- Task 3: Implement Indexes for Optimization
-- Objective: Identify and create indexes to improve query performance

-- 1️⃣ Identify high-usage columns
-- Common query patterns from earlier tasks:
-- - WHERE user_id = ?
-- - JOIN bookings ON users.user_id = bookings.user_id
-- - JOIN properties ON bookings.property_id = properties.property_id
-- - ORDER BY booking_date
-- - WHERE location = 'Accra'

-- 2️⃣ Create indexes on frequently accessed columns

-- Users table: used for joins and user lookups
CREATE INDEX idx_users_user_id ON users(user_id);

-- Bookings table: date-based queries and ordering
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Bookings table: joins with properties
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Properties table: location-based filtering
CREATE INDEX idx_properties_location ON properties(location);

-- 3️⃣ Measure query performance (before and after)
-- Run EXPLAIN before creating indexes to compare results later.

-- Example A: Date-based query
EXPLAIN SELECT * FROM bookings WHERE booking_date >= '2025-01-01';

-- Example B: Join query to fetch booking and property info
EXPLAIN
SELECT u.name, b.booking_date, p.property_name
FROM users u
JOIN bookings b ON u.user_id = b.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE p.location = 'Accra';

-- ✅ After indexes are added, run the same EXPLAIN again
-- You should notice reduced cost and use of idx_* indexes in the plan.
-- ============================================================
-- DATABASE INDEX CREATION SCRIPT
-- Project: alx-airbnb-database
-- Task: 3 - Implement Indexes for Optimization
-- ============================================================

-- Bookings table indexes
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Users table index
CREATE INDEX idx_users_email ON users(email);

-- Properties table index
CREATE INDEX idx_properties_location ON properties(location);

-- ============================================================
-- End of database_index.sql
-- ============================================================
-- ============================================================
-- DATABASE INDEX CREATION AND PERFORMANCE TEST
-- Project: alx-airbnb-database
-- Task: 3 - Implement Indexes for Optimization
-- ============================================================

-- ------------------------------------------------------------
-- 1️⃣ Bookings table indexes
-- ------------------------------------------------------------
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_user_status ON bookings(user_id, status);

-- ------------------------------------------------------------
-- 2️⃣ Users table index
-- ------------------------------------------------------------
CREATE INDEX idx_users_email ON users(email);

-- ------------------------------------------------------------
-- 3️⃣ Properties table index
-- ------------------------------------------------------------
CREATE INDEX idx_properties_location ON properties(location);

-- ============================================================
-- PERFORMANCE MEASUREMENT
-- ============================================================

-- 🧩 Before Index Creation
-- (For documentation: this part would normally be tested before creating the indexes)
-- You can re-run this in DB Fiddle before creating indexes to get the baseline.

EXPLAIN ANALYZE
SELECT b.id, b.user_id, b.property_id, b.status, u.email
FROM bookings b
JOIN users u ON b.user_id = u.id
WHERE b.user_id = 3 AND b.status = 'confirmed'
ORDER BY b.id;

-- ⚙️ After Index Creation
-- Now that indexes exist, measure again.
EXPLAIN ANALYZE
SELECT b.id, b.user_id, b.property_id, b.status, u.email
FROM bookings b
JOIN users u ON b.user_id = u.id
WHERE b.user_id = 3 AND b.status = 'confirmed'
ORDER BY b.id;

-- ============================================================
-- END OF FILE
-- ============================================================
