SELECT
    pizzas.pizza_name,
    pizzeria.name AS pizzeria_name,
    pizzas.price
FROM
    pizzeria
LEFT JOIN menu AS pizzas ON pizzeria.id = pizzas.pizzeria_id
WHERE
    pizzas.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY
    pizzas.pizza_name, pizzeria_name;