USE `dbcb7h6whtbc7d` ;
-- -----------------------------------------------------
-- Table `dbcb7h6whtbc7d`.`OFFICES`
-- -----------------------------------------------------
CREATE TABLE `dbcb7h6whtbc7d`.`OFFICES` (
  `Office` CHAR(2) NOT NULL,
  `City` VARCHAR(20) NOT NULL,
  `Region` CHAR(7) NOT NULL,
  `MGR` CHAR(3) NOT NULL,
  `Target` VARCHAR(7) NOT NULL,
  `Sales` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`Office`)
);

INSERT INTO OFFICES (Office, City, Region,
MGR, Target, Sales) VALUES(
   '22', 'Denver', 'Western', '108', '300000', '186042');
INSERT INTO OFFICES (Office, City, Region,
MGR, Target, Sales) VALUES(
   '11', 'New York', 'Eastern', '106', '575000', '692637');
INSERT INTO OFFICES (Office, City, Region,
MGR, Target, Sales) VALUES(
   '12', 'Chicago', 'Eastern', '104', '800000', '735042' );
INSERT INTO OFFICES (Office, City, Region,
MGR, Target, Sales) VALUES(
   '13', 'Atlanta', 'Eastern', '105', '350000', '367911' );
INSERT INTO OFFICES (Office, City, Region,
MGR, Target, Sales) VALUES(
   '21', 'Los Angeles', 'Western', '108', '725000', '835915' );
-- -----------------------------------------------------
-- Table `dbcb7h6whtbc7d`.`SALESREPS`
-- -----------------------------------------------------
CREATE TABLE `dbcb7h6whtbc7d`.`SALESREPS` (
  `EmplNum` CHAR(3) NOT NULL,
  `Name` VARCHAR(100) NOT NULL,
  `Age` VARCHAR(3) NOT NULL,
  `RepOffice` CHAR(2) NULL,
  `Title` VARCHAR(20) NOT NULL,
  `HireDate` DATE NOT NULL,
  `Manager` CHAR(3) NULL,
  `Quota` VARCHAR(10) NULL,
  `Sales` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`EmplNum`)
);

INSERT INTO SALESREPS (EmplNum, Name, Age,
RepOffice, Title, HireDate, Manager, Quota, Sales) VALUES(
   '105', 'Bill Adams', '37', '13', 'Sales',  '1988-02-12', '104', '350000', '367911');
INSERT INTO SALESREPS (EmplNum, Name, Age,
RepOffice, Title, HireDate, Manager, Quota, Sales) VALUES(
  '109', 'Mary Jones', '31', '11', 'Sales', '1989-10-12', '106','300000', '392725');
INSERT INTO SALESREPS (EmplNum, Name, Age,
RepOffice, Title, HireDate, Manager, Quota, Sales) VALUES(
  '102', 'Sue Smith', '48', '21', 'Sales',  '1986-10-10', '108', '350000', '474050');
INSERT INTO SALESREPS (EmplNum, Name, Age,
RepOffice, Title, HireDate, Manager, Quota, Sales) VALUES(
  '106', 'Sam Clark', '52', '11', 'VP Sales', '1988-06-14','', '275000', '299912');
INSERT INTO SALESREPS (EmplNum, Name, Age,
RepOffice, Title, HireDate, Manager, Quota, Sales) VALUES(
  '104', 'Bob Smith', '33', '12', 'Sales',  '1987-05-19', '106', '200000', '142594');
INSERT INTO SALESREPS (EmplNum, Name, Age,
RepOffice, Title, HireDate, Manager, Quota, Sales) VALUES(
  '101', 'Dan Roberts', '45', '12', 'Sales', '1986-10-20', '104', '300000', '305673');
INSERT INTO SALESREPS (EmplNum, Name, Age,
RepOffice, Title, HireDate, Manager, Quota, Sales) VALUES(
  '110', 'Tom Snyder', '41','', 'Sales', '1990-01-13', '101','', '75985');
INSERT INTO SALESREPS (EmplNum, Name, Age,
RepOffice, Title, HireDate, Manager, Quota, Sales) VALUES(
  '108', 'Larry Fitch', '62', '21', 'Sales', '1989-10-12', '106', '350000', '361865');
INSERT INTO SALESREPS (EmplNum, Name, Age,
RepOffice, Title, HireDate, Manager, Quota, Sales) VALUES(
  '103', 'Paul Cruz', '29', '12', 'Sales', '1987-03-01', '104', '275000', '286775');
INSERT INTO SALESREPS (EmplNum, Name, Age,
RepOffice, Title, HireDate, Manager, Quota, Sales) VALUES(
  '107', 'Nancy Angelli', '49', '22', 'Sales', '1988-11-14', '108', '300000', '186042');

-- -----------------------------------------------------
-- Table `dbcb7h6whtbc7d`.`PRODUCTS`
-- -----------------------------------------------------
CREATE TABLE `dbcb7h6whtbc7d`.`PRODUCTS` (
  `MFR` CHAR(3) NOT NULL,
  `ProdU` VARCHAR(5) NOT NULL,
  `Description` VARCHAR(20) NOT NULL,
  `Price` VARCHAR(5) NOT NULL,
  `QtyOnHand` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`Price`)
);

INSERT INTO PRODUCTS (MFR, ProdU, Description, Price, QtyOnHand)
VALUES(
   'REI', '2A45C', 'Ratchet Link', '79', '210');
INSERT INTO PRODUCTS (MFR, ProdU, Description, Price, QtyOnHand)
VALUES(
      'ACI', '4100Y', 'Widget Remover', '2750', '25');
INSERT INTO PRODUCTS (MFR, ProdU, Description, Price, QtyOnHand)
VALUES(
      'QSA', 'XK47', 'Reducer', '355', '38');
INSERT INTO PRODUCTS (MFR, ProdU, Description, Price, QtyOnHand)
VALUES(
      'BIC', '41672', 'Plate', '180', '0');
INSERT INTO PRODUCTS (MFR, ProdU, Description, Price, QtyOnHand)
VALUES(
      'IMM', '779C', '900-lb Brace', '1875', '9');
INSERT INTO PRODUCTS (MFR, ProdU, Description, Price, QtyOnHand)
VALUES(
      'ACI', '41003', 'Size 3 Widget', '107', '207');
INSERT INTO PRODUCTS (MFR, ProdU, Description, Price, QtyOnHand)
VALUES(
      'ACI', '41004', 'Size 4 Widget', '117', '139');
INSERT INTO PRODUCTS (MFR, ProdU, Description, Price, QtyOnHand)
VALUES(
      'BIC', '41003', 'Handle', '652', '3');
INSERT INTO PRODUCTS (MFR, ProdU, Description, Price, QtyOnHand)
VALUES(
      'IMM', '887P', 'Brace Pin', '250', '24');
INSERT INTO PRODUCTS (MFR, ProdU, Description, Price, QtyOnHand)
VALUES(
      'QSA', 'XK48', 'Reducer', '134', '203');
INSERT INTO PRODUCTS (MFR, ProdU, Description, Price, QtyOnHand)
VALUES(
      'REI', '2A44L', 'Left Hinge', '4500', '12');
INSERT INTO PRODUCTS (MFR, ProdU, Description, Price, QtyOnHand)
VALUES(
      'FEA', '112', 'Housing', '148', '115');
INSERT INTO PRODUCTS (MFR, ProdU, Description, Price, QtyOnHand)
VALUES(
      'IMM', '887H', 'Brace Holder', '54', '223');
INSERT INTO PRODUCTS (MFR, ProdU, Description, Price, QtyOnHand)
VALUES(
      'BIC', '41089', 'Retainer', '225', '78');
INSERT INTO PRODUCTS (MFR, ProdU, Description, Price, QtyOnHand)
VALUES(
      'ACI', '41001', 'Size 1 Widget', '55', '277');
INSERT INTO PRODUCTS (MFR, ProdU, Description, Price, QtyOnHand)
VALUES(
      'IMM', '775C', '500-lb Brace', '1425', '5');
INSERT INTO PRODUCTS (MFR, ProdU, Description, Price, QtyOnHand)
VALUES(
      'ACI', '4100Z', 'Widget Installer', '2500', '28');
INSERT INTO PRODUCTS (MFR, ProdU, Description, Price, QtyOnHand)
VALUES(
      'QSA', 'XK48A', 'Reducer', '177', '37');
      -- -----------------------------------------------------
      -- Table `dbcb7h6whtbc7d`.`CUSTOMERS`
      -- -----------------------------------------------------
CREATE TABLE `dbcb7h6whtbc7d`.`CUSTOMERS` (
  `CustNum` CHAR(4) NOT NULL,
  `Company` VARCHAR(50) NOT NULL,
  `CustRep` CHAR(3) NOT NULL,
  `CreditLimit` VARCHAR(6) NULL,
  PRIMARY KEY (`CustNum`)
);

INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2111', 'JCP Inc.', '103', '50000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2102', 'First Corp.', '101', '65000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2103', 'Acme Mfg.', '105', '50000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2123', 'Carter and Sons', '102', '40000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2107', 'Ace International', '110', '35000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2115', 'Smithson Corp.', '101', '20000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2101', 'Jones Mfg.', '106', '65000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2112', 'Zetacorp', '108', '50000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2121', 'QMA Assoc.', '103', '45000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2114', 'Orion Corp.', '102', '20000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2124', 'Peter Brothers', '107', '40000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2108', 'Holm and Landis', '109', '55000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2117', 'J.P. Sinclair', '106', '35000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2122', 'Three-Way Lines', '105', '30000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2120', 'Rico Enterprises', '102', '50000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2106', 'Fred Lewis Corp.', '102', '65000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2119', 'Solomon Inc.', '109', '25000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2118', 'Midwest Systems', '108', '60000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2113', 'Ian and Schmidt', '104', '20000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2109', 'Chen Associates', '103', '25000');
INSERT INTO CUSTOMERS (CustNum, Company, CustRep, CreditLimit)
VALUES(
      '2105', 'AAA Investments', '101', '45000');
      -- -----------------------------------------------------
      -- Table `dbcb7h6whtbc7d`.`ORDERS`
      -- -----------------------------------------------------

CREATE TABLE `dbcb7h6whtbc7d`.`ORDERS` (
  `OrderNum` CHAR(6) NOT NULL,
  `OrderDat` DATE NOT NULL,
  `Cust` CHAR(4) NOT NULL,
  `Rep` CHAR(3) NOT NULL,
  `MFR` CHAR(3) NOT NULL,
  `Produ` VARCHAR(5) NOT NULL,
  `QTY` VARCHAR(3) NOT NULL,
  `Amount` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`OrderNum`)
);

INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '112961', '1989-10-17', '2117', '106', 'REI', '2A44L', '7', '31500');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113012', '1990-01-11', '2111', '105', 'ACI', '41003', '35', '3745');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '112989', '1990-01-03', '2101', '106', 'FEA', '114', '6', '1458');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113051', '1990-02-10', '2118', '108', 'QSA', 'XK47', '4', '1420');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '112968', '1989-10-12', '2102', '101', 'ACI', '41004', '34', '3978');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113036', '1990-01-30', '2107', '110', 'ACI', '4100Z', '9', '22500');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113045', '1990-02-02', '2112', '108', 'REI', '2A44R', '10', '45000');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '112963', '1989-12-17', '2103', '105', 'ACI', '41004', '28', '3276');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113013', '1990-01-14', '2118', '108', 'BIC', '41003', '1', '652');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113058', '1990-02-23', '2108', '109', 'FEA', '112', '10', '1480');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '112997', '1990-01-08', '2124', '107', 'BIC', '41003', '1', '652');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '112983', '1989-10-27', '2103', '105', 'ACI', '41004', '6', '702');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113024', '1990-01-20', '2114', '108', 'QSA', 'XK47', '20', '7100');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113062', '1990-02-24', '2124', '107', 'FEA', '114', '10', '2430');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '112979', '1989-10-12', '2114', '102', 'ACI', '4100Z', '6', '15000');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113027', '1990-01-22', '2103', '105', 'ACI', '41002', '54', '4104');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113007', '1990-01-08', '2112', '108', 'IMM', '773C', '3', '2925');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113069', '1990-03-02', '2109', '107', 'IMM', '775C', '22', '31350');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113034', '1990-01-29', '2107', '110', 'REI', '2A45C', '8', '632');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '112992', '1989-11-04', '2118', '108', 'ACI', '41002', '10', '760');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '112975', '1989-10-12', '2111', '103', 'REI', '2A44G', '6',  '2100');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113055', '1990-02-15', '2108', '101', 'ACI', '4100X', '6', '150');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113048', '1990-02-10', '2120', '102', 'IMM', '779C', '2', '3750');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '112993', '1989-01-04', '2106', '102', 'REI', '2A45C', '24', '1896');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113065', '1990-02-27', '2106', '102', 'QSA', 'XK47', '6', '2130');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113003', '1990-01-25', '2108', '109', 'IMM', '779C', '3', '5625');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113049', '1990-02-10', '2118', '108', 'QSA', 'XK47', '2', '776');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '112987', '1989-10-31', '2103', '105', 'ACI', '4100Y', '11', '27500');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113057', '1990-02-18', '2111', '103', 'ACI', '4100X', '24', '600');
INSERT INTO ORDERS (OrderNum, OrderDat, Cust, Rep, MFR, Produ, QTY, Amount)
VALUES(
      '113042', '1990-02-02', '2113', '101', 'REI', '2A44R', '5', '22500');

--1--
SELECT CITY, TARGET, SALES
FROM OFFICES

--2--
SELECT CITY, TARGET, SALES
FROM OFFICES
WHERE Region = 'Eastern'

--3--
SELECT CITY, TARGET, SALES
FROM OFFICES
WHERE Region = 'Eastern'
AND SALES > TARGET
ORDER BY CITY

--4--
SELECT AVG(TARGET), AVG(SALES)
FROM OFFICES
WHERE Region = 'Eastern'

--5--
SELECT NAME, REPOFFICE, HIREDATE
FROM SALESREPS

--6--
SELECT NAME, QUOTA, SALES
FROM SALESREPS
WHERE EMPLNUM = 107

--7--
SELECT AVG(SALES)
FROM SALESREPS

--8--
SELECT NAME, HIREDATE
FROM SALESREPS
WHERE SALES > 500000

--9--
SELECT CITY, REGION, (SALES-TARGET)
FROM OFFICES

--10--
SELECT DESCRIPTION, MFR, (PRICE*QTYONHAND)
FROM PRODUCTS

--11--
SELECT NAME, QUOTA, (QUOTA + (.03*SALES))
FROM SALESREPS

--12--
SELECT CITY, SALES
FROM OFFICES

--13--
SELECT OFFICE, CITY, TARGET, SALES, REGION, MGR
FROM OFFICES

--14--
SELECT REGION
FROM OFFICES

--15--
SELECT OFFICE
FROM OFFICES
WHERE SALES > TARGET

--16--
SELECT NAME, SALES, QUOTA
FROM SALESREPS
WHERE EMPLNUM = 105

--17--
SELECT NAME
FROM SALESREPS
WHERE MANAGER = 104

--18--
SELECT NAME
FROM SALESREPS
WHERE HIREDATE < '1988-01-01'

--19--
SELECT CITY, SALES, TARGET
FROM OFFICES
WHERE SALES < (.8 * TARGET)

--20--
SELECT OFFICE
FROM OFFICES
WHERE MGR <> 108

--21--
SELECT ORDERNUM, ORDERDAT
FROM ORDERS
WHERE ORDERDAT BETWEEN '1989-10-01' AND '1989-12-31'

--22--
SELECT ORDERNUM
FROM ORDERS
WHERE AMOUNT BETWEEN 20000 AND 30000

--23--
SELECT NAME
FROM SALESREPS
WHERE SALES NOT BETWEEN (.8 * QUOTA) AND (1.2 * QUOTA)

--24--
SELECT NAME
FROM SALESREPS
WHERE REPOFFICE IN (11, 13, 22)

--25--
SELECT NAME
FROM SALESREPS
WHERE REPOFFICE IN (12, 13, 21)

--26--
SELECT NAME
FROM SALESREPS
WHERE REPOFFICE NOT IN (11, 22)

--27--
SELECT CREDITLIMIT
FROM CUSTOMERS
WHERE COMPANY = 'Smithson Corp.'

--28--
SELECT NAME
FROM SALESREPS
WHERE REPOFFICE = ''

--29--
SELECT NAME
FROM SALESREPS
WHERE REPOFFICE IN (22, 11, 12, 13, 21)

--30--
SELECT NAME
FROM SALESREPS
WHERE QUOTA OR SALES > 300000

--31--
SELECT NAME
FROM SALESREPS
WHERE QUOTA AND SALES > 300000

--32--
SELECT NAME, QUOTA, SALES
FROM SALESREPS
WHERE SALES < QUOTA
AND NOT SALES < 150000

 --33--
SELECT CITY, REGION, SALES
FROM OFFICES
ORDER BY REGION, CITY

--34--
SELECT OFFICE, SALES
FROM OFFICES
ORDER BY SALES DESC;

--35--
SELECT MFR, PRODU
FROM PRODUCTS
WHERE PRICE > 2000

--36--
SELECT DISTINCT MFR, PRODU
FROM ORDERS
WHERE AMOUNT > 30000

--37--
SELECT MFR, PRODU
FROM PRODUCTS
WHERE PRICE > 2000
UNION
SELECT DISTINCT MFR, PRODU
FROM ORDERS
WHERE AMOUNT > 30000

--38--
SELECT ORDERNUM, AMOUNT, COMPANY, CREDITLIMIT
FROM ORDERS, CUSTOMERS
WHERE CUST = CUSTNUM

--39--
SELECT NAME, CITY, REGION
FROM SALESREPS, OFFICES
WHERE REPOFFICE = OFFICE

--40--
SELECT CITY, NAME, TITLE
FROM OFFICES, SALESREPS
WHERE MGR = EMPLNUM

--41--
SELECT ORDERNUM, AMOUNT, DESCRIPTION
FROM ORDERS, PRODUCTS

--42--
SELECT ORDERNUM, AMOUNT, COMPANY, NAME
FROM ORDERS, CUSTOMERS, SALESREPS
WHERE CUST = CUSTNUM
AND REP = EMPLNUM
AND AMOUNT > 25000

--43--
SELECT NAME, CITY
FROM SALESREPS, OFFICES
WHERE REPOFFICE = OFFICE

--44--
SELECT NAME, CITY
FROM OFFICES, SALESREPS
WHERE OFFICE = REPOFFICE

--45--
SELECT SALESREPS.EMPLNUM, SALESREPS.NAME, MGRS.MANAGER, MGRS.NAME
FROM SALESREPS, SALESREPS MGRS
WHERE SALESREPS.MANAGER = MGRS.EMPLNUM

--46--
SELECT EMPS.EMPLNUM, EMPS.NAME, EMPS.REPOFFICE, EMPOFFICE.CITY, MGRS.EMPLNUM, MGRS.NAME, MGRS.REPOFFICE, MGROFFICE.CITY
FROM SALESREPS EMPS, SALESREPS MGRS,
OFFICES EMPOFFICE, OFFICES MGROFFICE
WHERE EMPS.REPOFFICE = EMPOFFICE.OFFICE
AND MGRS.REPOFFICE = MGROFFICE.OFFICE
AND EMPS.MANAGER = MGRS.EMPL_NUM
AND EMPS.REPOFFICE <> MGRS.REPOFFICE

--47--
SELECT AVG(QUOTA), AVG(SALES)
FROM SALESREPS

--48--
SELECT SUM(QUOTA), SUM(SALES)
FROM SALESREPS

--49--
SELECT SUM(AMOUNT)
FROM ORDERS, SALESREPS
WHERE NAME = 'Bill Adams'
AND REP = EMPLNUM

--50--
SELECT MIN(QUOTA), MAX(QUOTA)
FROM SALESREPS

--51--
SELECT COUNT(CUSTNUM)
FROM CUSTOMERS

--52--
SELECT COUNT(*), COUNT(QUOTA)
FROM SALESREPS;

--53--
SELECT COUNT(REGION)
FROM OFFICES
GROUP BY REGION
HAVING COUNT(REGION) < 3

--54--
SELECT EMPLNUM, AVG(SALES)
FROM SALESREPS
GROUP BY NAME

--55--
SELECT REPOFFICE, COUNT(*)
FROM SALESREPS
GROUP BY REPOFFICE

--56--
SELECT REP, AVG(AMOUNT)
FROM ORDERS
GROUP BY REP
HAVING SUM(AMOUNT) > 30000

--57--
SELECT REPOFFICE, COUNT(*), SUM(QUOTA), SUM(SALESREPS.SALES)
FROM OFFICES, SALESREPS
WHERE OFFICE = REPOFFICE
GROUP BY REPOFFICE
HAVING COUNT(*) >= 2

--58--
SELECT NAME
FROM SALESREPS
WHERE QUOTA >=
       (SELECT TARGET
        FROM OFFICES
        WHERE CITY = 'Atlanta')

--59--
SELECT COMPANY
FROM CUSTOMERS
WHERE CUSTREP =
  (SELECT EMPLNUM
    FROM SALESREPS
    WHERE NAME = 'Bill Adams')

--60--
SELECT EMPLNUM, NAME, REPOFFICE
FROM SALESREPS
WHERE REPOFFICE IN (SELECT OFFICE
FROM OFFICES
WHERE SALES > TARGET)
