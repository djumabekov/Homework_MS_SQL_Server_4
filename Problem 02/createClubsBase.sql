SET DATEFORMAT mdy;  
GO  

USE master;
IF EXISTS (SELECT Name FROM sys.databases WHERE name='ClubsBase')
  ALTER DATABASE ClubsBase SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
DROP DATABASE IF EXISTS ClubsBase;
GO
CREATE DATABASE ClubsBase;
GO
ALTER DATABASE ClubsBase SET RECOVERY SIMPLE;

USE ClubsBase;

DROP TABLE IF EXISTS Cities ;
DROP TABLE IF EXISTS Clubs ;
DROP TABLE IF EXISTS Persons ;
DROP TABLE IF EXISTS PersonsToClubs ;

DROP TABLE IF EXISTS Cities;
CREATE TABLE Cities (
  CityID BIGINT IDENTITY(1,1) NOT NULL,
  CityName NVARCHAR(20) NOT NULL,
  CONSTRAINT PK_CityID PRIMARY KEY (CityID),
  CONSTRAINT UQ_CityName UNIQUE (CityName)
);

DROP TABLE IF EXISTS Clubs ;
CREATE TABLE Clubs  (
	ClubID BIGINT IDENTITY(1,1) NOT NULL,
	ClubName NVARCHAR(20) NOT NULL,
	CreationDate DATE,
	CityID BIGINT,
	CONSTRAINT PK_ClubID PRIMARY KEY (ClubID),
	CONSTRAINT UQ_ClubName UNIQUE (ClubName),
	CONSTRAINT FK_Clubs_To_Cities FOREIGN KEY (CityID) REFERENCES Cities(CityID)
);

DROP TABLE IF EXISTS Persons ;
CREATE TABLE Persons  (
	PersonID BIGINT IDENTITY(1,1) NOT NULL,
	IIN  CHAR(12) NOT NULL,
	LastName NVARCHAR(20) NOT NULL,
	FirstName NVARCHAR(20) NOT NULL,
	Birthday DATE,
	CONSTRAINT PK_PersonID PRIMARY KEY (PersonID),
	CONSTRAINT UQ_Persons_IIN UNIQUE (IIN),
);

DROP TABLE IF EXISTS PersonsToClubs;
CREATE TABLE PersonsToClubs (
  ID BIGINT IDENTITY(1,1) NOT NULL,
  PersonID BIGINT NOT NULL,
  ClubID BIGINT NOT NULL,
  CONSTRAINT PK_ID PRIMARY KEY (ID),
  CONSTRAINT FK_PersonID FOREIGN KEY (PersonID) REFERENCES Persons(PersonID),
  CONSTRAINT FK_ClubID FOREIGN KEY (ClubID) REFERENCES Clubs(ClubID),
);


INSERT INTO Cities (CityName) VALUES ('Astana' );
INSERT INTO Cities (CityName) VALUES ('Almaty' );
INSERT INTO Cities (CityName) VALUES ('Karaganda' );
INSERT INTO Cities (CityName) VALUES ('Madrid' );
INSERT INTO Cities (CityName) VALUES ('Barcelona' );
INSERT INTO Cities (CityName) VALUES ('London' );
INSERT INTO Cities (CityName) VALUES ('Moscow' );
INSERT INTO Cities (CityName) VALUES ('Kiev' );
INSERT INTO Cities (CityName) VALUES ('Paris' );
INSERT INTO Cities (CityName) VALUES ('Munchen' );

INSERT INTO Clubs (ClubName, CreationDate, CityID) VALUES ('FKAstana', '2000-10-21', 1 );
INSERT INTO Clubs (ClubName, CreationDate, CityID) VALUES ('FKKairat', '1999-10-21', 2 );
INSERT INTO Clubs (ClubName, CreationDate, CityID) VALUES ('FKShahter', '1998-10-21', 3 );
INSERT INTO Clubs (ClubName, CreationDate, CityID) VALUES ('Real', '1988-08-13', 4 );
INSERT INTO Clubs (ClubName, CreationDate, CityID) VALUES ('Barcelona', '1958-06-04', 5 );
INSERT INTO Clubs (ClubName, CreationDate, CityID) VALUES ('Chelsea', '1948-01-20', 6 );
INSERT INTO Clubs (ClubName, CreationDate, CityID) VALUES ('Spartak', '1978-07-07', 7 );
INSERT INTO Clubs (ClubName, CreationDate, CityID) VALUES ('Dinamo', '1988-08-08', 8 );
INSERT INTO Clubs (ClubName, CreationDate, CityID) VALUES ('PSG', '1928-02-02', 9 );
INSERT INTO Clubs (ClubName, CreationDate, CityID) VALUES ('Bayern', '1958-05-05', 10 );

--клубы без членов
INSERT INTO Clubs (ClubName, CreationDate, CityID) VALUES ('MU', '1918-04-14', 6 ); 
INSERT INTO Clubs (ClubName, CreationDate, CityID) VALUES ('Athletico', '1974-12-02', 4 );

INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('040430124047', 'Ullrich', 'Rita', '2004-04-30');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('811207176352', 'Gerlach', 'Vito', '1981-12-07');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('910913787530', 'Hilpert', 'Selina', '1991-09-13');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('990624772557', 'Rice', 'Frida', '1977-07-28');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('901204664526', 'Donnelly', 'Gaston', '1970-09-19');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('930922429366', 'Auer', 'Sincere', '2010-01-24');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('881021753183', 'Purdy', 'Bud', '2008-03-24');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('410207434084', 'Cartwright', 'Darlene', '1958-09-11');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('720927919878', 'Kozey', 'Rudolph', '1951-05-14');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('830419559708', 'Schuppe', 'Nedra', '1951-05-14');

INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('500309165516', 'Pollich', 'Raegan', '1972-11-19');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('760623307120', 'Ryan', 'Henderson', '1963-05-13');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('951224049940', 'Bruen', 'Darrin', '1999-05-01');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('921017215218', 'Farrell', 'Verona', '1970-12-30');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('610630346354', 'Jast', 'Newton', '2002-04-05');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('160806370859', 'Leannon', 'Mina', '1987-11-20');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('770503641231', 'Dach', 'Jimmy', '1991-11-12');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('830827189399', 'Gorczany', 'Davin', '1992-01-09');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('860124651727', 'Kerluke', 'Alf', '1979-11-19');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('160322149575', 'Turcotte', 'Madalyn', '1966-03-22');

--члены буз клубов
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('760201135730', 'Heller', 'Sibyl', '1985-03-13');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('540126841866', 'Franecki', 'Ashlee', '1963-10-26');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('471029284549', 'Guann', 'Amara', '1976-12-05');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('720929966906', 'Murazik', 'Jamir', '1952-03-29');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('510108687261', 'Schumm', 'Cortney', '2006-04-04');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('820225817165', 'Kozey', 'Susie', '1993-09-10');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('650615855422', 'Emard', 'Kristian', '1971-11-07');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('921108437642', 'Jast', 'Ivah', '2009-06-30');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('290408989198', 'Hackett', 'Vidal', '1982-01-20');
INSERT INTO Persons (IIN, LastName, FirstName, Birthday) VALUES ('050413693086', 'Kirlin', 'Gudrun', '1961-08-01');


INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (1,1);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (1,2);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (1,3);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (2,4);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (2,5);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (2,6);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (3,7);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (3,8);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (3,9);

INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (4,10);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (4,1);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (4,2);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (5,3);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (5,4);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (5,5);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (6,6);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (6,7);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (6,8);

INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (7,9);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (7,10);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (7,1);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (8,2);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (8,3);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (8,4);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (9,5);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (9,6);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (9,7);

INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (10,1);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (10,2);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (10,3);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (11,4);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (11,5);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (11,6);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (12,7);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (12,8);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (12,9);

INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (13,10);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (13,1);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (13,2);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (14,3);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (14,4);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (14,5);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (15,6);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (15,7);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (15,8);

INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (16,9);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (16,10);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (16,1);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (17,2);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (17,3);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (17,4);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (18,5);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (18,6);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (18,7);

INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (19,2);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (19,3);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (19,4);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (20,5);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (20,6);
INSERT INTO PersonsToClubs (PersonID, ClubID) VALUES (20,7);
