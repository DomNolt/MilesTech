/* UPDATE 9/15/19: Homework 2
	New tables will be added towards the bottom

	Removed BasmentRats
	Added more to Guest
	Added Guest_Status, Level, Classes
	Added PK's and FK's
*/

/* Homework 2
	Drop and Create new additions
*/
DROP TABLE IF EXISTS Levels;
DROP TABLE IF EXISTS Guests;
DROP TABLE IF EXISTS Guest_Status;
DROP TABLE IF EXISTS Classes;
DROP TABLE IF EXISTS Supply_Sales;
DROP TABLE IF EXISTS BasementRats;

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
--ALTER TABLE Sales ADD FOREIGN KEY (guest_id) REFERENCES Guests (id);
ALTER TABLE Inventory ADD FOREIGN KEY (supply_id) REFERENCES Supplies (id);
ALTER TABLE Inventory ADD FOREIGN KEY (tavern_id) REFERENCES Taverns (id);
ALTER TABLE Received ADD FOREIGN KEY (supply_id) REFERENCES Supplies (id);
ALTER TABLE Received ADD FOREIGN KEY (tavern_id) REFERENCES Taverns (id);
ALTER TABLE Guests ADD FOREIGN KEY (guest_status_id) REFERENCES Guest_Status (id);
ALTER TABLE Levels ADD FOREIGN KEY (guest_id) REFERENCES Guests (id);
ALTER TABLE Levels ADD FOREIGN KEY (class_id) REFERENCES Classes (id);
ALTER TABLE Supply_Sales ADD FOREIGN KEY (supply_id) REFERENCES Supplies (id);
ALTER TABLE Supply_Sales ADD FOREIGN KEY (sale_id) REFERENCES Sales (id);

INSERT INTO Guest_Status (status)
VALUES
('sick'),
('fine'),
('hangry'),
('raging'),
('placid');

INSERT INTO Guests (guest_name, notes, birthday, cakeday, guest_status_id)
VALUES
('James', 'Tipped well', '1997-02-07', '1996-02-07', 1),
('Bertha', 'Otherwise known as big bertha', '1990-07-12', '2002-07-17', 3),
('Axel', 'his status matches his appearance', '1997-02-04', '2003-07-10', 2),
('Barbara', 'claimed we spit in her food... no comment', '1996-01-01', '1997-05-05', 5),
('June', 'recently went to jail', '1982-07-07', '1999-04-02', 4);

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

INSERT INTO Levels (guest_id, class_level, class_id)
VALUES
(1, 7, 3),
(2, 12, 6),
(2, 8, 8),
(3, 20, 5),
(4, 15, 9),
(4, 3, 1),
(3, 10, 6),
(1, 4, 4),
(5, 20, 10);

INSERT INTO Supply_Sales (supply_id, sale_id)
VALUES
(1, 3),
(4, 5),
(3, 1),
(4, 2),
(5, 2);

/*
-- Will fail for testing
INSERT INTO Levels (guest_id, class_level, class_id)
VALUES
(6, 10, 4);

insert into Supply_Sales (supply_id, sale_id)
VALUES
(11, 4);
*/