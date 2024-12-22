--Сессия№1
SHOW TRANSACTION ISOLATION LEVEL;

--Сессия№2
SHOW TRANSACTION ISOLATION LEVEL;

--Сессия№1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;				--1
UPDATE pizzeria SET rating = 1 WHERE id = 1;	            --3
UPDATE pizzeria SET rating = 3 WHERE id = 2;	            --5
COMMIT WORK;								                --7

--Сессия№2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;				--2
UPDATE pizzeria SET rating = 2 WHERE id = 2;	            --4
UPDATE pizzeria SET rating = 4 WHERE id = 1;	            --6
COMMIT WORK;								                --8