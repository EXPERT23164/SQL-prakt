use PostavkiTovar


/*

������� �����������
��� � S
����:
Snum � ����� ���������� (��������, S1), ������, ��������� ����.
Sname � ��������/��� ����������, ������.
Status � ������������/������ ����������, ����� �����.
City � �����, ��� ���������� ���������, ������.

������� ��������
��� � �
����:
�num � ����� ������ (��������, T1), ������, ��������� ����.
�name � ������������ ������, ������.
Price � ���� ������ (�� ���� ������� ���������), ������������ �����, ��� ����� �����
�������.
EdIzm � ������� ��������� ������, ������.
City � �����, ��� ���������� �����, ������.

������� ������������
��� � D
����:
Dnum � ����� ����������� (��������, D1), ������, ��������� ����.
Dname � �������� �����������, ������.
City � �����, ��� ����������� �����������, ������.

������� ���������
��� � STD
����:
Snum � ����� ����������, ������� �������� ����� Tnum ��� ����������� Dnum,
������, ������� ���� � ������� S.
Tnum � ����� ������, ������� ��������� ����������� Snum ��� ����������� Dnum,
������, ������� ���� � ������� �.
Dnum � ����� �����������, ��� ������� ��������� Snum �������� ����� Tnum,
������, ������� ���� � ������� D.
Kolvo � ���������� ������������� ������, ����� �����.
Dat�Post � ���� ��������, ������.
� ��������� ���� ������� ������ ���� Snum, Tnum � Dnum.

*/


--������ 1
SELECT DISTINCT S.Snum as Zadacha_1
FROM S
JOIN STD ON S.Snum = STD.Snum
WHERE STD.Kolvo>(
	SELECT MAX(Kolvo)
	FROM STD
	WHERE Snum='S1'
	);
--������ 2
SELECT Snum as Zadacha_2
FROM S
WHERE Status < (
    SELECT Status
    FROM S
    WHERE Snum = 'S1'
);
--������ 3

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
WHERE Price> 1000 AND EdIzm = '�����'


SELECT Tname,Price as ZADACHA_3
FROM Tovar_Temp5

--������ 4
UPDATE T
SET Price = Price * 0.85
WHERE City = '������' AND EdIzm = '�����, 10 ��';

SELECT Price as Zadacha_4
FROM T

--������ 5
DELETE FROM S
WHERE Status < '20';

SELECT Status as Zadacha_5
FROM S



Select City
FROM Tovar_Temp5