-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dbta8gacvpvcvr
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbta8gacvpvcvr
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbta8gacvpvcvr` DEFAULT CHARACTER SET latin1 ;
USE `dbta8gacvpvcvr` ;

-- -----------------------------------------------------
-- Table `dbta8gacvpvcvr`.`STORE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbta8gacvpvcvr`.`STORE` (
  `StoreID` INT NOT NULL,
  `StoreName` CHAR(50) NOT NULL,
  `City` CHAR(35) NOT NULL,
  `Country` CHAR(50) NOT NULL,
  `Phone` CHAR(16) NOT NULL,
  `Fax` CHAR(16) NULL,
  `EmailAddress` VARCHAR(100) NULL,
  `Contact` CHAR(50) NOT NULL,
  PRIMARY KEY (`StoreID`),
  UNIQUE INDEX `Email_UNIQUE` (`EmailAddress` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbta8gacvpvcvr`.`EMPLOYEE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbta8gacvpvcvr`.`EMPLOYEE` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `LastName` CHAR(35) NOT NULL,
  `FirstName` CHAR(35) NOT NULL,
  `Department` CHAR(35) NOT NULL,
  `Phone` CHAR(16) NOT NULL,
  `Fax` CHAR(16) NULL,
  `EmailAddress` VARCHAR(100) NOT NULL,
  `IsPurchaser` TINYINT(1) NULL,
  `IsReceiver` TINYINT(1) NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbta8gacvpvcvr`.`SUBTYPE_CONNECTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbta8gacvpvcvr`.`SUBTYPE_CONNECTOR` (
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  CONSTRAINT `fk_SUBTYPE_CONNECTOR_EMPLOYEE1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `dbta8gacvpvcvr`.`EMPLOYEE` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbta8gacvpvcvr`.`PURCHASER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbta8gacvpvcvr`.`PURCHASER` (
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  INDEX `fk_PURCHASER_SUBTYPE_CONNECTOR1_idx` (`EmployeeID` ASC) ,
  CONSTRAINT `fk_PURCHASER_SUBTYPE_CONNECTOR1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `dbta8gacvpvcvr`.`SUBTYPE_CONNECTOR` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbta8gacvpvcvr`.`PURCHASE_ITEM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbta8gacvpvcvr`.`PURCHASE_ITEM` (
  `PurchaseItemID` INT NOT NULL,
  `StoreID` INT NOT NULL,
  `PurchaseDate` DATE NOT NULL,
  `ItemDescription` VARCHAR(100) NOT NULL,
  `Category` CHAR(25) NULL,
  `PriceUSD` DECIMAL(12,2) NOT NULL,
  `PURCHASER_EmployeeID` INT NOT NULL,
  PRIMARY KEY (`PurchaseItemID`),
  INDEX `fk_PURCHASE_ITEM_STORE_idx` (`StoreID` ASC) ,
  INDEX `fk_PURCHASE_ITEM_PURCHASER1_idx` (`PURCHASER_EmployeeID` ASC) ,
  CONSTRAINT `fk_PURCHASE_ITEM_STORE`
    FOREIGN KEY (`StoreID`)
    REFERENCES `dbta8gacvpvcvr`.`STORE` (`StoreID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PURCHASE_ITEM_PURCHASER1`
    FOREIGN KEY (`PURCHASER_EmployeeID`)
    REFERENCES `dbta8gacvpvcvr`.`PURCHASER` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbta8gacvpvcvr`.`SHIPPER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbta8gacvpvcvr`.`SHIPPER` (
  `ShipperID` INT NOT NULL,
  `ShipperName` CHAR(50) NOT NULL,
  `Phone` CHAR(12) NOT NULL,
  `Fax` CHAR(16) NULL,
  `EmailAddress` VARCHAR(100) NOT NULL,
  `Contact` CHAR(50) NOT NULL,
  PRIMARY KEY (`ShipperID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbta8gacvpvcvr`.`SHIPMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbta8gacvpvcvr`.`SHIPMENT` (
  `ShipmentID` INT NOT NULL,
  `ShipperID` INT NOT NULL,
  `ShipperInvoiceNumber` CHAR(45) NOT NULL,
  `Origin` CHAR(35) NOT NULL,
  `Destination` CHAR(35) NOT NULL,
  `ScheduledDepartureDate` DATE NULL,
  `ActualDepartureDate` DATE NULL,
  `EstimatedArrivalDate` DATE NULL,
  `PURCHASER_EmployeeID` INT NOT NULL,
  PRIMARY KEY (`ShipmentID`),
  INDEX `fk_SHIPMENT_SHIPPER1_idx` (`ShipperID` ASC) ,
  INDEX `fk_SHIPMENT_PURCHASER1_idx` (`PURCHASER_EmployeeID` ASC) ,
  CONSTRAINT `fk_SHIPMENT_SHIPPER1`
    FOREIGN KEY (`ShipperID`)
    REFERENCES `dbta8gacvpvcvr`.`SHIPPER` (`ShipperID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SHIPMENT_PURCHASER1`
    FOREIGN KEY (`PURCHASER_EmployeeID`)
    REFERENCES `dbta8gacvpvcvr`.`PURCHASER` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbta8gacvpvcvr`.`SHIPMENT_ITEM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbta8gacvpvcvr`.`SHIPMENT_ITEM` (
  `ShipmentID` INT NOT NULL,
  `ShipmentItemID` INT NOT NULL,
  `PurchaseItemID` INT NOT NULL,
  `InsuredValue` DECIMAL(12,2) NULL,
  PRIMARY KEY (`ShipmentItemID`, `ShipmentID`),
  INDEX `fk_SHIPMENT_ITEM_SHIPMENT1_idx` (`ShipmentID` ASC) ,
  INDEX `fk_SHIPMENT_ITEM_PURCHASE_ITEM1_idx` (`PurchaseItemID` ASC) ,
  CONSTRAINT `fk_SHIPMENT_ITEM_SHIPMENT1`
    FOREIGN KEY (`ShipmentID`)
    REFERENCES `dbta8gacvpvcvr`.`SHIPMENT` (`ShipmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SHIPMENT_ITEM_PURCHASE_ITEM1`
    FOREIGN KEY (`PurchaseItemID`)
    REFERENCES `dbta8gacvpvcvr`.`PURCHASE_ITEM` (`PurchaseItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbta8gacvpvcvr`.`RECEIVER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbta8gacvpvcvr`.`RECEIVER` (
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  CONSTRAINT `fk_RECEIVER_SUBTYPE_CONNECTOR1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `dbta8gacvpvcvr`.`SUBTYPE_CONNECTOR` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbta8gacvpvcvr`.`SHIPMENT_RECEIPT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbta8gacvpvcvr`.`SHIPMENT_RECEIPT` (
  `ReceiptNumber` INT NOT NULL AUTO_INCREMENT,
  `ReceiptDate` DATE NOT NULL,
  `ReceiptTime` TIME NOT NULL,
  `ReceiptQuantity` INT NOT NULL,
  `isReceivedUndamged` TINYINT(1) NOT NULL,
  `DamageNotes` VARCHAR(255) NULL,
  `RECEIVER_EmployeeID` INT NOT NULL,
  `SHIPMENT_ITEM_ShipmentItemID` INT NOT NULL,
  `SHIPMENT_ITEM_ShipmentID` INT NOT NULL,
  PRIMARY KEY (`ReceiptNumber`),
  INDEX `fk_SHIPMENT_RECEIPT_RECEIVER1_idx` (`RECEIVER_EmployeeID` ASC) ,
  INDEX `fk_SHIPMENT_RECEIPT_SHIPMENT_ITEM1_idx` (`SHIPMENT_ITEM_ShipmentItemID` ASC, `SHIPMENT_ITEM_ShipmentID` ASC) ,
  CONSTRAINT `fk_SHIPMENT_RECEIPT_RECEIVER1`
    FOREIGN KEY (`RECEIVER_EmployeeID`)
    REFERENCES `dbta8gacvpvcvr`.`RECEIVER` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SHIPMENT_RECEIPT_SHIPMENT_ITEM1`
    FOREIGN KEY (`SHIPMENT_ITEM_ShipmentItemID` , `SHIPMENT_ITEM_ShipmentID`)
    REFERENCES `dbta8gacvpvcvr`.`SHIPMENT_ITEM` (`ShipmentItemID` , `ShipmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

UPDATE STORE
SET City = 'NYC'
Where City = 'New York City'

INSERT INTO PURCHASE_ITEM VALUES (570, 1150, '2018-07-23', 'Xbox', 'Technology', 360.00, 103);
INSERT INTO PURCHASE_ITEM VALUES (571, 1150, '2018-07-23', 'PS4', 'Technology', 360.00, 103);

INSERT INTO SHIPMENT VALUES (118, 3, 293940, 'Lima', 'Bedford', '2018-08-11', '2018-08-11', '2018-09-10', 103);

INSERT INTO SHIPMENT_ITEM VALUES (118, 5, 570, 500.00);
INSERT INTO SHIPMENT_ITEM VALUES (118, 6, 571, 500.00);

DELETE FROM SHIPMENT_ITEM WHERE PurchaseItemID=570;
DELETE FROM SHIPMENT_ITEM WHERE PurchaseItemID=571;

DELETE FROM SHIPMENT WHERE ShipmentID=118;

DELETE FROM PURCHASE_ITEM WHERE PurchaseItemID=570;
DELETE FROM PURCHASE_ITEM WHERE PurchaseItemID=571;
