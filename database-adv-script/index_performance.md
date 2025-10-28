# Task 3: Implement Indexes for Optimization

### 🎯 Objective
Enhance SQL query performance by identifying frequently used columns, creating indexes, and verifying improvements using `EXPLAIN` or `ANALYZE`.

---

## 🔍 Step 1: Identify High-Usage Columns

| Table | Column | Reason for Indexing |
|--------|---------|--------------------|
| `users` | `user_id` | Used in JOIN with bookings |
| `bookings` | `booking_date` | Used in WHERE and ORDER BY clauses |
| `bookings` | `property_id` | Used in JOIN with properties |
| `properties` | `location` | Used for filtering and search queries |

---

## ⚙️ Step 2: Create Indexes

```sql
CREATE INDEX idx_users_user_id ON users(user_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_properties_location ON properties(location);
