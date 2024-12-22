WITH RECURSIVE nodes AS (

SELECT r.point1 AS path, r.point1, r.point2, r.cost FROM roads r
    WHERE r.point1 = 'a'

    UNION

SELECT CONCAT(n.path, ',', r.point1) AS path, r.point1, r.point2, n.cost + r.cost FROM nodes n
    JOIN roads r ON n.point2 = r.point1
        WHERE n.path NOT LIKE CONCAT('%', r.point1, '%')
)

SELECT n.cost AS total_cost, CONCAT('{', n.path, ',a}') AS tour FROM nodes n
    WHERE LENGTH(n.path) = 7 AND n.point2 = 'a' AND n.cost = (
SELECT MIN(n2.cost) FROM nodes n2
    WHERE LENGTH(n2.path) = 7 AND n2.point2 = 'a'
)
ORDER BY total_cost, tour;
