# Query Optimization Report

## Objective
To analyze and improve the performance of a complex query that retrieves booking, user, property, and payment information.

---

## 1️⃣ Initial (Unoptimized) Query

```sql
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
