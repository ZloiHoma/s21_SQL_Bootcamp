SELECT days::date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS days
LEFT JOIN person_visits
  ON days = person_visits.visit_date
         AND (person_visits.person_id = 1 OR person_visits.person_id = 2)
WHERE person_visits.visit_date IS NULL
ORDER BY days;