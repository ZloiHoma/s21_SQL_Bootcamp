--Сессия№1
SHOW TRANSACTION ISOLATION LEVEL;

--Сессия№2
SHOW TRANSACTION ISOLATION LEVEL;

--Сессия№1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;				--1
SELECT SUM(rating) FROM pizzeria;               			--3
SELECT SUM(rating) FROM pizzeria;							--6
COMMIT WORK;												--7
SELECT SUM(rating) FROM pizzeria;							--8

--Сессия№2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;				--2
INSERT INTO pizzeria VALUES (11, 'Kazan Pizza2', 4);     	--4
COMMIT WORK;												--5
SELECT SUM(rating) FROM pizzeria;							--9


