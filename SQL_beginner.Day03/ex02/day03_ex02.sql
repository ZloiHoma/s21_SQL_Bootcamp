WITH cte_ids AS (SELECT * FROM menu
		 WHERE id NOT IN (SELECT menu_id FROM person_order))
SELECT
  cte_ids.pizza_name,
  cte_ids.price,
  pizzeria.name AS pizzeria_name
FROM cte_ids
JOIN pizzeria ON cte_ids.pizzeria_id = pizzeria.id
ORDER BY cte_ids.pizza_name, cte_ids.price;