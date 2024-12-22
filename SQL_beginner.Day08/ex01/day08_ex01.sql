--Сессия№1
SHOW TRANSACTION ISOLATION LEVEL;

--Сессия№2
SHOW TRANSACTION ISOLATION LEVEL;

--Сессия№1
BEGIN;                                                      --1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';            --3
UPDATE pizzeria SET rating = 4  WHERE name = 'Pizza Hut';   --5
COMMIT WORK;                                                --7
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';            --9

--Сессия№2
BEGIN;                                                      --2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';            --4
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';  --6
COMMIT WORK;                                                --8
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';            --10