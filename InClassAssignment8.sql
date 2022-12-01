-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dbaodlobumafag
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbaodlobumafag
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbaodlobumafag` DEFAULT CHARACTER SET utf8 ;
USE `dbaodlobumafag` ;

-- -----------------------------------------------------
-- Table `dbaodlobumafag`.`DEPARTMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbaodlobumafag`.`DEPARTMENT` (
  `DepartmentName` CHAR(35) NOT NULL,
  `BudgetCode` CHAR(30) NOT NULL,
  `OfficeNumber` CHAR(15) NOT NULL,
  `DepartmentPhone` CHAR(12) NOT NULL,
  PRIMARY KEY (`DepartmentName`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbaodlobumafag`.`EMPLOYEE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbaodlobumafag`.`EMPLOYEE` (
  `EmployeeNumber` INT NOT NULL,
  `FirstName` CHAR(25) NOT NULL,
  `LastName` CHAR(25) NOT NULL,
  `Department` CHAR(35) NOT NULL,
  `Position` CHAR(35) NULL,
  `Supervisor` INT NULL,
  `OfficePhone` CHAR(12) NULL,
  `EmailAddress` VARCHAR(100) NULL,
  PRIMARY KEY (`EmployeeNumber`),
  INDEX `fk_EMPLOYEE_DEPARTMENT_idx` (`Department` ASC) VISIBLE,
  INDEX `fk_EMPLOYEE_EMPLOYEE1_idx` (`Supervisor` ASC) VISIBLE,
  CONSTRAINT `fk_EMPLOYEE_DEPARTMENT`
    FOREIGN KEY (`Department`)
    REFERENCES `dbaodlobumafag`.`DEPARTMENT` (`DepartmentName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLOYEE_EMPLOYEE1`
    FOREIGN KEY (`Supervisor`)
    REFERENCES `dbaodlobumafag`.`EMPLOYEE` (`EmployeeNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbaodlobumafag`.`PROJECT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbaodlobumafag`.`PROJECT` (
  `ProjectID` INT NOT NULL,
  `ProjectName` CHAR(50) NOT NULL,
  `Department` CHAR(35) NOT NULL,
  `MaxHours` DECIMAL(8,2) NOT NULL,
  `StartDate` DATE NULL,
  `EndDate` DATE NULL,
  PRIMARY KEY (`ProjectID`),
  INDEX `fk_PROJECT_DEPARTMENT1_idx` (`Department` ASC) VISIBLE,
  CONSTRAINT `fk_PROJECT_DEPARTMENT1`
    FOREIGN KEY (`Department`)
    REFERENCES `dbaodlobumafag`.`DEPARTMENT` (`DepartmentName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbaodlobumafag`.`ASSIGNMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbaodlobumafag`.`ASSIGNMENT` (
  `EmployeeNumber` INT NOT NULL,
  `ProjectID` INT NOT NULL,
  `HoursWorked` DECIMAL(6,2) NULL,
  PRIMARY KEY (`EmployeeNumber`, `ProjectID`),
  INDEX `fk_EMPLOYEE_has_PROJECT_PROJECT1_idx` (`ProjectID` ASC) VISIBLE,
  INDEX `fk_EMPLOYEE_has_PROJECT_EMPLOYEE1_idx` (`EmployeeNumber` ASC) VISIBLE,
  CONSTRAINT `fk_EMPLOYEE_has_PROJECT_EMPLOYEE1`
    FOREIGN KEY (`EmployeeNumber`)
    REFERENCES `dbaodlobumafag`.`EMPLOYEE` (`EmployeeNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLOYEE_has_PROJECT_PROJECT1`
    FOREIGN KEY (`ProjectID`)
    REFERENCES `dbaodlobumafag`.`PROJECT` (`ProjectID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Question 4, Show all projects --
SELECT *
FROM PROJECT;
-- Question 5, Projects before August 1st, 2019 --
SELECT *
FROM PROJECT
WHERE StartDate < '2019-8-1';
-- Question 6, Non Completed Projects --
SELECT *
FROM PROJECT
WHERE EndDate IS NULL;
-- Question 7, What employees are on each project --
SELECT ProjectID, EMPLOYEE.EmployeeNumber, LastName, FirstName, OfficePhone
FROM ASSIGNMENT INNER JOIN EMPLOYEE
ON ASSIGNMENT.EmployeeNumber = EMPLOYEE.EmployeeNumber;
-- Question 8, Ascending order --
SELECT ProjectID, EMPLOYEE.EmployeeNumber, LastName, FirstName, OfficePhone
FROM ASSIGNMENT INNER JOIN EMPLOYEE
ON ASSIGNMENT.EmployeeNumber = EMPLOYEE.EmployeeNumber
ORDER BY ProjectID;
-- Question 9, By Sales and Marketing --
SELECT PROJECT.ProjectID, ProjectName, PROJECT.Department, EMPLOYEE.EmployeeNumber,
LastName, FirstName, OfficePhone
FROM ((ASSIGNMENT
  INNER JOIN EMPLOYEE
  ON ASSIGNMENT.EmployeeNumber = EMPLOYEE.EmployeeNumber)
INNER JOIN PROJECT
ON ASSIGNMENT.ProjectID = PROJECT.ProjectID)
INNER JOIN DEPARTMENT
ON PROJECT.Department = DEPARTMENT.DepartmentPhone
WHERE PROJECT.Department = 'Sales and Marketing';
-- Question 10,Projects --
SELECT COUNT(ProjectID) AS 'Number of Projects'
FROM PROJECT
WHERE Department = 'Sales and Marketing';
-- Question 11, SUM MaxHours --
SELECT SUM(MaxHours) AS 'Sum of Hours per Projects'
FROM PROJECT
WHERE Department = 'Sales and Marketing';
-- Question 12, AVG MaxHours --
SELECT AVG(MaxHours) AS 'Sum of Hours per Projects'
FROM PROJECT
WHERE Department = 'Sales and Marketing';
-- Question 13, Number of projects per department
SELECT DEPARTMENT, COUNT(*) AS 'Number of Projects'
FROM PROJECT
GROUP BY DEPARTMENT;
-- Question 14, Update OPS1 --
UPDATE EMPLOYEE
SET POSITION = 'Operations 1'
WHERE (Position = 'OPS1');
