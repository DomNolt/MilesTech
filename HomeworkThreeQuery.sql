-- Drop and Create tables
-- Part 1: Done in class
DROP TABLE IF EXISTS Supply_Sales;
DROP TABLE IF EXISTS Room_Stays;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Received;
DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Supplies;
DROP TABLE IF EXISTS Service;
DROP TABLE IF EXISTS Rooms;
DROP TABLE IF EXISTS Status;
DROP TABLE IF EXISTS Taverns;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS Locations;
DROP TABLE IF EXISTS Levels;
DROP TABLE IF EXISTS Guests;
DROP TABLE IF EXISTS Guest_Status;
DROP TABLE IF EXISTS Classes;

CREATE TABLE Taverns (
	id int IDENTITY PRIMARY KEY,
	name varchar(50),
	location_id int,
	owner_id int
);
CREATE TABLE Users (
	id int IDENTITY PRIMARY KEY,
	name varchar(50),
	role_id int
);
CREATE TABLE Roles (
	id int IDENTITY PRIMARY KEY,
	name varchar(50),
	description varchar(MAX)
);
CREATE TABLE Locations (
	id int IDENTITY PRIMARY KEY,
	name varchar(100)
);

-- Part 2: Additions from the Homework
CREATE TABLE Status (
	id int IDENTITY PRIMARY KEY,
	status_name varchar(25)
);
CREATE TABLE Service (
	id int IDENTITY PRIMARY KEY,
	name varchar(50),
	status_id int,
	tavern_id int
);
CREATE TABLE Supplies (
	id int IDENTITY PRIMARY KEY,
	unit varchar(50),
	name varchar(50)
);
CREATE TABLE Sales (
	id int IDENTITY PRIMARY KEY,
	service_id int,
	guest_id int,
	total_price money,
	date_purchased datetime,
	amount int,
	tavern_id int
);
CREATE TABLE Received (
	id int IDENTITY PRIMARY KEY,
	supply_id int,
	tavern_id int,
	price money,
	amount_received int,
	date_received datetime
);
CREATE TABLE Inventory (
	id int IDENTITY PRIMARY KEY,
	supply_id int,
	tavern_id int,
	date_taken datetime,
	amount int
);
CREATE TABLE Guest_Status (
	id int IDENTITY,
	status varchar(50)
);
CREATE TABLE Guests (
	id int IDENTITY,
	guest_name varchar(50),
	notes varchar(500),
	birthday date,
	cakeday date,
	guest_status_id int
);
CREATE TABLE Levels (
	id int IDENTITY,
	guest_id int,
	class_level tinyint,
	class_id tinyint
);
CREATE TABLE Classes (
	id tinyint IDENTITY,
	name varchar(50)
);
CREATE TABLE Supply_Sales (
	id int IDENTITY,
	supply_id int,
	sale_id int
);
CREATE TABLE Rooms (
	id int IDENTITY PRIMARY KEY,
	tavern_id int,
	status_id int,
	costs money
);
CREATE TABLE Room_Stays (
	id int IDENTITY PRIMARY KEY,
	sale_id int,
	guest_id int,
	room_id int,
	date_stayed date,
	rate money
);

-- Adding Primary/Foreign Keys
ALTER TABLE Guests ADD PRIMARY KEY (id);
ALTER TABLE Guest_Status ADD PRIMARY KEY (id);
ALTER TABLE Levels ADD PRIMARY KEY (id);
ALTER TABLE Classes ADD PRIMARY KEY (id);
ALTER TABLE Supply_Sales ADD PRIMARY KEY (id);

ALTER TABLE Taverns ADD FOREIGN KEY (location_id) REFERENCES Locations (id);
ALTER TABLE Taverns ADD FOREIGN KEY (owner_id) REFERENCES Users (id);
ALTER TABLE Users ADD FOREIGN KEY (role_id) REFERENCES Roles (id);
ALTER TABLE Service ADD FOREIGN KEY (tavern_id) REFERENCES Taverns (id);
ALTER TABLE Service ADD FOREIGN KEY (status_id) REFERENCES Status (id);
ALTER TABLE Sales ADD FOREIGN KEY (tavern_id) REFERENCES Taverns (id);
ALTER TABLE Sales ADD FOREIGN KEY (service_id) REFERENCES Service (id);
ALTER TABLE Sales ADD FOREIGN KEY (guest_id) REFERENCES Guests (id);
ALTER TABLE Inventory ADD FOREIGN KEY (supply_id) REFERENCES Supplies (id);
ALTER TABLE Inventory ADD FOREIGN KEY (tavern_id) REFERENCES Taverns (id);
ALTER TABLE Received ADD FOREIGN KEY (supply_id) REFERENCES Supplies (id);
ALTER TABLE Received ADD FOREIGN KEY (tavern_id) REFERENCES Taverns (id);
ALTER TABLE Guests ADD FOREIGN KEY (guest_status_id) REFERENCES Guest_Status (id);
ALTER TABLE Levels ADD FOREIGN KEY (guest_id) REFERENCES Guests (id);
ALTER TABLE Levels ADD FOREIGN KEY (class_id) REFERENCES Classes (id);
ALTER TABLE Supply_Sales ADD FOREIGN KEY (supply_id) REFERENCES Supplies (id);
ALTER TABLE Supply_Sales ADD FOREIGN KEY (sale_id) REFERENCES Sales (id);

--Classes Rows
INSERT INTO Classes (name)
VALUES
('mage'),
('fighter'),
('theif'),
('paladin'),
('snake charmer'),
('pie maker'),
('sky watcher'),
('drunk'),
('storyteller'),
('meta gamer');

--Guest_Status Rows
INSERT INTO Guest_Status (status)
VALUES
('sick'),
('fine'),
('hangry'),
('raging'),
('placid');

--Guest Rows
INSERT INTO Guests (guest_name, notes, birthday, cakeday, guest_status_id)
VALUES
('James', 'Tipped well', '1997-02-07', '1996-02-07', 1),
('Bertha', 'Otherwise known as big bertha', '2000-07-12', '2002-07-17', 3),
('Axel', 'his status matches his appearance', '1997-02-04', '2003-07-10', 2),
('Barbara', 'Used to work here', '2006-01-01', '1997-05-05', 5),
('June', 'recently went to jail', '1982-07-07', '1999-04-02', 4),
('James', 'Not as good looking as the other James', '1996-03-05', '1997-04-05', 2);

--Levels Rows
INSERT INTO Levels (guest_id, class_level, class_id)
VALUES
(1, 7, 3),
(2, 42, 6),
(2, 29, 8),
(3, 40, 5),
(4, 15, 9),
(4, 27, 1),
(3, 35, 7),
(1, 32, 4),
(5, 50, 10),
(6, 50, 7);

--Location Rows
INSERT INTO Locations (name)
VALUES 
('Medford'),
('Wisconsin'),
('Alabama'),
('The White House'),
('Mount Fuji'),
('Disney'),
('Antartica');

--Roles Rows
INSERT INTO Roles (name, description)
VALUES 
('Bartender', 'bartends'),
('Electrician', 'why do they have their own electrictan?'),
('Doctor', 'fixes the boo-boos and the owees'),
('busboy', 'drives the busses, also does the dishes'),
('watress', 'female waitor'),
('wator', 'male waitress');

--Users Rows
INSERT INTO Users (Name, role_id)
VALUES 
('Dom', 1),
('Janel', 1),
('Cory', 4),
('Paul', 3),
('Barnabus', 5),
('Karen', 6);

--Taverns Rows
INSERT INTO Taverns (name, location_id, owner_id)
VALUES 
('The Drunken Clam', 4, null),
('Bards and Nobles', 2, null),
('The green muppet', 3, null),
('The 4th cactus', 4, null),
('DinnerBell', 1, null),
('The Inn', 5, null);

--Status Rows (as per the homework, more could be added later)
INSERT INTO Status (status_name)
VALUES ('active'), ('inactive');

--Rooms Rows
INSERT INTO Rooms (tavern_id, status_id, costs)
VALUES
(2, 1, 20.00),
(3, 2, 210.00),
(5, 1, 20.00),
(4, 1, 125.00),
(1, 2, 1000.00);

--Service Rows
INSERT INTO Service (name, status_id)
VALUES 
('pool', 1),
('drinking', 1),
('darts', 2),
('apple bobbing', 2),
('gambling', 1),
('room stay', 1);

--Supplies Rows
INSERT INTO Supplies (unit, name)
VALUES 
('bucket', 'mystery meat'),
('bottle', 'wine'),
('ounce', 'Pale Ale'),
('crate', 'mutton'),
('shot', 'whiskey');

--Inventory Rows
INSERT INTO Inventory (supply_id, tavern_id, date_taken, amount)
VALUES 
(4, 1, 01/02/1993, 40),
(1, 2, 05/11/2001, 100),
(2, 5, 02/25/1997, 20),
(3, 3, 03/29/1993, 33),
(5, 5, 05/15/1995, 13);

--Received Rows
INSERT INTO Received (supply_id, tavern_id, price, amount_received, date_received)
VALUES 
(1, 1, 1.00, 1, 01/01/1991),
(2, 1, 2.00, 4, 02/03/1994),
(4, 2, 200.00, 500, 01/04/2000),
(5, 4, 100.00, 100, 11/21/2001),
(4, 1, 7.77, 777, 07/07/1977);

--Sales Rows
INSERT INTO Sales (service_id, guest_id, total_price, date_purchased, amount, tavern_id)
VALUES 
(1, 3, 1.00, 03/24/1999, 2, 1),
(4, 2, 5.00, 02/12/1998, 1, 5),
(5, 5, 5500.00, 12/12/2002, 10, 4),
(2, 4, 3.00, 10/10/2010, 1, 4),
(3, 3, 3.33, 03/03/1993, 3, 3),
(6, 2, 20.00, 02/04/1995, 1, 2),
(6, 5, 375.00, 05/15/2000, 3, 4),
(6, 2, 80.00, 01/11/1999, 4, 5);

--Room_Stays Rows
INSERT INTO Room_Stays (sale_id, guest_id, room_id, date_stayed, rate)
VALUES
(6, 2, 1, '1995-02-04', 20.00),
(7, 5, 4, '2000-05-15', 125.00),
(8, 2, 3, '1999-01-11', 20.00); 

--Supply_Sales Rows
INSERT INTO Supply_Sales (supply_id, sale_id)
VALUES
(1, 3),
(4, 5),
(3, 1),
(4, 2),
(5, 2);

--------------------------------------QUERIES FOR HOMEWORK 3--------------------------------------------
SELECT * FROM Guests WHERE birthday < '2000-01-01';
SELECT * FROM Rooms WHERE costs > 100.00;
SELECT DISTINCT guest_name FROM Guests;
SELECT * FROM Guests ORDER BY guest_name ASC;
SELECT TOP 10 total_price FROM Sales ORDER BY total_price DESC;

/* NOTE:  I'm really not sure what this question is asking, so this is probably wrong */
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Classes'
or TABLE_NAME = 'Guest_Status' or TABLE_NAME = 'Roles' or TABLE_NAME = 'Locations'
or TABLE_NAME = 'Room_Stays' or TABLE_NAME = 'Status' or TABLE_NAME = 'Supplies';

SELECT Guests.guest_name, Guests.notes, class_level, Classes.name,
	(Case 
	when class_level < 10 then '0-9'
	when class_level >= 10 and class_level < 20 then '10-19'
	when class_level >=	20 and class_level < 30 then '20-29'
	when class_level >= 30 and class_level < 40 then '30-39'
	when class_level >= 40 and class_level < 50 then '40-49'
	when class_level = 50 then '50'
	end) AS 'level range'
FROM Levels
	JOIN Guests on (Guests.id = guest_id)
	JOIN Classes on (Classes.id = class_id)
	ORDER BY guest_name ASC;

SELECT * FROM (
SELECT CONCAT('INSERT INTO ', TABLE_NAME, ' (', COLUMN_NAME, ')') AS QueryPiece FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Guest_Status' AND COLUMN_NAME != 'id'
UNION all SELECT 'VALUES' AS QueryPiece
UNION all SELECT CONCAT('(''', status_name, ''')', CASE WHEN id = 2 THEN ';' ELSE ',' END) AS QueryPiece FROM Status) AS QueryPiece;