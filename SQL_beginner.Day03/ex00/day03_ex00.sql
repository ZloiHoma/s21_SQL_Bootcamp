SELECT menu.pizza_name, menu.price,
       pizzeria.name, person_visits.visit_date
FROM person_visits

INNER JOIN person ON person_visits.person_id = person.id
INNER JOIN menu ON person_visits.pizzeria_id = menu.pizzeria_id
INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE person.name = 'Kate'
  AND menu.price BETWEEN 800 AND 1000
ORDER BY menu.pizza_name, menu.price, pizzeria.name;
