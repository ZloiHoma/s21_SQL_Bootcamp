WITH female_piz AS
    (SELECT pizzeria.name AS pizzeria_name FROM menu
        INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
        INNER JOIN person_order ON person_order.menu_id = menu.id
        JOIN person on person_order.person_id = person.id
    WHERE person.gender = 'female'),
male_piz AS
    (SELECT pizzeria.name AS pizzeria_name FROM menu
        INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
        INNER JOIN person_order ON person_order.menu_id = menu.id
        JOIN person on person_order.person_id = person.id
    WHERE person.gender = 'male')

SELECT pizzeria_name FROM female_piz
WHERE pizzeria_name NOT IN
      (SELECT pizzeria_name FROM male_piz)

UNION

SELECT pizzeria_name FROM male_piz
WHERE pizzeria_name NOT IN
      (SELECT pizzeria_name FROM female_piz)

ORDER BY pizzeria_name;