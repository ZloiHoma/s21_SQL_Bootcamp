WITH cte_pizza_pep AS (
    SELECT person.name FROM person_order
    INNER JOIN person ON person_order.person_id = person.id
    INNER JOIN menu ON menu.id = person_order.menu_id
    WHERE person.gender = 'female' AND menu.pizza_name = 'pepperoni pizza'),
cte_pizza_chee AS (
    SELECT person.name FROM person_order
    INNER JOIN person  ON person_order.person_id = person.id
    INNER JOIN menu  ON menu.id = person_order.menu_id
    WHERE person.gender = 'female' AND menu.pizza_name = 'cheese pizza')

SELECT name
FROM person
WHERE name IN (SELECT *
               FROM cte_pizza_pep)
  AND name IN (SELECT * FROM cte_pizza_chee)
ORDER BY name;