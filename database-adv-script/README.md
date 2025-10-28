#Write Complex Queries with Joins

## Objective
Master SQL joins by combining multiple tables in the Airbnb database to extract meaningful insights.

## Files
- `joins_queries.sql` — contains INNER JOIN, LEFT JOIN, and FULL OUTER JOIN queries.
- `README.md` — documentation for the queries.

## Query Details

### 1️⃣ INNER JOIN
Retrieves all bookings and the users who made them.

### 2️⃣ LEFT JOIN
Retrieves all properties and their reviews, including properties that have no reviews.

### 3️⃣ FULL OUTER JOIN
Retrieves all users and all bookings, even if a user has no booking or a booking is not linked to a user.

## Expected Output
Each query should return:
- **INNER JOIN:** Only users who made bookings.  
- **LEFT JOIN:** All properties, including those without reviews.  
- **FULL OUTER JOIN:** All users and all bookings, regardless of link.

## Project Repository
**GitHub Repo:** `alx-airbnb-database`  
**Directory:** `database-adv-script`

---

## Task 1: Practice Subqueries

### Objective
Enhance SQL skills by writing both correlated and non-correlated subqueries to extract advanced insights from the Airbnb database.

### Files
- `subqueries.sql` — contains the SQL queries for this task.
- `README.md` — documentation explaining the subqueries and their logic.

---

### 1️⃣ Non-Correlated Subquery
**Goal:** Find all properties where the average rating is greater than 4.0.

**SQL Logic:**
- The subquery calculates the average rating for each property from the `reviews` table.
- The main query retrieves properties from the `properties` table whose IDs appear in the subquery (i.e., those with an average rating > 4.0).

**Expected Output Example:**
| property_id | property_name | location |
|--------------|----------------|-----------|
| 101 | Cozy Apartment | Accra |
| 202 | Beachfront Villa | Takoradi |

---

### 2️⃣ Correlated Subquery
**Goal:** Find all users who have made more than 3 bookings.

**SQL Logic:**
- The subquery counts the number of bookings for each user inside the main query.
- It runs once per user (hence “correlated”), returning users who exceed 3 total bookings.

**Expected Output Example:**
| user_id | user_name | email |
|----------|-------------|--------|
| 12 | Sarah Boateng | sarah@example.com |
| 29 | Kwame Mensah | kwame@example.com |

---

### Summary
This task demonstrates how to:
- Use **non-correlated subqueries** for aggregated conditions.  
- Use **correlated subqueries** for row-by-row comparisons.  
- Combine logic to produce efficient, readable SQL for analytical use cases.

