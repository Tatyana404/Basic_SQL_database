DROP TABLE "workers";
-- Создайте таблицу “workers” (“id”, “birthday”, “name”, “salary”)
CREATE TABLE "workers"(
  "id" serial PRIMARY KEY,
  "birthday" date CHECK ("birthday" < current_date),
  "name" varchar(64) NOT NULL CHECK ("name" != ''),
  "salary" decimal(10, 2) DEFAULT 0
);
/**/
-- Задачи на INSERT
-- Добавьте нового работника Никиту, 90го года, зарплата 300$.
INSERT INTO "workers" ("birthday", "name", "salary")
VALUES ('01/01/1990', 'Nikita', 300);
-- Добавьте нового работника Светлану с зарплатой 1200$.
INSERT INTO "workers" ("name", "salary")
VALUES ('Svetlana', 1200);
-- Добавьте двух новых работников одним запросом: Ярослава с зарплатой 1200$ и годом 80го, Петра с зарплатой 1000$ и 93 года.
INSERT INTO "workers" ("birthday", "name", "salary")
VALUES ('01/01/1980', 'Yaroslav', 1200),
('01/01/1993', 'Petr', 1000);
/**/
-- Задачи на UPDATE
-- Поставьте Васе зарплату в 200$.
UPDATE "workers"
SET "salary" = 200
WHERE "name" = 'Vasya';
-- Работнику с id=4 поставьте год рождения 87й.
UPDATE "workers"
SET "birthday" = '01/01/1987'
WHERE "id" = 4;
-- Всем, у кого зарплата 500$ сделайте её 700$.
UPDATE "workers"
SET "salary" = 700
WHERE "salary" = 500;
-- Работникам с id больше 2 и меньше 5 включительно поставьте год 99.
UPDATE "workers"
SET "birthday" = '01/01/1999'
WHERE "id" BETWEEN 2 AND 5;
-- Поменяйте Васю на Женю и прибавьте ему зарплату до 900$.
UPDATE "workers"
SET "name" = 'Zhenya', "salary" = 900
WHERE "name" = 'Vasya';
/**/
-- Задачи на SELECT
-- Выбрать работника с id = 3.
SELECT * FROM "workers"
WHERE "id" = 3;
-- Выбрать работников с зарплатой более 400$.
SELECT * FROM "workers"
WHERE "salary" > 400;
-- Выбрать работников с зарплатой НЕ равной 500$.
SELECT * FROM "workers"
WHERE "salary" != 500;
-- Узнайте зарплату и возраст Жени.
SELECT "salary", 
extract('year' from age("birthday")) 
AS "age" 
FROM "workers"
WHERE "name" = 'Zhenya';
-- Выбрать работников с именем Петя.
SELECT * FROM "workers"
WHERE "name" = 'Petr';
-- Выбрать всех, кроме работников с именем Петя.
SELECT * FROM "workers"
WHERE "name" != 'Petr';
-- Выбрать всех работников в возрасте 27 лет или с зарплатой 1000$.
SELECT * FROM "workers"
WHERE extract('year' from age("birthday")) = 27
OR "salary" = 1000;
-- Выбрать работников в возрасте от 25 (не включительно) до 28 лет (включительно).
SELECT * FROM "workers"
WHERE extract('year' from age("birthday")) 
BETWEEN 26 AND 28;
-- Выбрать всех работников в возрасте от 23 лет до 27 лет или с зарплатой от 400$ до 1000$.
SELECT * FROM "workers"
WHERE extract('year' from age("birthday")) 
BETWEEN 23 AND 27
OR "salary" 
BETWEEN 400 AND 1000;
-- Выбрать всех работников в возрасте 27 лет или с зарплатой не равной 400$.
SELECT * FROM "workers"
WHERE extract('year' from age("birthday")) = 27
OR "salary" != 400;
/**/
-- Задачи на DELETE
-- Удалите работника с id=7.
DELETE FROM "workers"
WHERE "id" = 7;
-- Удалите Колю.
DELETE FROM "workers"
WHERE "name" = 'Kolya';
-- Удалите всех работников, у которых возраст 23 года.
DELETE FROM "workers"
WHERE extract('year' from age("birthday")) = 23;
