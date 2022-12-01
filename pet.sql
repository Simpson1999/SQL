show databases;
use ;dbwvc7hq5cigre

/*Q1*/
CREATE TABLE PET_OWNER(
OwnerID Int NOT NULL AUTO_INCREMENT,
OwnerLastName Char(25) NOT NULL,
OwnerFirstName Char(25) NOT NULL,
OwnerPhone Char(12) NULL,
OwnerEmail VarChar(100) NULL,
CONSTRAINT OWNER_PK PRIMARY KEY(OwnerID)
);

/*Q2*/
INSERT INTO PET_OWNER (OwnerLastName, OwnerFirstName, OwnerPhone,
OwnerEmail) VALUES(
   'Downs', 'Marsha', '555-123-6788',
'Marsha.Downs@somewhere.com');
INSERT INTO PET_OWNER (OwnerLastName, OwnerFirstName, OwnerPhone,
OwnerEmail) VALUES(
   'James', 'Richard', '555-444-0098',
'Richard.James@somewhere.com');
INSERT INTO PET_OWNER (OwnerLastName, OwnerFirstName, OwnerPhone,
OwnerEmail) VALUES(
   'Frier', 'Liz', '555-444-5596', 'Liz.Frier@somewhere.com');
INSERT INTO PET_OWNER (OwnerLastName, OwnerFirstName, OwnerEmail)
    VALUES(
    'Trent', 'Miles', 'Miles.Trent@somewhere.com');

/*Q3*/
CREATE TABLE PET(
PetID Int NOT NULL AUTO_INCREMENT,
PetName Char(50) NOT NULL,
PetType Char(25) NOT NULL,
PetBreed VarChar(100) NULL,
PetDOB Date NULL,
OwnerID Int NOT NULL,
CONSTRAINT PET_PK PRIMARY KEY(PetID)
);
ALTER TABLE PET AUTO_INCREMENT=1;

/*Q4*/
INSERT INTO PET (PetName, PetType, PetBreed, PetDOB, OwnerID)
    VALUES('King', 'Dog', 'Std. Poodle', '2016-02-27', 1);
INSERT INTO PET (PetName, PetType, PetBreed, PetDOB, OwnerID)
    VALUES('Teddy', 'Cat', 'Cashmere', '2017-02-01', 2);
INSERT INTO PET (PetName, PetType, PetBreed, PetDOB, OwnerID)
    VALUES('Fido', 'Dog', 'Std. Poodle', '2015-07-17', 1);
INSERT INTO PET (PetName, PetType, PetBreed, PetDOB, OwnerID)
    VALUES('AJ', 'Dog', 'Collie Mix', '2016-05-05', 3);
INSERT INTO PET (PetName, PetType, PetBreed, PetDOB, OwnerID)
    VALUES('Cedro', 'Cat', 'Unknown', '2014-06-06', 2);
INSERT INTO PET (PetName, PetType, PetBreed, OwnerID)
    VALUES('Wooley', 'Cat', 'Unknown', 2);
INSERT INTO PET (PetName, PetType, PetBreed, PetDOB, OwnerID)
    VALUES( 'Buster', 'Dog', 'Border Collie', '2013-12-11', 4);

/*Q5*/
ALTER TABLE PET
ADD CONSTRAINT OWNER_FK FOREIGN KEY (OwnerID)
REFERENCES PET_OWNER (OwnerID);

ALTER TABLE PET
ADD CONSTRAINT PET_OWNER_FK FOREIGN KEY (OwnerID)
REFERENCES PET_OWNER (OwnerID) ON DELETE CASCADE;

/*Q6*/
CREATE TABLE PET_2(
PetName Char(50) NOT NULL,
PetType Char(25) NOT NULL,
PetBreed VarChar(100) NULL,
PetDOB Date NULL,
OwnerID Int NOT NULL,
CONSTRAINT PET_2_PK PRIMARY KEY(PetName),
CONSTRAINT PET_2_OWNER_FK FOREIGN KEY (OwnerID)
REFERENCES PET_OWNER (OwnerID)
);

/*Q7*/
ALTER TABLE PET_2
DROP FOREIGN KEY PET_2_OWNER_FK;

/*Q8*/
DROP TABLE PET_2;

/*Q9*/
SELECT PetID, PetName, PetType, PetBreed, PetDOB, OwnerID
FROM PET;

/*Q10*/
SELECT *
FROM PET;

/*Q11*/
SELECT PetBreed, PetType
FROM PET;

/*Q12*/
SELECT PetBreed, PetType, PetDOB
FROM PET
WHERE PetType = 'Dog';

SELECT PetBreed, PetType, PetDOB
FROM PET
WHERE PetType = 'Cat';

/*Q13*/
SELECT PetBreed
FROM PET;

/*Q14*/
SELECT DISTINCT PetBreed
FROM PET;

/*Q15*/
SELECT PetBreed, PetType, PetDOB
FROM PET
WHERE PetType = 'Dog' AND PetBreed = 'Std. Poodle';

SELECT PetID, PetBreed, PetType, PetDOB
FROM PET
WHERE PetType = 'Cat' AND PetID > 3;

/*Q16*/
SELECT PetName, PetBreed, PetType
FROM PET
WHERE PetType NOT IN ('Dog', 'Cat', 'Fish');

SELECT PetName, PetBreed, PetType
FROM PET
WHERE PetType = 'Dog' OR PetType = 'Fish'

/*Q17*/
SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER
WHERE OwnerEmail LIKE '%somewhere.com'

SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER
WHERE OwnerFirstName LIKE 'M%'

/*Q18*/
SELECT PetID, PetBreed, PetType
FROM PET
WHERE RTRIM(PetName) LIKE 'K___';

SELECT PetID, PetName, PetBreed, PetType
FROM PET
WHERE RTRIM(PetName) LIKE '____';

/*Q19*/
SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER
WHERE OwnerPhone IS Null;

/*Q20*/
SELECT PetName, PetBreed
FROM PET
ORDER BY PetName;

/*Q21*/
SELECT PetName, PetBreed
FROM PET
ORDER BY PetBreed ASC, PetName DESC;

/*Q22*/
SELECT COUNT(*) AS NumberOfPets
FROM PET;

/*Q23*/
SELECT Count(DISTINCT PetBreed) AS NumberOfPetBreeds
FROM PET;

SELECT Count(DISTINCT PetType) AS NumberOfPetBreeds
FROM PET;

/*Q24*/
CREATE TABLE PET_3(
PetID Int NOT NULL AUTO_INCREMENT,
PetName Char(50) NOT NULL,
PetType Char(25) NOT NULL,
PetBreed VarChar(100) NULL,
PetDOB Date NULL,
PetWeight Numeric(4,1) NULL,
OwnerID Int NOT NULL,
CONSTRAINT PET_3_PK PRIMARY KEY(PetID),
CONSTRAINT PET_3_OWNER_FK FOREIGN KEY(OwnerID)
REFERENCES PET_OWNER(OwnerID)
ON DELETE CASCADE
);
ALTER TABLE PET AUTO_INCREMENT=1; /* optional statement */

INSERT INTO PET_3 (PetName, PetType, PetBreed, PetDOB, PetWeight,
OwnerID) VALUES ('King', 'Dog', 'Std. Poodle', '2016-02-27',
25.5, 1);
INSERT INTO PET_3 (PetName, PetType, PetBreed, PetDOB, PetWeight,
OwnerID) VALUES ('Teddy', 'Cat', 'Cashmere', '2017-02-01', 10.5,
2);
INSERT INTO PET_3 (PetName, PetType, PetBreed, PetDOB, PetWeight,
OwnerID) VALUES ('Fido', 'Dog', 'Std. Poodle', '2015-07-17',
28.5, 1);
INSERT INTO PET_3 (PetName, PetType, PetBreed, PetDOB, PetWeight,
OwnerID) VALUES ('AJ', 'Dog', 'Collie Mix', '2016-05-05', 20.0,
3);
INSERT INTO PET_3 (PetName, PetType, PetBreed, PetDOB, PetWeight,
OwnerID) VALUES ('Cedro', 'Cat', 'Unknown', '2014-06-06', 9.5,
2);
INSERT INTO PET_3 (PetName, PetType, PetBreed, PetWeight,
OwnerID) VALUES ('Wooley', 'Cat', 'Unknown', 9.5, 2);
INSERT INTO PET_3 (PetName, PetType, PetBreed, PetDOB,
PetWeight, OwnerID) VALUES ('Buster', 'Dog', 'Border Collie',
'2013-12-11', 25.0, 4);

/*Q25*/
SELECT MIN(PetWeight) AS MinPetWeight,
MAX(PetWeight) AS MaxPetWeight,
AVG(PetWeight) AS AvgPetWeight
FROM PET_3
WHERE PetType = 'Dog';

/*Q26*/
SELECT PetBreed, AVG(PetWeight) AS AvgBreedWeight
FROM PET_3
GROUP BY PetBreed;

SELECT PetType, MIN(PetWeight) AS MinTypeWeight
FROM PET_3
GROUP BY PetType;

/*Q27*/
SELECT PetBreed, AVG(PetWeight) AS AvgBreedWeight
FROM PET_3
GROUP BY PetBreed
HAVING Count(*) > 1;

/*Q28*/
SELECT PetBreed, AVG(PetWeight) AS AvgBreedWeight
FROM PET_3
WHERE PetBreed <> 'Unknown'
GROUP BY PetBreed
HAVING Count(*) > 1;

/*Q29*/
SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER
WHERE OwnerID IN
(SELECT OwnerID
 FROM PET_3
 WHERE PetType = 'Cat');

/*Q30*/
 SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER JOIN PET_3
ON PET_OWNER.OwnerID = PET_3.OwnerID
WHERE PetType = 'Cat';

SELECT DISTINCT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER as PO JOIN PET_3 as P
ON PO.OwnerID = P.OwnerID
WHERE PetType = 'Cat';

/*Q31*/
SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER
WHERE OwnerID IN
	(SELECT OwnerID
	FROM PET_3
	WHERE PetName= 'Teddy' AND PetType = 'Cat');

/*Q32*/
CREATE TABLE BREED(
BreedName VarChar(100) NOT NULL,
MinWeight Numeric(4,1) NULL,
MaxWeight Numeric(4,1) NULL,
AverageLifeExpectancy Numeric(4,1) NULL,
CONSTRAINT BREED_PK PRIMARY KEY(BreedName)
);

INSERT INTO BREED VALUES('Border Collie', 15.0, 22.5, 20);
INSERT INTO BREED VALUES('Cashmere', 10.0, 15.0, 12);
INSERT INTO BREED VALUES('Collie Mix', 17.5, 25.0, 18);
INSERT INTO BREED VALUES('Std. Poodle', 22.5, 30.0, 18);
INSERT INTO BREED(BreedName) VALUES('Unknown');

ALTER TABLE PET
ADD CONSTRAINT PET_BREED_FK FOREIGN KEY(PetBreed)
REFERENCES BREED(BreedName)
ON UPDATE CASCADE;
ALTER TABLE PET_3
ADD CONSTRAINT PET_3_BREED_FK FOREIGN KEY(PetBreed)
REFERENCES BREED(BreedName)
ON UPDATE CASCADE;

SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER
WHERE OwnerID IN
(SELECT OwnerID
 FROM PET_3
 WHERE PetBreed IN
(SELECT BreedName
 FROM BREED
 WHERE AverageLifeExpectancy > 15));

 SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER JOIN PET_3
ON PET_OWNER.OwnerID = PET_3.OwnerID
WHERE PetName = 'Teddy' and PetType = 'Cat';

/*Q34*/
SELECT DISTINCT OwnerLastName, OwnerFirstName, OwnerEmail
FROM (PET_OWNER as PO JOIN PET_3 as P
ON PO.OwnerID = P.OwnerID)
JOIN BREED as B
ON P.PetBreed = B.BreedName
WHERE AverageLifeExpectancy > 15;

/*Q35*/
SELECT OwnerLastName, OwnerFirstName,
PetName, PetType, PetBreed,
AverageLifeExpectancy
FROM PET_OWNER JOIN PET_3
ON PET_OWNER.OwnerID = PET_3.OwnerID
JOIN BREED
ON PET_3.PetBreed = BREED.BreedName
WHERE PetBreed <> 'Unknown';

/*Q37*/
INSERT INTO PET_OWNER (OwnerLastName, OwnerFirstName, OwnerPhone,
OwnerEmail) VALUES('Rogers', 'Jim', '555-232-3456', 'Jim.Rogers@somewhere.com');
INSERT INTO PET_OWNER (OwnerLastName, OwnerFirstName, OwnerPhone,
OwnerEmail) VALUES('Keenan', 'Mary', '555-232-4567', 'Mary.Keenan@somewhere.com');
INSERT INTO PET_OWNER (OwnerLastName, OwnerFirstName, OwnerPhone,
OwnerEmail) VALUES('Melnik', 'Nigel', '555-232-5678', 'Nigel.Melnik@somewhere.com');
INSERT INTO PET_OWNER (OwnerLastName, OwnerFirstName, OwnerPhone)
  VALUES('Mayberry', 'Jenny', '555-454-1243');
INSERT INTO PET_OWNER (OwnerLastName, OwnerFirstName, OwnerPhone)
  VALUES('Roberts', 'Ken', '555-454-2354');
INSERT INTO PET_OWNER (OwnerLastName, OwnerFirstName, OwnerPhone)
  VALUES('Taylor', 'Sam', '555-454-3465');

/*Q38*/
/*  Make change to BREED, which cascades to PET  */
UPDATE BREED
SET BreedName = 'Poodle, Std.'
WHERE BreedName = 'Std. Poodle';
/*  Show revised contents of tables  */
SELECT * FROM BREED;
SELECT * FROM PET_3;

/*Q40*/
DELETE
FROM PET_3
WHERE PetType = 'Anteater';

/*Q41*/
ALTER TABLE PET
ADD PetWeight Numeric(4,1) NULL;
SELECT * FROM PET;

/*Q42*/
SELECT PetID, PetWeight
FROM PET_3;

UPDATE PET
SET PetWeight = 25.5
WHERE PetID = 1;
UPDATE PET
SET PetWeight = 10.5
WHERE PetID = 2;
UPDATE PET
SET PetWeight = 28.5
WHERE PetID = 3;
UPDATE PET
SET PetWeight = 20.0
WHERE PetID = 4;
UPDATE PET
SET PetWeight = 9.5
WHERE PetID = 5;
UPDATE PET
SET PetWeight = 9.5
WHERE PetID = 6;
UPDATE PET
SET PetWeight = 25.0
WHERE PetID = 7;

SELECT * FROM PET;
