SELECT
    p.name,
    m.pizza_name,
    m.price,
    ROUND(m.price - (m.price * COALESCE(pd.discount, 0) / 100), 2) AS discounted_price,
    pz.name AS pizzeria_name
FROM person_order po
    JOIN person p ON po.person_id = p.id
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    LEFT JOIN person_discounts pd ON p.id = pd.person_id AND pd.pizzeria_id = m.pizzeria_id
ORDER BY p.name, m.pizza_name;