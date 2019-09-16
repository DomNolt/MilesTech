-- Drop and Create tables
-- Part 1: Done in class
DROP TABLE IF EXISTS Taverns; 
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS Locations;

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

--Taverns Rows
INSERT INTO Taverns (name, location_id, owner_id)
VALUES ('The Drunken Clam', 4, null);
INSERT INTO Taverns (name, location_id, owner_id)
VALUES ('Bards and Nobles', 2, null);
INSERT INTO Taverns (name, location_id, owner_id)
VALUES ('The green muppet', 3, null);
INSERT INTO Taverns (name, location_id, owner_id)
VALUES ('The 4th cactus', 4, null);
INSERT INTO Taverns (name, location_id, owner_id)
VALUES ('DinnerBell', 1, null);
INSERT INTO Taverns (name, location_id, owner_id)
VALUES ('The Inn', 5, null);

--Users Rows
INSERT INTO Users (Name, role_id)
VALUES ('Dom', 1);
INSERT INTO Users (Name, role_id)
VALUES ('Janel', 1);
INSERT INTO Users (Name, role_id)
VALUES ('Cory', 4);
INSERT INTO Users (Name, role_id)
VALUES ('Paul', 3);
INSERT INTO Users (Name, role_id)
VALUES ('Barnabus', 5);
INSERT INTO Users (Name, role_id)
VALUES ('Karen', 6);

--Roles Rows
INSERT INTO Roles (name, description)
VALUES ('Bartender', 'bartends');
INSERT INTO Roles (name, description)
VALUES ('Electrician', 'why do they have their own electrictan?');
INSERT INTO Roles (name, description)
VALUES ('Doctor', 'fixes the boo-boos and the owees');
INSERT INTO Roles (name, description)
VALUES ('busboy', 'drives the busses, also does the dishes');
INSERT INTO Roles (name, description)
VALUES ('watress', 'female waitor');
INSERT INTO Roles (name, description)
VALUES ('wator', 'male waitress');

--Location Rows
INSERT INTO Locations (name)
VALUES ('Medford');
INSERT INTO Locations (name)
VALUES ('Wisconsin');
INSERT INTO Locations (name)
VALUES ('Alabama');
INSERT INTO Locations (name)
VALUES ('The White House');
INSERT INTO Locations (name)
VALUES ('Mount Fuji');
INSERT INTO Locations (name)
VALUES ('Disney');
INSERT INTO Locations (name)
VALUES ('Antartica');

-- Part 2: Additions from the Homework
DROP TABLE IF EXISTS Service;
DROP TABLE IF EXISTS Status;
DROP TABLE IF EXISTS Supplies;
-- DROP TABLE IF EXISTS Guests;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Received;
DROP TABLE IF EXISTS Inventory;

CREATE TABLE Status (
	id int IDENTITY PRIMARY KEY,
	name varchar(25)
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
/*CREATE TABLE Guest (
	id int IDENTITY PRIMARY KEY,
	name varchar(50)
);*/
CREATE TABLE Sales (
	id int IDENTITY PRIMARY KEY,
	service_id int,
	guest_id int,
	price money,
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

--Status Rows (as per the homework, more could be added later)
INSERT INTO Status (name)
VALUES ('active');
INSERT INTO STATUS (name)
VALUES ('inactive');

--Service Rows
INSERT INTO Service (name, status_id)
VALUES ('pool', 1);
INSERT INTO Service (name, status_id)
VALUES ('drinking', 1);
INSERT INTO Service (name, status_id)
VALUES ('darts', 2);
INSERT INTO Service (name, status_id)
VALUES ('apple bobbing', 2);
INSERT INTO Service (name, status_id)
VALUES ('gambling', 1);

--Supplies Rows
INSERT INTO Supplies (unit, name)
VALUES ('bucket', 'mystery meat');
INSERT INTO Supplies (unit, name)
VALUES ('bottle', 'wine');
INSERT INTO Supplies (unit, name)
VALUES ('ounce', 'Pale Ale');
INSERT INTO Supplies (unit, name)
VALUES ('crate', 'mutton');
INSERT INTO Supplies (unit, name)
VALUES ('shot', 'whiskey');

/*
--Guest Rows
INSERT INTO Guest (name)
VALUES ('howard');
INSERT INTO Guest (name)
VALUES ('lenny');
INSERT INTO Guest (name)
VALUES ('moxie');
INSERT INTO Guest (name)
VALUES ('psycho');
INSERT INTO Guest (name)
VALUES ('donald');
*/

--Sales Rows
INSERT INTO Sales (service_id, guest_id, price, date_purchased, amount, tavern_id)
VALUES (1, 3, 1.00, 03/24/1999, 2, 1);
INSERT INTO Sales (service_id, guest_id, price, date_purchased, amount, tavern_id)
VALUES (4, 2, 5.00, 02/12/1998, 1, 5);
INSERT INTO Sales (service_id, guest_id, price, date_purchased, amount, tavern_id)
VALUES (5, 5, 55000.00, 12/12/2002, 10, 4);
INSERT INTO Sales (service_id, guest_id, price, date_purchased, amount, tavern_id)
VALUES (2, 4, 3.00, 10/10/2010, 1, 4);
INSERT INTO Sales (service_id, guest_id, price, date_purchased, amount, tavern_id)
VALUES (3, 3, 3.33, 03/03/1993, 3, 3);

--Received Rows
INSERT INTO Received (supply_id, tavern_id, price, amount_received, date_received)
VALUES (1, 1, 1.00, 1, 01/01/1991);
INSERT INTO Received (supply_id, tavern_id, price, amount_received, date_received)
VALUES (2, 1, 2.00, 4, 02/03/1994);
INSERT INTO Received (supply_id, tavern_id, price, amount_received, date_received)
VALUES (4, 2, 200.00, 500, 01/04/2000);
INSERT INTO Received (supply_id, tavern_id, price, amount_received, date_received)
VALUES (5, 4, 100.00, 100, 11/21/2001);
INSERT INTO Received (supply_id, tavern_id, price, amount_received, date_received)
VALUES (4, 1, 7.77, 777, 07/07/1977);

--Inventory Rows
INSERT INTO Inventory (supply_id, tavern_id, date_taken, amount)
VALUES (4, 1, 01/02/1993, 40);
INSERT INTO Inventory (supply_id, tavern_id, date_taken, amount)
VALUES (1, 2, 05/11/2001, 100);
INSERT INTO Inventory (supply_id, tavern_id, date_taken, amount)
VALUES (2, 5, 02/25/1997, 20);
INSERT INTO Inventory (supply_id, tavern_id, date_taken, amount)
VALUES (3, 3, 03/29/1993, 33);
INSERT INTO Inventory (supply_id, tavern_id, date_taken, amount)
VALUES (5, 5, 05/15/1995, 13);