-- Start of Module 1 (Module I)
CREATE DATABASE DATA9401_DML_DDL

USE DATA9401_DML_DDL

CREATE TABLE Students (
	StudentID int,
	LastName varchar(255),
	FirstName varchar(255),
	Address varchar(255),
	GPA numeric(2,2)
)

DROP TABLE Students

CREATE TABLE Students (
	StudentID varchar(255),
	LastName varchar(255),
	FirstName varchar(255),
	Address varchar(255),
	GPA numeric(3,2)
	);

INSERT INTO Students (
		StudentID,
		LastName,
		FirstName,
		Address,
		GPA
		)
	VALUES (
		'S9675',
		'Bunny',
		'Easter',
		'The Den',
		3.80
		);

INSERT INTO Students (
		StudentID,
		LastName,
		FirstName,
		Address,
		GPA
		)
	VALUES (
		'S9665',
		'Claus',
		'Santa',
		'North Pole',
		2.50
		);

INSERT INTO Students (
		StudentID,
		LastName,
		FirstName,
		Address,
		GPA
		)
	VALUES (
		'S9668',
		'Claus',
		'Missy',
		'North Pole',
		4.00
		);

INSERT INTO Students (
		StudentID,
		LastName,
		FirstName,
		Address,
		GPA
		)
	VALUES (
		'S9788',
		'Skellington',
		'Jack',
		'Spookyville',
		1.60
		);

INSERT INTO Students (
		StudentID,
		LastName,
		FirstName,
		Address,
		GPA	
		)
	VALUES (
	'S8645',
	'Cheeto',
	'The Human',
	'Delusion Central',
	6.66
	);

ALTER TABLE Students
	ALTER COLUMN LastName varchar(255) NOT NULL;


ALTER TABLE Students	
	ALTER COLUMN StudentID varchar(255) NOT NULL;

-- Attribute must be made NOT NULL before PRIMARY KEY constraint can be applied --
ALTER TABLE Students
	ADD PRIMARY KEY (StudentID);

ALTER TABLE Students	
	ALTER COLUMN Address varchar(255) NOT NULL;

CREATE TABLE NewEnroll2021_02 (
	StudentID varchar(255) PRIMARY KEY,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	Address varchar(255) NOT NULL
	);

SELECT * FROM NewEnroll2021_02

-- Testing PRIMARY KEY mistake and NULL value for FirstName --
-- Statement was terminated when duplicate entry into StudentID was attempted --
INSERT INTO NewEnroll2021_02 (
		StudentID, LastName, FirstName, Address)
	VALUES('S12345','Bird','Big','Sesame Street'),
		('S12346','The Grouch','Oscar','Sesame Street'),
		('S12347','Elmo','','Sesame Street'),
		('S12348','Monster','Cookie','Sesame Street'),
		('S12349','The Count','','Sesame Street');

SELECT * FROM NewEnroll2021_02;

-- Testing no entry for StudentID --
-- StudentID value required as the Attribute has the constraint NOT NULL --
-- Testing out of order insertion --
-- Out of order insertion works. Follows the order in the INSERT INTO command --
INSERT INTO NewEnroll2021_02(
		LastName,StudentID,FirstName,Address)
	VALUES('The Frog','S23456','Kermit', 'Muppet Town');

INSERT INTO Students(
		StudentID,LastName,FirstName,Address)
	SELECT * FROM NewEnroll2021_02
	WHERE Address = 'Muppet Town'

SELECT * FROM Students;

INSERT INTO Students(
		StudentID,LastName,FirstName,Address)
	SELECT * FROM NewEnroll2021_02
	WHERE Address = 'Sesame Street';

-- Add GPA for Kermit --
UPDATE Students
	SET GPA = 3.94
	Where StudentID = 'S23456';

-- Count of cheaters --
SELECT COUNT(GPA) As 'Cheaters!'
	FROM Students
	WHERE GPA>4.00

-- View Cheaters --
SELECT LastName, FirstName, GPA FROM Students
	Where GPA > 4.00

-- Using MAX command to find the Highest GPA --
SELECT MAX(GPA) AS 'Highest GPA'
	FROM Students;

-- Selecting the top three students by GPA --
SELECT TOP 3 * FROM Students
	ORDER BY GPA DESC;

-- Selecting the bottom 25% of students that have grades (IS NOT NULL) --
SELECT TOP 25 PERCENT * FROM Students
	WHERE GPA IS NOT NULL
	ORDER BY GPA ASC;	

-- Set all cheating grades to 0.00 --
UPDATE Students
	SET GPA = 0.00
	WHERE GPA > 4.00;

-- Delete command removed from script, but it works fine --
-- DELETE FROM Students
-- 	WHERE StudentID = 'S8645'

-- Average GPA, excluding cheaters AND IS NOT NULL --
-- Average command automatically excludes NULL values --
SELECT AVG(GPA) AS 'Average GPA'
	FROM Students
	WHERE GPA < 4.00

-- Add column to table --
ALTER TABLE Students
	ADD Referer varchar(255)

-- Drop added column --
ALTER TABLE Students
	DROP COLUMN Referer

-- Set blank fields to NULL --
UPDATE Students
	SET FirstName = Null
	WHERE FirstName = ''

-- Set FirstName NULL fields to '' --
UPDATE Students
	SET FirstName = ''
	WHERE FirstName IS NULL

-- Set GPA NULL fields to 0 --
Update Students
	SET GPA = 0
	WHERE GPA IS NULL

SELECT * FROM Students
	ORDER BY GPA DESC;