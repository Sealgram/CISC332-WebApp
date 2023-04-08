
drop database if exists restaurantDB;
create database restaurantDB;

CREATE TABLE Restaurant(
RAddress    VARCHAR(40),
RName       VARCHAR(40)     NOT NULL,
RURL        VARCHAR(40),
PRIMARY KEY(RName)
);

CREATE TABLE Customer(
CEMail      VARCHAR(40)     NOT NULL,
Credit      INTEGER,
CFName      CHAR(20),
CMinit      CHAR(1),
CLName      CHAR(20),
CAddress    VARCHAR(40),
PhoneNum    VARCHAR(20),
CRName      VARCHAR(40)     NOT NULL,
PRIMARY KEY(CEMail),
FOREIGN KEY(CRName) REFERENCES Restaurant(RName)
);

CREATE TABLE Employee(
EFName      CHAR(20),
EMinit      CHAR(1),
ELName      CHAR(20),
EID         INTEGER         NOT NULL,
EEMail      VARCHAR(40),
ERName      VARCHAR(40)     NOT NULL,
ESchedule   VARCHAR(255)    NOT NULL,
PRIMARY KEY(EID),
FOREIGN KEY(ERName) REFERENCES Restaurant(RName)
);

CREATE TABLE Delivery(
DEID        INTEGER         NOT NULL,
PRIMARY KEY(DEID),
FOREIGN KEY(DEID) REFERENCES Employee(EID)
);

CREATE TABLE Chef(
CEID        INTEGER         NOT NULL,
PRIMARY KEY(CEID),
FOREIGN KEY(CEID) REFERENCES Employee(EID)
);

CREATE TABLE Server(
SEID        INTEGER         NOT NULL,
PRIMARY KEY(SEID),
FOREIGN KEY(SEID) REFERENCES Employee(EID)
);

CREATE TABLE Manager(
MEID        INTEGER         NOT NULL,
PRIMARY KEY(MEID),
FOREIGN KEY(MEID) REFERENCES Employee(EID)
);

CREATE TABLE Food(
Fitem       VARCHAR(40)     NOT NULL,
PRIMARY KEY(Fitem)
);

CREATE TABLE Orders(
ORID        INTEGER         NOT NULL,
OPrice      INTEGER,
OTip        INTEGER,
OCEmail     VARCHAR(40)     NOT NULL,
ORName      VARCHAR(40)     NOT NULL,
ODEID       INTEGER         NOT NULL,
DTime       VARCHAR(40),
ODate       DATE            NOT NULL,
PRIMARY KEY(ORID),
FOREIGN KEY(OCEmail) REFERENCES Customer(CEMail),
FOREIGN KEY(ORName) REFERENCES Restaurant(RName),
FOREIGN KEY(ODEID) REFERENCES Delivery(DEID)
);

CREATE TABLE Payment(
PDate       DATE            NOT NULL,
PAmount     INTEGER,
PCEMail     VARCHAR(40)     NOT NULL,
PRIMARY KEY(PDate, PCEmail),
FOREIGN KEY(PCEmail) REFERENCES Customer(CEMail)
);

CREATE TABLE Related_To(
RCEMail     VARCHAR(40)     NOT NULL,
REID        INTEGER         NOT NULL,
RType       VARCHAR(40),
PRIMARY KEY(RCEMail, REID),
FOREIGN KEY(RCEMail) REFERENCES Customer(CEMail),
FOREIGN KEY(REID) REFERENCES Employee(EID)     
);

CREATE TABLE OrderContains(
CORID       INTEGER         NOT NULL,
CFitem      VARCHAR(40)     NOT NULL,
PRIMARY KEY(CORID, CFitem),
FOREIGN KEY(CORID) REFERENCES Orders(ORID),
FOREIGN KEY(CFitem) REFERENCES Food(Fitem)
);

CREATE TABLE On_Menu_At(
OFitem      VARCHAR(40)     NOT NULL,
ORName      VARCHAR(40)     NOT NULL,
PRIMARY KEY(OFitem, ORName),
FOREIGN KEY(OFitem) REFERENCES Food(Fitem),
FOREIGN KEY(ORName) REFERENCES Restaurant(RName)
);

CREATE TABLE Credentials(
Credentials VARCHAR(40)     NOT NULL,
CCEID       INTEGER         NOT NULL,
PRIMARY KEY(Credentials, CCEID),
FOREIGN KEY(CCEID) REFERENCES Chef(CEID)
);

insert into Restaurant values
('33 Hungry, Chicago, IL', 'Smokey Joes Diner', 'eatatsmokeyjoes.com'),
('431 Yum, Boston, MA', 'Steak Supreme', 'beststeakinboston.com'),
('631 Famished, Tallahassee, FL', 'Formula Authentics Grill', 'EatF1Food.com'),
('321 Food, Toronto, ON', 'Bangin Grill', 'BGrill.com'),
('443 Fork Rd, Calgary, AB', 'Cheese Biscuit House', 'CheeseHouse.com'),
('87 Knife Street, Vancouver, BC', 'Shoneys Diner', 'ShoneysVan.com')
;

insert into Customer values
('john.doe@gmail.com', 324, 'John', 'M', 'Doe', '351 Fatren, Chicago, IL', '5865437456', 'Smokey Joes Diner'),
('click@cartalk.com', 999, 'Tom','L','Magliozzi', '22 Brokencar, Boston, MA', '5949020464', 'Steak Supreme'),
('clack@cartalk.com', 999, 'Ray', 'F', 'Magliozzi', '22 Brokencar, Boston, MA', '5526480531', 'Steak Supreme'),
('harry.potter@hogwarts.gov', 31, 'Harry','J','Potter','451 Sir Donald, Chicago, IL', '2617491734', 'Smokey Joes Diner'),
('max.verstappen@redbullracing.com', 33, 'Max', 'E', 'Verstappen', '33 Nurburgring, Tallahassee, FL', '1877477255', 'Formula Authentics Grill'),
('lewishamilton@mercedesracing.com', 44, 'Lewis', 'C', 'Hamilton', '44 Silverstone, Tallahassee, FL', '6903257243', 'Formula Authentics Grill'),
('sebastian.vettel@astonmartinracing.com', 5, 'Sebastian', 'V', 'Vettel', '5 Maranello, San Francisco, CA', '5551234567', 'Bangin Grill'),
('fernando.alonso@alpineracing.com', 14, 'Fernando', 'E', 'Alonso', '14 Oviedo, San Francisco, CA', '5552345678', 'Bangin Grill'),
('daniel.ricciardo@mclaren.com', 3, 'Daniel', 'J', 'Ricciardo', '3 Perth, San Francisco, CA', '5553456789', 'Cheese Biscuit House'),
('kimi.raikkonen@alfaromeoracing.com', 7, 'Kimi', 'M', 'Raikkonen', '7 Espoo, San Francisco, CA', '5554567890', 'Cheese Biscuit House'),
('valtteri.bottas@mercedesracing.com', 77, 'Valtteri', 'B', 'Bottas', '77 Nastola, San Francisco, CA', '5555678901', 'Shoneys Diner'),
('sergio.perez@redbullracing.com', 11, 'Sergio', 'P', 'Perez', '11 Guadalajara, San Francisco, CA', '5556789012', 'Shoneys Diner')
;

insert into Employee values
('Sammy', 'C', 'Cooksalot', 93932, 'sammy@eatatsmokeyjoes.com', 'Smokey Joes Diner', '8:30-4:30, 8:30-4:30, 12:30-8:30, 12:30-8:30, 8:30-4:30, 8:30-4:30, OFF'),
('Johnny', 'D', 'Runsalot', 18067, 'johnny@eatatsmokeyjoes.com', 'Smokey Joes Diner', '4:30-12:30, 4:30-12:30, 4:30-12:30, OFF, 12:30-8:30, 12:30-8:30, OFF'),
('Gertrude', 'S', 'Talksalot', 75200, 'gertrude@eatatsmokeyjoes.com', 'Smokey Joes Diner', '8:30-4:30, 8:30-4:30, 8:30-4:30, OFF, 12:30-8:30, 12:30-8:30, 12:30-8:30'),
('Harriet', 'M', 'Yellsalot', 88136, 'harriet@eatatsmokeyjoes.com', 'Smokey Joes Diner', '12:30-8:30, 12:30-8:30, 8:30-4:30, OFF, 8:30-4:30, 8:30-4:30, 8:30-4:30'),
('Sammy', 'C', 'Cooksalot', 48842, 'sammy@beststeakinboston.com', 'Steak Supreme', '4:30-12:30, 4:30-12:30, 8:30-4:30, 8:30-4:30, 8:30-4:30, OFF, OFF'),
('Speedy', 'D', 'Runsalot', 99436, 'johnny@beststeakinboston.com', 'Steak Supreme', '8:30-4:30, 8:30-4:30, OFF, 12:30-8:30, 12:30-8:30, 12:30-8:30, OFF'),
('Gertrude', 'S', 'Talksalot', 54435, 'gertrude@beststeakinboston.com', 'Steak Supreme', '12:30-8:30, 12:30-8:30, 12:30-8:30, 8:30-4:30, 8:30-4:30, OFF, OFF'),
('Harriet', 'M', 'Yellsalot', 72892, 'harriet@beststeakinboston.com', 'Steak Supreme', '4:30-12:30, 4:30-12:30, 4:30-12:30, OFF, OFF, 8:30-4:30, 8:30-4:30'),
('Sammy', 'C', 'Cooksalot', 78158, 'sammy@EatF1Food.com', 'Formula Authentics Grill', '8:30-4:30, 8:30-4:30, 12:30-8:30, 12:30-8:30, OFF, OFF, 8:30-4:30'),
('Bolt', 'D', 'Runsalot', 89740, 'johnny@EatF1Food.com', 'Formula Authentics Grill', '8:30-4:30, 8:30-4:30, 12:30-8:30, 12:30-8:30, OFF, OFF, 8:30-4:30'),
('Gertrude', 'S', 'Talksalot', 75353, 'gertrude@EatF1Food.com', 'Formula Authentics Grill', '4:30-12:30, 4:30-12:30, 8:30-4:30, OFF, OFF, 12:30-8:30, 12:30-8:30'),
('Harriet', 'M', 'Yellsalot', 65814, 'harriet@EatF1Food.com', 'Formula Authentics Grill', '8:30-4:30, 8:30-4:30, OFF, 12:30-8:30, OFF, 8:30-4:30, 8:30-4:30'),
('Sammy', 'C', 'Cooksalot', 12345, 'sammy@BanginGrill.com', 'Bangin Grill', '8:30-4:30, 8:30-4:30, 12:30-8:30, 12:30-8:30, 8:30-4:30, 8:30-4:30, OFF'),
('Swift', 'D', 'Runsalot', 23456, 'johnny@BanginGrill.com', 'Bangin Grill', '4:30-12:30, 4:30-12:30, 4:30-12:30, OFF, 12:30-8:30, 12:30-8:30, OFF'),
('Gertrude', 'S', 'Talksalot', 34567, 'gertrude@BanginGrill.com', 'Bangin Grill', '12:30-8:30, 12:30-8:30, 12:30-8:30, 8:30-4:30, 8:30-4:30, OFF, OFF'),
('Harriet', 'M', 'Yellsalot', 45678, 'harriet@BanginGrill.com', 'Bangin Grill', '12:30-8:30, 12:30-8:30, 8:30-4:30, OFF, 8:30-4:30, 8:30-4:30, 8:30-4:30'),
('Sammy', 'C', 'Cooksalot', 56789, 'sammy@CheeseHouse.com', 'Cheese Biscuit House', '4:30-12:30, 4:30-12:30, 8:30-4:30, 8:30-4:30, 8:30-4:30, OFF, OFF'),
('Zippy', 'D', 'Runsalot', 67890, 'johnny@CheeseHouse.com', 'Cheese Biscuit House', '8:30-4:30, 8:30-4:30, OFF, 12:30-8:30, 12:30-8:30, 12:30-8:30, OFF'),
('Gertrude', 'S', 'Talksalot', 78901, 'gertrude@CheeseHouse.com', 'Cheese Biscuit House', '12:30-8:30, 12:30-8:30, 12:30-8:30, 8:30-4:30, 8:30-4:30, OFF, OFF'),
('Harriet', 'M', 'Yellsalot', 89012, 'harriet@CheeseHouse.com', 'Cheese Biscuit House', '4:30-12:30, 4:30-12:30, 4:30-12:30, OFF, OFF, 8:30-4:30, 8:30-4:30'),
('Sammy', 'C', 'Cooksalot', 90123, 'sammy@ShoneysVan.com', 'Shoneys Diner', '8:30-4:30, 8:30-4:30, 12:30-8:30, 12:30-8:30, OFF, OFF, 8:30-4:30'),
('Speedy', 'D', 'Runsalot', 43210, 'johnny@ShoneysVan.com', 'Shoneys Diner', '4:30-12:30, 4:30-12:30, 8:30-4:30, OFF, OFF, 12:30-8:30, 12:30-8:30'),
('Gertrude', 'S', 'Talksalot', 54321, 'gertrude@ShoneysVan.com', 'Shoneys Diner', '12:30-8:30, 12:30-8:30, 12:30-8:30, 8:30-4:30, 8:30-4:30, OFF, OFF'),
('Harriet', 'M', 'Yellsalot', 65432, 'harriet@ShoneysVan.com', 'Shoneys Diner', '8:30-4:30, 8:30-4:30, 12:30-8:30, 12:30-8:30, OFF, OFF, 8:30-4:30')
;

insert into Delivery values
(18067),
(99436),
(89740),
(23456),
(67890),
(43210)
;

insert into Chef values
(93932),
(48842),
(78158),
(12345),
(56789),
(90123)
;

insert into Server values
(75200),
(54435),
(75353),
(34567),
(78901),
(54321)
;

insert into Manager values
(88136),
(72892),
(65814),
(45678),
(89012),
(65432)
;

insert into Food values
('Steak'),
('Potato Salad'),
('F1 Car Shaped Cake'),
('Heavily Salted Saltine Crackers'),
('Shrimp in cream sauce'),
('Pineapple & Banana Pizza'),
('Tacos'), 
('Pasta'), 
('Sushi'), 
('Pizza'), 
('Burrito'), 
('Fried Chicken')
;

insert into Orders values
(680, 31, 12, 'john.doe@gmail.com', 'Smokey Joes Diner', 18067, "15:32", '2022-05-09'),
(350, 38, 2, 'harry.potter@hogwarts.gov', 'Smokey Joes Diner', 18067, "9:13", '2022-05-09'),
(699, 180354, 42069, 'max.verstappen@redbullracing.com', 'Formula Authentics Grill', 89740, "11:35", '2021-09-08'),
(872, 457821, 41231, 'lewishamilton@mercedesracing.com', 'Formula Authentics Grill', 89740, "12:11", '2021-10-11'),
(286, 112, 32, 'click@cartalk.com', 'Steak Supreme', 99436, "17:17", '1999-08-08'),
(331, 153, 43, 'clack@cartalk.com', 'Steak Supreme', 99436, "21:14", '2000-11-02'),
(786, 117, 5, 'daniel.ricciardo@mclaren.com', 'Bangin Grill', 23456, "19:08", '2023-02-17'),
(267, 145, 2, 'sebastian.vettel@astonmartinracing.com', 'Bangin Grill', 23456, "13:27", '2022-09-19'),
(493, 98, 8, 'fernando.alonso@alpineracing.com', 'Cheese Biscuit House', 67890, "18:46", '2021-11-28'),
(572, 214, 23, 'kimi.raikkonen@alfaromeoracing.com', 'Cheese Biscuit House', 67890, "21:53", '2022-05-09'),
(901, 76, 11, 'valtteri.bottas@mercedesracing.com', 'Shoneys Diner', 43210, "14:59", '2022-12-07'),
(402, 184, 17, 'sergio.perez@redbullracing.com', 'Shoneys Diner', 43210, "20:30", '2021-07-21')
;

insert into Payment values
('2022-05-09', 43, 'john.doe@gmail.com'),
('2022-06-19', 40, 'harry.potter@hogwarts.gov'),
('2021-09-08', 222423, 'max.verstappen@redbullracing.com'),
('2021-10-11', 499052, 'lewishamilton@mercedesracing.com'),
('1999-08-08', 144, 'click@cartalk.com'),
('2000-11-02', 196, 'clack@cartalk.com'),
('2023-02-17', 122, 'daniel.ricciardo@mclaren.com'),
('2022-09-19', 147, 'sebastian.vettel@astonmartinracing.com'),
('2021-11-28', 106, 'fernando.alonso@alpineracing.com'),
('2022-03-10', 237, 'kimi.raikkonen@alfaromeoracing.com'),
('2022-12-07', 87, 'valtteri.bottas@mercedesracing.com'),
('2021-07-21', 201, 'sergio.perez@redbullracing.com')

;

insert into Related_To values
('john.doe@gmail.com', 75200, 'Son'),
('harry.potter@hogwarts.gov', 93932, 'Friend'),
('max.verstappen@redbullracing.com', 65814, 'Girlfriend'),
('lewishamilton@mercedesracing.com', 89740, 'Brother'),
('click@cartalk.com', 48842, 'Former Boss'),
('clack@cartalk.com', 48842, 'Former Boss')
;

insert into OrderContains values
(680, 'Potato Salad'),
(350, 'Steak'),
(699, 'F1 Car Shaped Cake'),
(872, 'Heavily Salted Saltine Crackers'),
(286, 'Shrimp in cream sauce'),
(331, 'Pineapple & Banana Pizza'),
(786, 'Tacos'),
(267, 'Pasta'),
(493, 'Sushi'),
(572, 'Pizza'),
(901, 'Burrito'),
(402, 'Fried Chicken')
;

insert into On_Menu_At values
('Potato Salad', 'Smokey Joes Diner'),
('Steak', 'Smokey Joes Diner'),
('F1 Car Shaped Cake','Formula Authentics Grill'),
('Heavily Salted Saltine Crackers','Formula Authentics Grill'),
('Shrimp in cream sauce', 'Steak Supreme'),
('Pineapple & Banana Pizza', 'Steak Supreme'),
('Tacos', 'Bangin Grill'),
('Pasta', 'Bangin Grill'),
('Sushi', 'Cheese Biscuit House'),
('Pizza', 'Cheese Biscuit House'),
('Burrito', 'Shoneys Diner'),
('Fried Chicken', 'Shoneys Diner')
;

insert into Credentials values
('Supreme Mega Chef', 93932),
('Ultra Super Chef', 78158),
('Really Awful Chef', 78158),
('Really Bad Baker', 93932),
('Passable in Baking Certificate', 78158),
('Terrible at cooking- Bachelors Degree', 78158),
('Supreme Mega Chef', 56789),
('Ultra Super Chef', 56789),
('Really Awful Chef', 90123),
('Really Bad Baker', 56789),
('Passable in Baking Certificate', 56789),
('Terrible at cooking- Bachelors Degree', 90123)
;
