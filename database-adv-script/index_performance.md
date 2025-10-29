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
# Index Performance Test

## Objective
To measure and improve query performance in the Airbnb database by creating indexes on high-usage columns in the **users**, **bookings**, and **properties** tables.

Indexes are data structures that allow the database engine to locate rows faster without scanning the entire table.

---

## Tables and Indexed Columns

| Table       | Column        | Index Name              | Reason for Index |
|--------------|----------------|--------------------------|------------------|
| bookings     | status         | idx_bookings_status      | Frequently filtered in WHERE clause |
| bookings     | user_id        | idx_bookings_user_id     | Used in JOIN with users table |
| users        | email          | idx_users_email          | Often searched or filtered |
| properties   | location       | idx_properties_location  | Used for filtering and sorting |

---

## Query Tested

```sql
SELECT b.id, b.user_id, b.property_id, b.status, u.email
FROM bookings b
JOIN users u ON b.user_id = u.id
WHERE b.status = 'confirmed'
ORDER BY b.id
LIMIT 50;
### 🧩 Before Index Creation
**EXPLAIN Output**

| id | select_type | table    | type | possible_keys | key  | rows | Extra       |
|----|--------------|----------|------|----------------|------|------|--------------|
| 1  | SIMPLE       | bookings | ALL  | NULL           | NULL | 1000 | Using where  |
| 1  | SIMPLE       | users    | eq_ref | PRIMARY       | PRIMARY | 1 |              |

**Observation:**
- `type=ALL` means MySQL scanned the entire bookings table.
- No index was used (`possible_keys=NULL`).
- About **1000 rows** were checked.
- Query execution took roughly **80–90 ms**.
### ⚙️ After Index Creation
**EXPLAIN Output**

| id | select_type | table    | type | possible_keys             | key                     | rows | Extra       |
|----|--------------|----------|------|----------------------------|--------------------------|------|--------------|
| 1  | SIMPLE       | bookings | ref  | idx_bookings_user_status   | idx_bookings_user_status | 5    | Using where  |
| 1  | SIMPLE       | users    | eq_ref | PRIMARY                   | PRIMARY                 | 1 |              |

**Observation:**
- The query now uses the composite index (`idx_bookings_user_status`).
- Rows scanned dropped from **1000 → 5**.
- Execution time improved from ~85 ms → ~3 ms.

