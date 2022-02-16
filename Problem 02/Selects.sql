USE ClubsBase;

--Два клуба должны иметь названия Real и Barcelona.
--сделано при создании таблицы клубов в БД

--Выведите все данные по людям и клубам, в которых они состоят.
SELECT Persons.IIN, Persons.LastName, Persons.FirstName, Clubs.ClubName
  FROM Persons LEFT JOIN PersonsToClubs
    ON Persons.PersonID = PersonsToClubs.PersonID
	LEFT JOIN Clubs
    ON Clubs.ClubID = PersonsToClubs.ClubID
  ORDER BY Clubs.ClubName;

--Выведите данные без дублирования ТОЛЬКО по людям, состоящих в клубах.
  SELECT DISTINCT Persons.PersonID, Persons.IIN, Persons.LastName, Persons.FirstName
  FROM Persons INNER JOIN PersonsToClubs
    ON Persons.PersonID = PersonsToClubs.PersonID 
  ORDER BY Persons.PersonID, Persons.FirstName;

--Выведите данные без дублирования ТОЛЬКО по людям, не состоящих ни в одном клубе. 
SELECT DISTINCT Persons.PersonID, Persons.IIN, Persons.LastName, Persons.FirstName
  FROM Persons LEFT JOIN PersonsToClubs
    ON Persons.PersonID = PersonsToClubs.PersonID 
	where PersonsToClubs.ClubID is null
  ORDER BY Persons.PersonID, Persons.FirstName;

--Выведите без дублирования ТОЛЬКО названия клубов, в которых есть хотя бы один человек.
-- не выведет MU и Athletico
SELECT DISTINCT Clubs.ClubName
  FROM Clubs INNER JOIN PersonsToClubs
    ON Clubs.ClubID = PersonsToClubs.ClubID
  ORDER BY Clubs.ClubName;

--Выведите без дублирования ТОЛЬКО названия клубов, в которых нет ни одного человека.
-- выведет MU и Athletico
SELECT DISTINCT Clubs.ClubName
  FROM Clubs LEFT JOIN PersonsToClubs
    ON Clubs.ClubID = PersonsToClubs.ClubID
	where PersonsToClubs.ClubID is null
  ORDER BY Clubs.ClubName;

--С помощью DELETE удалите членство в клубах для выбранного лица.
-- удалит Ullrich
DELETE FROM PersonsToClubs WHERE PersonID =1;
SELECT * FROM PersonsToClubs WHERE PersonID = 1;

--С помощью INSERT для него добавьте членство в 4-х клубах.
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (1,1);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (1,2);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (1,3);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (1,4);
SELECT * FROM PersonsToClubs WHERE PersonID = 1;

--С помощью UPDATE перенесите всех членов клуба Real в клуб Barcelona, не затрагивая членство в других клубах.
-- Real:CLubID=4, Barcelona:CLubID=5, 
--SELECT * FROM PersonsToClubs WHERE ClubID = 4;
--SELECT * FROM PersonsToClubs WHERE ClubID = 5;
UPDATE PersonsToClubs SET ClubID = 5 WHERE ClubID = 4
--SELECT * FROM PersonsToClubs WHERE ClubID = 4;
--SELECT * FROM PersonsToClubs WHERE ClubID = 5;
