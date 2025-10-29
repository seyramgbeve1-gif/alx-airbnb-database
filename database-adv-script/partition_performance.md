# Partitioning Performance Report

## Objective
The goal was to improve query performance on the large `bookings` table by implementing partitioning based on the `start_date` column.

## Implementation
The `bookings` table was recreated as `bookings_partitioned` and partitioned by **YEAR(start_date)**.  
Partitions were defined for 2022, 2023, 2024, and a `pmax` partition for all future dates.

Example partition structure:
```sql
PARTITION BY RANGE (YEAR(start_date)) (
  PARTITION p2022 VALUES LESS THAN (2023),
  PARTITION p2023 VALUES LESS THAN (2024),
  PARTITION p2024 VALUES LESS THAN (2025),
  PARTITION pmax VALUES LESS THAN MAXVALUE
);
