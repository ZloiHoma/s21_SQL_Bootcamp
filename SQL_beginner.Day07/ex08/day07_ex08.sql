SELECT
    per.address,
    piz.name,
    COUNT(po.menu_id) AS count_of_orders
FROM person per
LEFT JOIN person_order po ON po.person_id = per.id
LEFT JOIN menu m ON po.menu_id = m.id
LEFT JOIN pizzeria piz ON m.pizzeria_id = piz.id
GROUP BY per.address, piz.name
ORDER BY per.address, piz.name;