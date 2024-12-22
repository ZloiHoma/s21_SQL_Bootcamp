SELECT pizzeria.name AS pizzeria_name
FROM person_visits
INNER JOIN person ON person_visits.person_id = person.id
INNER JOIN
    ( menu INNER JOIN pizzeria ON menu.pizzeria_id= pizzeria.id)
    ON person_visits.pizzeria_id = menu.pizzeria_id
WHERE person.name = 'Dmitriy'
  AND visit_date = '2022-01-08'
  AND price < 800;