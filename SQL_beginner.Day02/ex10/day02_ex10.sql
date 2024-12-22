SELECT
    pers1.name AS person_name1,
    pers2.name AS person_name2,
    pers1.address AS common_address
FROM person AS pers1
INNER JOIN person AS pers2 ON pers1.address = pers2.address
WHERE
    pers1.name != pers2.name
    AND pers1.id > pers2.id
ORDER BY 1, 2, 3;