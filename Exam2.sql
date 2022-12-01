-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dbudglhndjugpl
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbudglhndjugpl
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbudglhndjugpl` DEFAULT CHARACTER SET utf8mb4 ;
USE `dbudglhndjugpl` ;

-- -----------------------------------------------------
-- Table `dbudglhndjugpl`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbudglhndjugpl`.`employee` (
  `EmployeeID` INT(11) NOT NULL,
  `LastName` CHAR(25) NOT NULL,
  `FirstName` CHAR(25) NOT NULL,
  `CellPhone` CHAR(12) NOT NULL,
  `ExperienceLevel` CHAR(15) NOT NULL,
  `Supervisor` INT(11) NULL DEFAULT NULL,
  `Apprenticeship` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  INDEX `EMP_EMP_FK` (`Supervisor` ASC) ,
  CONSTRAINT `EMP_EMP_FK`
    FOREIGN KEY (`Supervisor`)
    REFERENCES `dbudglhndjugpl`.`employee` (`EmployeeID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
;


-- -----------------------------------------------------
-- Table `dbudglhndjugpl`.`service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbudglhndjugpl`.`service` (
  `ServiceID` INT(11) NOT NULL,
  `ServiceDescription` VARCHAR(100) NOT NULL,
  `CostPerHour` DECIMAL(6,2) NULL DEFAULT NULL,
  PRIMARY KEY (`ServiceID`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
;


-- -----------------------------------------------------
-- Table `dbudglhndjugpl`.`owner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbudglhndjugpl`.`owner` (
  `OwnerID` INT(11) NOT NULL,
  `OwnerName` CHAR(50) NOT NULL,
  `OwnerEmailAddress` VARCHAR(100) NULL DEFAULT NULL,
  `OwnerType` CHAR(12) NULL DEFAULT NULL,
  PRIMARY KEY (`OwnerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
;


-- -----------------------------------------------------
-- Table `dbudglhndjugpl`.`property`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbudglhndjugpl`.`property` (
  `PropertyID` INT(11) NOT NULL,
  `PropertyName` VARCHAR(50) NOT NULL,
  `PropertyType` VARCHAR(50) NOT NULL,
  `Street` CHAR(35) NOT NULL,
  `City` CHAR(35) NOT NULL,
  `State` CHAR(2) NOT NULL,
  `ZIP` CHAR(10) NOT NULL,
  `OwnerID` INT(11) NOT NULL,
  PRIMARY KEY (`PropertyID`),
  INDEX `PROPERTY_OWNER_FK` (`OwnerID` ASC) ,
  CONSTRAINT `PROPERTY_OWNER_FK`
    FOREIGN KEY (`OwnerID`)
    REFERENCES `dbudglhndjugpl`.`owner` (`OwnerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
;


-- -----------------------------------------------------
-- Table `dbudglhndjugpl`.`property_service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbudglhndjugpl`.`property_service` (
  `PropertyServiceID` INT(11) NOT NULL,
  `PropertyID` INT(11) NOT NULL,
  `ServiceID` INT(11) NOT NULL,
  `ServiceDate` DATE NOT NULL,
  `EmployeeID` INT(11) NOT NULL,
  `HoursWorked` DECIMAL(4,2) NULL DEFAULT NULL,
  PRIMARY KEY (`PropertyServiceID`),
  INDEX `PROP_SERVICE_PROP_FK` (`PropertyID` ASC) ,
  INDEX `PROP_SERVICE_SERVICE_FK` (`ServiceID` ASC) ,
  INDEX `PROP_SERVICE_EMP_FK` (`EmployeeID` ASC) ,
  CONSTRAINT `PROP_SERVICE_EMP_FK`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `dbudglhndjugpl`.`employee` (`EmployeeID`),
  CONSTRAINT `PROP_SERVICE_PROP_FK`
    FOREIGN KEY (`PropertyID`)
    REFERENCES `dbudglhndjugpl`.`property` (`PropertyID`),
  CONSTRAINT `PROP_SERVICE_SERVICE_FK`
    FOREIGN KEY (`ServiceID`)
    REFERENCES `dbudglhndjugpl`.`service` (`ServiceID`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
;


-- -----------------------------------------------------
-- Table `dbudglhndjugpl`.`tool`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbudglhndjugpl`.`tool` (
  `ToolID` INT(11) NOT NULL,
  `ToolDescription` CHAR(25) NOT NULL,
  `PurchaseDate` DATE NOT NULL,
  PRIMARY KEY (`ToolID`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
;


-- -----------------------------------------------------
-- Table `dbudglhndjugpl`.`tool_use`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbudglhndjugpl`.`tool_use` (
  `ToolID` INT(11) NOT NULL,
  `Date` DATE NOT NULL,
  `EmployeeID` INT(11) NOT NULL,
  PRIMARY KEY (`ToolID`, `Date`, `EmployeeID`),
  INDEX `TU_EMP_FK` (`EmployeeID` ASC) ,
  CONSTRAINT `TU_EMP_FK`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `dbudglhndjugpl`.`employee` (`EmployeeID`),
  CONSTRAINT `TU_TOOL_FK`
    FOREIGN KEY (`ToolID`)
    REFERENCES `dbudglhndjugpl`.`tool` (`ToolID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

--3--
INSERT INTO tool VALUES ('8', 'Weeder', '2017-03-25')
INSERT INTO service VALUES ('8', 'Weed Maintenance', '80.00')

--4--
SELECT FirstName, LastName, CellPhone
FROM employee
WHERE ExperienceLevel = 'Senior'

--5--
SELECT FirstName, LastName, CellPhone
FROM employee
WHERE ExperienceLevel = 'Senior' AND LastName LIKE 'F%'

--6--
SELECT ServiceID, ServiceDescription, CostPerHour, (CostPerHour * 1.15) AS 'NewCostPerHour'
FROM service
--7--
SELECT PropertyID, sum(HoursWorked)
FROM property_service
GROUP BY PropertyID

--8--
SELECT FirstName, LastName, CellPhone
FROM employee
WHERE EmployeeID = ANY (SELECT EmployeeID FROM property_service WHERE PropertyID = 4 OR 5 OR 8)

--9--
SELECT employee.FirstName, employee.LastName, employee.CellPhone
FROM employee
JOIN property_service ON property_service.EmployeeID = employee.EmployeeID
WHERE PropertyID = 4 OR 5 OR 8
GROUP BY FirstName, LastName

--10--
SELECT employee.ExperienceLevel, AVG(property_service.HoursWorked)
FROM employee
JOIN property_service ON employee.EmployeeID = property_service.EmployeeID
GROUP BY ExperienceLevel DESC;

--11--
UPDATE employee
SET ExperienceLevel = 'Senior'
WHERE ExperienceLevel = 'Junior'

UPDATE employee
SET ExperienceLevel = 'Expert'
WHERE ExperienceLevel = 'Senior'

--12--
DELETE FROM service
WHERE ServiceDescription LIKE 'W%'
