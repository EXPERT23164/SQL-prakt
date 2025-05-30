--Задание 1
SELECT DISTINCT T.Tname
FROM T, STD, D, S
WHERE T.Tnum = STD.Tnum 
  AND D.Dnum = STD.Dnum 
  AND S.Snum = STD.Snum 
  AND S.City = D.City;


  --Задание 2
  SELECT DISTINCT S.Sname
FROM S, STD
WHERE S.Snum = STD.Snum 
  AND STD.Dnum = 'D1';


 -- Задание 3
  SELECT DISTINCT S.City AS SupplierCity, D.City AS OrganizationCity
FROM S, D, STD
WHERE S.Snum = STD.Snum 
  AND D.Dnum = STD.Dnum;


  -- задание 4
  SELECT DISTINCT T.Tnum
FROM T, STD, S
WHERE T.Tnum = STD.Tnum 
  AND S.Snum = STD.Snum 
  AND S.Status > 50;