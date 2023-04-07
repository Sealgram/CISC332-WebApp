
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
PhoneNum    INTEGER,
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
('631 Famished, Tallahassee, FL', 'Formula Authentics Grill', 'EatF1Food.com')
;

insert into Customer values
('john.doe@gmail.com',324,'John','M','Doe','351 Fatren, Chicago, IL',5865437456,'Smokey Joes Diner'),
('click@cartalk.com',999,'Tom','L','Magliozzi','22 Brokencar, Boston, MA',5949020464,'Steak Supreme'),
('clack@cartalk.com',999,'Ray','F','Magliozzi','22 Brokencar, Boston, MA',5526480531,'Steak Supreme'),
('harry.potter@hogwarts.gov',31,'Harry','J','Potter','451 Sir Donald, Chicago, IL',2617491734,'Smokey Joes Diner'),
('Max.Verstappen@RedBullRacing.com',33,'Max','E','Verstappen','33 Nurburgring, Tallahassee, FL',1877477255,'Formula Authentics Grill'),
('Lewis.Hamilton@MercedesRacing.com',44,'Lewis','C','Hamilton','44 Silverstone, Tallahassee, FL',6903257243,'Formula Authentics Grill')
;

insert into Employee values
('Sammy', 'C', 'Cooksalot', 93932, 'sammy@eatatsmokeyjoes.com', 'Smokey Joes Diner'),
('Johnny', 'D', 'Runsalot', 18067, 'johnny@eatatsmokeyjoes.com', 'Smokey Joes Diner'),
('Gertrude', 'S', 'Talksalot', 75200, 'gertrude@eatatsmokeyjoes.com', 'Smokey Joes Diner'),
('Harriet', 'M', 'Yellsalot', 88136, 'harriet@eatatsmokeyjoes.com', 'Smokey Joes Diner'),
('Sammy', 'C', 'Cooksalot', 48842, 'sammy@beststeakinboston.com', 'Steak Supreme'),
('Johnny', 'D', 'Runsalot', 99436, 'johnny@beststeakinboston.com', 'Steak Supreme'),
('Gertrude', 'S', 'Talksalot', 54435, 'gertrude@beststeakinboston.com', 'Steak Supreme'),
('Harriet', 'M', 'Yellsalot', 72892, 'harriet@beststeakinboston.com', 'Steak Supreme'),
('Sammy', 'C', 'Cooksalot', 78158, 'sammy@EatF1Food.com', 'Formula Authentics Grill'),
('Johnny', 'D', 'Runsalot', 89740, 'johnny@EatF1Food.com', 'Formula Authentics Grill'),
('Gertrude', 'S', 'Talksalot', 75353, 'gertrude@EatF1Food.com', 'Formula Authentics Grill'),
('Harriet', 'M', 'Yellsalot', 65814, 'harriet@EatF1Food.com', 'Formula Authentics Grill')
;

insert into Delivery values
(18067),
(99436),
(89740)
;

insert into Chef values
(93932),
(48842),
(78158)
;

insert into Server values
(75200),
(54435),
(75353)
;

insert into Manager values
(88136),
(72892),
(65814)
;

insert into Food values
('Steak'),
('Potato Salad'),
('F1 Car Shaped Cake'),
('Heavily Salted Saltine Crackers'),
('Shrimp in cream sauce'),
('Pineapple & Banana Pizza')
;

insert into Orders values
(680, 31, 12, 'john.doe@gmail.com', 'Smokey Joes Diner', 18067, 2022-05-09),
(350, 38, 2, 'harry.potter@hogwarts.gov', 'Smokey Joes Diner', 18067, 2022-06-19),
(699, 180354, 42069, 'Max.Verstappen@RedBullRacing.com', 'Formula Authentics Grill', 89740, 2021-09-08),
(872, 457821, 41231, 'Lewis.Hamilton@MercedesRacing.com', 'Formula Authentics Grill', 89740, 2021-10-11),
(286, 112, 32, 'click@cartalk.com', 'Steak Supreme', 99436, 1999-08-08),
(331, 153, 43, 'clack@cartalk.com', 'Steak Supreme', 99436, 2000-11-02)
;

insert into Payment values
(2022-05-09, 43, 'john.doe@gmail.com'),
(2022-06-19, 40, 'harry.potter@hogwarts.gov'),
(2021-09-08, 222423, 'Max.Verstappen@RedBullRacing.com'),
(2021-10-11, 499052, 'Lewis.Hamilton@MercedesRacing.com'),
(1999-08-08, 144, 'click@cartalk.com'),
(2000-11-02, 196, 'clack@cartalk.com')
;

insert into Related_To values
('john.doe@gmail.com', 75200, 'Son'),
('harry.potter@hogwarts.gov', 93932, 'Friend'),
('Max.Verstappen@RedBullRacing.com', 65814, 'Girlfriend'),
('Lewis.Hamilton@MercedesRacing.com', 89740, 'Brother'),
('click@cartalk.com', 48842, 'Former Boss'),
('clack@cartalk.com', 48842, 'Former Boss')
;

insert into OrderContains values
(680, 'Potato Salad'),
(350, 'Steak'),
(699, 'F1 Car Shaped Cake'),
(872, 'Heavily Salted Saltine Crackers'),
(286, 'Shrimp in cream sauce'),
(331, 'Pineapple & Banana Pizza')
;

insert into On_Menu_At values
('Potato Salad', 'Smokey Joes Diner'),
('Steak', 'Smokey Joes Diner'),
('F1 Car Shaped Cake','Formula Authentics Grill'),
('Heavily Salted Saltine Crackers','Formula Authentics Grill'),
('Shrimp in cream sauce', 'Steak Supreme'),
('Pineapple & Banana Pizza', 'Steak Supreme')
;

insert into Credentials values
('Supreme Mega Chef', 93932),
('Ultra Super Chef', 78158),
('Really Awful Chef', 78158),
('Really Bad Baker', 93932),
('Passable in Baking Certificate', 78158),
('Terrible at cooking- Bachelors Degree', 78158)
;
