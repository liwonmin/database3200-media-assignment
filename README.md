# Media Database SQL Assignment  
Database 3200 – SQLite

## Overview
This repository contains my SQL queries for the Media Database assignment in Database 3200.  
The database was loaded into SQLite, and I wrote queries based on the ERD that was provided in class.

Each question is written in a separate `.sql` file as required.



## Files

- q1.sql – Last names and emails of customers who made purchases  
- q2.sql – Album titles and their corresponding artists  
- q3.sql – Number of unique customers in each state  
- q4.sql – States with more than 10 unique customers  
- q5.sql – Artists who have an album with "symphony" in the title  
- q6.sql – Artists who performed MPEG tracks in specific playlists  
- q7.sql – Number of artists who published at least 10 MPEG tracks  
- q8.sql – Playlists longer than 2 hours (length shown in hours)  
- q9.sql – Creative query using a window function  



## Creative Query Explanation (q9)

For the creative part of this assignment, I created a query that finds the top 3 highest-spending customers in each state.

This query:
- Joins three tables (customers, invoices, and invoice_items)
- Calculates the total amount each customer spent
- Uses a window function (`RANK() OVER (PARTITION BY State ORDER BY TotalSpent DESC)`) to rank customers within each state
- Returns only the top 3 customers per state

This query shows my understanding of joins, grouping, aggregation, and window functions in SQL.
