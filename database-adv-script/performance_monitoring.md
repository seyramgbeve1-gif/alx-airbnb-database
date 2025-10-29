# Database Performance Monitoring and Refinement Report

## Objective
The goal of this task was to continuously monitor and refine database performance using tools like `EXPLAIN ANALYZE` and `SHOW PROFILE` to detect slow queries and improve them.

## Queries Monitored
Two main queries were analyzed:

### Query 1: Bookings Join Query
```sql
SELECT b.id, u.name, p.title
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE b.status = 'confirmed';
