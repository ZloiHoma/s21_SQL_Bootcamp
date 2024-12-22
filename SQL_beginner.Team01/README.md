# Начальное заполенение таблицы маршрутов

```sql

DROP TABLE IF EXISTS roads;

CREATE TABLE roads(
  point1 VARCHAR,
  point2 VARCHAR,
  cost INTEGER,
PRIMARY KEY (point1, point2)
);

INSERT INTO roads(point1, point2, cost)
VALUES
  ('a', 'b', 10),
  ('b', 'a', 10),
  ('a', 'c', 15),
  ('c', 'a', 15),
  ('a', 'd', 20),
  ('d', 'a', 20),
  ('b', 'd', 25),
  ('d', 'b', 25),
  ('d', 'c', 30),
  ('c', 'd', 30),
  ('b', 'c', 35),
  ('c', 'b', 35);

```
# Задание ex00
```sql

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

```
# Задание ex01
```sql
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
) OR n.cost = (
SELECT MAX(n2.cost) FROM nodes n2
    WHERE LENGTH(n2.path) = 7 AND n2.point2 = 'a'
)
ORDER BY total_cost, tour;
```