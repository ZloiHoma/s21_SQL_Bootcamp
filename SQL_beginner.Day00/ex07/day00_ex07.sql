SELECT id, name, age,
CASE
    WHEN age BETWEEN 10 and  20
        THEN
        'INTERVAL#1'
    WHEN age > 20 AND age < 24
        THEN
        'INTERVAL#2'
    ELSE
        'INTERVAL#3'
    END
    AS interval_info
FROM person
ORDER BY interval_info;