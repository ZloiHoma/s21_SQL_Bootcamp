SELECT order_date,
       (SELECT
            CONCAT (pers_information.name, ' (age:', pers_information.age, ')')) AS person_information
FROM person_order
NATURAL JOIN
    (SELECT id AS person_id, name, age FROM person) AS pers_information
ORDER BY order_date, name;
