🎞️ Sakila DVD Rental Analytics
A comprehensive SQL study project using the Sakila Sample Database to analyze movie rental patterns, customer behavior, and business revenue.

📌 Project Overview
The Sakila database is a normalized model of a DVD rental store, featuring complex relationships between actors, films, inventory, and payments. This project serves as a sandbox for mastering:

Multi-way JOINS: Connecting 5+ tables to track a rental from customer to film category.

Data Aggregation: Using GROUP BY and HAVING to find high-value customers and popular genres.

Schema Design: Understanding Foreign Keys, Constraints, and ENUM types (MPAA Ratings).

🏗️ Database Architecture
The database consists of 15 core tables and several views. Key relationships include:

Many-to-Many: actor ↔ film (via film_actor).

One-to-Many: customer ↔ rental ↔ payment.

Geographic Hierarchy: address ↔ city ↔ country.

🚀 Getting Started
Prerequisites
PostgreSQL 14+

VSCode with the SQLTools extension.

Installation
Create the Database:

SQL
CREATE DATABASE sakila;
Run the Schema:
Execute postgres-sakila-schema.sql to build the tables.

Import Data:
Use the terminal to load the data file:

Bash
psql -d sakila -f postgres-sakila-insert-data.sql
📊 Sample Queries
1. Top 5 Most Popular Movie Categories
Find which genres are rented the most to optimize inventory.

SQL
SELECT c.name AS category, COUNT(r.rental_id) AS total_rentals
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY total_rentals DESC
LIMIT 5;
2. High-Value Customer Report
Identify customers who have spent more than $150 total.

SQL
SELECT first_name, last_name, SUM(amount) as total_spent
FROM customer
JOIN payment USING (customer_id)
GROUP BY customer_id, first_name, last_name
HAVING SUM(amount) > 150
ORDER BY total_spent DESC;
🛠️ Lessons Learned
Type Casting: Handling data mismatches (like T0 vs TO errors!) and converting ENUM types.

Role Management: Understanding the importance of OWNER TO permissions in PostgreSQL environments.

ETL Workflow: The transition from raw CSV (NBA data) to structured SQL scripts (Sakila).

Developed by Ricardo as part of the SQL Mastery Journey.