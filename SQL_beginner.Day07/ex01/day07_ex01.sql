SELECT
    per.name AS person_id,
    COUNT(*) AS count_of_visits
FROM person_visits perv
JOIN person per ON perv.person_id = per.id
GROUP BY per.name
ORDER BY count_of_visits DESC,
         per.name
         LIMIT 4;