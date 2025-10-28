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
