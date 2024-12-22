SELECT menu.pizza_name,
       pizzeria.name AS pizzeria_name
FROM person_order
INNER JOIN person ON person_order.person_id = person.id
INNER JOIN
    (menu INNER JOIN pizzeria ON menu.pizzeria_id= pizzeria.id)
    ON person_order.menu_id = menu.id
WHERE person.name IN ('Anna', 'Denis')
ORDER BY pizza_name, pizzeria_name;