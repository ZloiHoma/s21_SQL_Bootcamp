CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
       IN pperson varchar default 'Dmitriy',
       IN pprice numeric default 500,
       IN pdate date default '2022-01-08')
       RETURNS TABLE (name varchar) AS $$
BEGIN
RETURN QUERY
SELECT p.name AS pizzeria_name FROM person_visits pv
    INNER JOIN person_order po ON po.person_id = pv.person_id
    INNER JOIN pizzeria p ON pv.pizzeria_id = p.id
    INNER JOIN menu m ON m.id = po.menu_id AND m.pizzeria_id = p.id
    INNER JOIN person on person.id = po.person_id AND person.id = pv.person_id
    WHERE person.name = pperson AND pv.visit_date = pdate AND m.price < pprice;
END;
$$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');