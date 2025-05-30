use PostavkiTovar


/*

Таблица «Поставщики»
Имя – S
Поля:
Snum – номер поставщика (например, S1), строка, первичный ключ.
Sname – название/имя поставщика, строка.
Status – престижность/статус поставщика, целое число.
City – город, где расположен поставщик, строка.

Таблица «Товары»
Имя – Т
Поля:
Тnum – номер товара (например, T1), строка, первичный ключ.
Тname – наименование товара, строка.
Price – цена товара (за одну единицу измерения), вещественное число, две знака после
запятой.
EdIzm – единицы измерения товара, строка.
City – город, где расположен товар, строка.

Таблица «Организации»
Имя – D
Поля:
Dnum – номер организации (например, D1), строка, первичный ключ.
Dname – название организации, строка.
City – город, где расположена организация, строка.

Таблица «Поставки»
Имя – STD
Поля:
Snum – номер поставщика, который поставил товар Tnum для организации Dnum,
строка, внешний ключ к таблице S.
Tnum – номер товара, который поставлен поставщиком Snum для организации Dnum,
строка, внешний ключ к таблице Т.
Dnum – номер организации, для которой поставщик Snum поставил товар Tnum,
строка, внешний ключ к таблице D.
Kolvo – количество поставленного товара, целое число.
DatеPost – дата поставки, строка.
В первичный ключ таблицы входят поля Snum, Tnum и Dnum.

*/



-- ЗАДАЧА 1
SELECT Sname AS ZADACHA_1
FROM S
WHERE Status BETWEEN 50 AND 100;

--ЗАДАЧА 2
SELECT COUNT(*) AS MoscowSuppliersCount_ZADACHA_2
FROM S
WHERE City = 'Москва';
--ЗАДАЧА 3
SELECT SUM(T.Price * STD.Kolvo) AS TotalCost_ZADACHA_3
FROM STD
JOIN  T ON STD.Tnum = T.Tnum
WHERE STD.Dnum = 'D1';
--ЗАДАЧА 4
SELECT S.Sname, AVG(T.Price) AS AvgPricePerSupplier_ZADACHA__4
FROM  S
JOIN  STD ON S.Snum = STD.Snum
JOIN  T ON STD.Tnum = T.Tnum
GROUP BY S.Sname;
--ЗАДАЧА 5
SELECT DISTINCT City AS ZADACHA_5
FROM (
    SELECT City FROM S
    UNION
    SELECT City FROM T
    UNION
    SELECT City FROM D
) AS Cities;
