SELECT 
    (SELECT COUNT(*) FROM film) AS total_filmes,
    (SELECT COUNT(*) FROM actor) AS total_atores,
    (SELECT COUNT(*) FROM payment) AS total_pagamentos;


select * from actor;


SELECT
    actor_id,
    first_name,
    last_name,
    EXTRACT(DOW from last_update) as days_of_week,
    case
        when extract(DOW from last_update) in (0, 6) then 'Weekend'
        else 'Weekday'
        END as day_type
from actor;