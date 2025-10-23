-- Airbnb Database Sample Data (Seeding Script)
-- Run this AFTER schema.sql has been created

-- ======================================================
-- USERS
-- ======================================================
INSERT INTO User (first_name, last_name, email, password_hash, phone_number, role)
VALUES
('Kingsley', 'Doe', 'kingsley@example.com', 'hashed_pass_1', '0244000001', 'guest'),
('Michael', 'Smith', 'michael@example.com', 'hashed_pass_2', '0244000002', 'host'),
('Anna', 'Johnson', 'anna@example.com', 'hashed_pass_3', '0244000003', 'host'),
('Sophia', 'Brown', 'sophia@example.com', 'hashed_pass_4', '0244000004', 'guest'),
('Admin', 'User', 'admin@example.com', 'hashed_admin', '0244000000', 'admin');

-- ======================================================
-- PROPERTIES
-- ======================================================
INSERT INTO Property (host_id, name, description, location, price_per_night)
VALUES
((SELECT user_id FROM User WHERE email='michael@example.com'),
 'Cozy Beach Apartment',
 'A small but comfortable apartment near the beach.',
 'Accra, Ghana',
 150.00),

((SELECT user_id FROM User WHERE email='anna@example.com'),
 'Mountain View Cabin',
 'Peaceful cabin overlooking the mountains.',
 'Aburi, Ghana',
 200.00);

-- ======================================================
-- BOOKINGS
-- ======================================================
INSERT INTO Booking (property_id, user_id, start_date, end_date, total_price, status)
VALUES
((SELECT property_id FROM Property WHERE name='Cozy Beach Apartment'),
 (SELECT user_id FROM User WHERE email='kingsley@example.com'),
 '2025-11-01', '2025-11-05', 600.00, 'confirmed'),

((SELECT property_id FROM Property WHERE name='Mountain View Cabin'),
 (SELECT user_id FROM User WHERE email='sophia@example.com'),
 '2025-12-10', '2025-12-15', 1000.00, 'pending');

-- ======================================================
-- PAYMENTS
-- ======================================================
INSERT INTO Payment (booking_id, amount, payment_method)
VALUES
((SELECT booking_id FROM Booking WHERE total_price=600.00),
 600.00, 'credit_card'),

((SELECT booking_id FROM Booking WHERE total_price=1000.00),
 1000.00, 'paypal');

-- ======================================================
-- REVIEWS
-- ======================================================
INSERT INTO Review (property_id, user_id, rating, comment)
VALUES
((SELECT property_id FROM Property WHERE name='Cozy Beach Apartment'),
 (SELECT user_id FROM User WHERE email='kingsley@example.com'),
 5, 'Amazing experience! Clean and peaceful.'),

((SELECT property_id FROM Property WHERE name='Mountain View Cabin'),
 (SELECT user_id FROM User WHERE email='sophia@example.com'),
 4, 'Loved the view, but could use better WiFi.');

-- ======================================================
-- MESSAGES
-- ======================================================
INSERT INTO Message (sender_id, recipient_id, message_body)
VALUES
((SELECT user_id FROM User WHERE email='kingsley@example.com'),
 (SELECT user_id FROM User WHERE email='michael@example.com'),
 'Hello! Is the beach apartment available for next month?'),

((SELECT user_id FROM User WHERE email='michael@example.com'),
 (SELECT user_id FROM User WHERE email='kingsley@example.com'),
 'Hi Kingsley! Yes, it’s available. Would you like to book again?');

-- ======================================================
-- END OF SEED DATA
-- ======================================================
