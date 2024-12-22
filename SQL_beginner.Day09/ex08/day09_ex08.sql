CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE(fib_num INTEGER) AS $$
    WITH RECURSIVE fib(n1, n2) AS (
        SELECT 0, 1
        UNION ALL
        SELECT n2, n1 + n2 FROM fib WHERE n2 < pstop)
    SELECT n1 FROM fib;
$$ LANGUAGE SQL;


select * from fnc_fibonacci(100);
select * from fnc_fibonacci();