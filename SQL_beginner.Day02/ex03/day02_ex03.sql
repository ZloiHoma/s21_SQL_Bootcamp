WITH days AS (
  SELECT generate_series('2022-01-01', '2022-01-10', INTERVAL '1 day')::DATE AS missing_date),
    pers_visits AS
        (SELECT *
        FROM person_visits
        WHERE person_id = 1 OR person_id = 2
)
SELECT missing_date
FROM days
LEFT JOIN pers_visits ON missing_date = visit_date
WHERE visit_date IS NULL
ORDER BY missing_date;
