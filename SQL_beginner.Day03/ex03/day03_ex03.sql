WITH female_vis AS
    (SELECT pizzeria.name AS pizzeria_name FROM person_visits
         INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
         INNER JOIN person ON person_visits.person_id = person.id
     WHERE person.gender = 'female'),
male_vis AS
    (SELECT pizzeria.name AS pizzeria_name FROM person_visits
         INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
         INNER JOIN person ON person_visits.person_id = person.id
     WHERE person.gender = 'male')

SELECT pizzeria_name FROM (
SELECT pizzeria_name FROM female_vis

EXCEPT ALL

  SELECT pizzeria_name FROM male_vis) AS female_only

UNION ALL

SELECT pizzeria_name FROM (
SELECT pizzeria_name FROM male_vis

EXCEPT ALL

SELECT pizzeria_name FROM female_vis) AS male_only

ORDER BY pizzeria_name;
