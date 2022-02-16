USE ClubsBase;

--��� ����� ������ ����� �������� Real � Barcelona.
--������� ��� �������� ������� ������ � ��

--�������� ��� ������ �� ����� � ������, � ������� ��� �������.
SELECT Persons.IIN, Persons.LastName, Persons.FirstName, Clubs.ClubName
  FROM Persons LEFT JOIN PersonsToClubs
    ON Persons.PersonID = PersonsToClubs.PersonID
	LEFT JOIN Clubs
    ON Clubs.ClubID = PersonsToClubs.ClubID
  ORDER BY Clubs.ClubName;

--�������� ������ ��� ������������ ������ �� �����, ��������� � ������.
  SELECT DISTINCT Persons.PersonID, Persons.IIN, Persons.LastName, Persons.FirstName
  FROM Persons INNER JOIN PersonsToClubs
    ON Persons.PersonID = PersonsToClubs.PersonID 
  ORDER BY Persons.PersonID, Persons.FirstName;

--�������� ������ ��� ������������ ������ �� �����, �� ��������� �� � ����� �����. 
SELECT DISTINCT Persons.PersonID, Persons.IIN, Persons.LastName, Persons.FirstName
  FROM Persons LEFT JOIN PersonsToClubs
    ON Persons.PersonID = PersonsToClubs.PersonID 
	where PersonsToClubs.ClubID is null
  ORDER BY Persons.PersonID, Persons.FirstName;

--�������� ��� ������������ ������ �������� ������, � ������� ���� ���� �� ���� �������.
-- �� ������� MU � Athletico
SELECT DISTINCT Clubs.ClubName
  FROM Clubs INNER JOIN PersonsToClubs
    ON Clubs.ClubID = PersonsToClubs.ClubID
  ORDER BY Clubs.ClubName;

--�������� ��� ������������ ������ �������� ������, � ������� ��� �� ������ ��������.
-- ������� MU � Athletico
SELECT DISTINCT Clubs.ClubName
  FROM Clubs LEFT JOIN PersonsToClubs
    ON Clubs.ClubID = PersonsToClubs.ClubID
	where PersonsToClubs.ClubID is null
  ORDER BY Clubs.ClubName;

--� ������� DELETE ������� �������� � ������ ��� ���������� ����.
-- ������ Ullrich
DELETE FROM PersonsToClubs WHERE PersonID =1;
SELECT * FROM PersonsToClubs WHERE PersonID = 1;

--� ������� INSERT ��� ���� �������� �������� � 4-� ������.
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (1,1);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (1,2);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (1,3);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (1,4);
SELECT * FROM PersonsToClubs WHERE PersonID = 1;

--� ������� UPDATE ���������� ���� ������ ����� Real � ���� Barcelona, �� ���������� �������� � ������ ������.
-- Real:CLubID=4, Barcelona:CLubID=5, 
--SELECT * FROM PersonsToClubs WHERE ClubID = 4;
--SELECT * FROM PersonsToClubs WHERE ClubID = 5;
UPDATE PersonsToClubs SET ClubID = 5 WHERE ClubID = 4
--SELECT * FROM PersonsToClubs WHERE ClubID = 4;
--SELECT * FROM PersonsToClubs WHERE ClubID = 5;
