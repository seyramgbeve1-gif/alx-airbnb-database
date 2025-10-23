# Database Normalization – Airbnb Clone

## Objective
Ensure the database design follows the principles of normalization up to the Third Normal Form (3NF) to eliminate redundancy and maintain data integrity.


## 1. First Normal Form (1NF)
- Each field contains only atomic values (no arrays or lists).
- Each table has a primary key (UUID).
✅ Achieved in all entities (User, Property, Booking, Payment, Review, Message).
  

## 2. Second Normal Form (2NF)
- The database is in 1NF.
- No partial dependency exists since every table has a single-column primary key.
✅ All tables meet 2NF.


## 3. Third Normal Form (3NF)
- The database is in 2NF.
- No transitive dependencies exist (non-key columns depend only on the primary key).
✅ All entities satisfy 3NF.


## Conclusion
The Airbnb database schema meets Third Normal Form (3NF).  
Each entity stores data about one concept only, and relationships between entities are established via foreign keys.  
This ensures data integrity, scalability, and optimized storage efficiency.
