SELECT
  address,
  ROUND(MAX(age) - MIN(age) / MAX(age::numeric), 2) AS formula,
  ROUND(AVG(age), 2) AS average,
  CASE
    WHEN (SELECT ROUND(MAX(age) - MIN(age) / MAX(age::numeric), 2) FROM person p2
    WHERE p2.address = p1.address) > (SELECT ROUND(AVG(age), 2) FROM person p2
    WHERE p2.address = p1.address)
    THEN 'true'
    ELSE 'false'
  END AS comparison
FROM person p1
GROUP BY address
ORDER BY address;