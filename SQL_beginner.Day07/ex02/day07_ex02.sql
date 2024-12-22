WITH visits AS (SELECT
                    pi.name,
                    COUNT(pv.pizzeria_id) AS visit_count,
                    'visit' AS action_type
                FROM person_visits pv
                    JOIN pizzeria pi ON pv.pizzeria_id = pi.id
                GROUP BY pi.name
                ORDER BY visit_count DESC
                LIMIT 3 ),
orders AS (SELECT
               pi.name,
               COUNT(po.menu_id) AS order_count,
               'order' AS action_type
           FROM person_order po
               JOIN menu m ON po.menu_id = m.id
               JOIN pizzeria pi ON m.pizzeria_id = pi.id
           GROUP BY pi.name
           ORDER BY order_count DESC
           LIMIT 3)

SELECT
    name,
    visit_count AS count,
    action_type
FROM visits

UNION ALL

SELECT
    name,
    order_count AS count,
    action_type
FROM orders

ORDER BY
    action_type,
    count DESC;