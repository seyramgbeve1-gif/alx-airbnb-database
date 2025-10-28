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

- ---

## Task 2: Apply Aggregations and Window Functions

### Objective
Use SQL aggregation and window functions to perform analytical operations on Airbnb booking data.

### Files
- `aggregations_and_window_functions.sql` — contains queries for aggregation and ranking.

---

### 1️⃣ Aggregation Query: Total Bookings per User
**Goal:** Find the total number of bookings made by each user.

**SQL Logic:**
- Join the `users` and `bookings` tables.
- Use the `COUNT()` function to count bookings per user.
- Use `GROUP BY` to group by each unique user.

**Expected Output Example:**
| user_id | user_name | total_bookings |
|----------|-------------|----------------|
| 1 | Kwame Mensah | 5 |
| 2 | Sarah Boateng | 3 |
| 3 | Kojo Antwi | 0 |

---

### 2️⃣ Window Function Query: Rank Properties by Bookings
**Goal:** Rank properties based on how many bookings they’ve received.

**SQL Logic:**
- Join `properties` and `bookings` tables.
- Use `COUNT()` to get total bookings per property.
- Apply the `RANK()` window function to order properties by popularity.

**Expected Output Example:**
| property_id | property_name | total_bookings | booking_rank |
|--------------|----------------|----------------|---------------|
| 45 | Accra Luxury Loft | 12 | 1 |
| 33 | Beachfront Villa | 8 | 2 |
| 77 | Cozy Apartment | 8 | 2 |
| 21 | City Center Studio | 4 | 3 |

---

### Summary
This task demonstrates:
- How to use **COUNT()** and **GROUP BY** for summarization.
- How to apply **window functions** like `RANK()` to create analytics.
- How to analyze user and property activity trends efficiently.


