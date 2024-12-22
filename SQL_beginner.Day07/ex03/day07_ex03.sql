SELECT
    name,
    (SELECT COUNT(po.menu_id) FROM person_order po
        JOIN menu m ON po.menu_id = m.id
        WHERE m.pizzeria_id = pizzeria.id) +
    (SELECT COUNT(pv.pizzeria_id) FROM person_visits pv
     WHERE pv.pizzeria_id = pizzeria.id) AS total_count
FROM pizzeria
ORDER BY total_count DESC, name;