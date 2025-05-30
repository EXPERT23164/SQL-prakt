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


--ЗАДАЧА 1
SELECT DISTINCT S.Snum as Zadacha_1
FROM S
JOIN STD ON S.Snum = STD.Snum
WHERE STD.Kolvo>(
	SELECT MAX(Kolvo)
	FROM STD
	WHERE Snum='S1'
	);
--ЗАДАЧА 2
SELECT Snum as Zadacha_2
FROM S
WHERE Status < (
    SELECT Status
    FROM S
    WHERE Snum = 'S1'
);
--ЗАДАЧА 3

CREATE TABLE Tovar_Temp5  ( 
	Tnum VARCHAR (10) PRIMARY KEY,
	Tname VARCHAR(100),
	Price DECIMAL (10,2),
	EdIzm VARCHAR (20),
	City VARCHAR(50)
	); 

INSERT INTO Tovar_Temp5(Tnum,Tname,Price,EdIzm,City) 
SELECT Tnum,Tname,Price,EdIzm,City
FROM T
WHERE Price> 1000 AND EdIzm = 'пачка'


SELECT Tname,Price as ZADACHA_3
FROM Tovar_Temp5

--ЗАДАЧА 4
UPDATE T
SET Price = Price * 0.85
WHERE City = 'Москва' AND EdIzm = 'пачка, 10 кг';

SELECT Price as Zadacha_4
FROM T

--ЗАДАЧА 5
DELETE FROM S
WHERE Status < '20';

SELECT Status as Zadacha_5
FROM S



Select City
FROM Tovar_Temp5