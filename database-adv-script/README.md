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
