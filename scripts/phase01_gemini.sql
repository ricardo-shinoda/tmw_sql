-- Phase 1: Filtering & Formatting
-- Focus: SELECT, WHERE, and String manipulation.
-- Full Names: Concatenate first_name and last_name with a space, and alias it as actor_name.
SELECT
    CONCAT(first_name, ' ', last_name) AS actor_name
FROM actor;

-- Specific Initials: Find all actors whose last name starts with 'C' and ends with 'N'.
SELECT
    *
FROM actor
WHERE last_name like 'C%';

-- Rental Durations: List all films where the rental duration is between 3 and 5 days.

select
    rental_date,
    return_date,
    return_date::date - rental_date::date as rental_duration
from rental
WHERE return_date::date - rental_date::date BETWEEN 3 AND 5;

-- Rating Distribution: Find all movies rated 'G', 'PG', or 'PG-13'. Use the IN operator.

SELECT
    *
FROM film
WHERE rating IN ('G', 'PG', 'PG-13');

-- Null Check: Find all addresses where the address2 column is null.

SELECT
    *
FROM address
WHERE address2 IS NULL;