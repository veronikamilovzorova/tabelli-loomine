CREATE TABLE roomtype (
    roomtypeID INT PRIMARY KEY identity(1,1),
    description VARCHAR(80),
    maxcapacity INT
);

INSERT INTO roomtype (description, maxcapacity)
VALUES
    ( 'Single', 1),
    ( 'Double', 2),
    ( 'Family ', 4),
    ( 'Exclusive', 3),
    ( 'Double exclusive', 6);

	SELECT * FROM roomtype;

	CREATE TABLE rooom (
	rooomID int primary key identity(1,1),
	number varchar(10),
	name varchar(40),
	status varchar(10),
	smoke varchar(10) not null,
	roomtypeID INT,
	FOREIGN KEY (roomtypeID) REFERENCES roomtype(roomtypeID)
);

INSERT INTO rooom (number, name, status, smoke, roomtypeID)
VALUES
    ( '101', 'Single Room', 'Available', 'No', 1),
    ( '202', 'Double Room', 'Available', 'No', 2),
    ( '305', 'Suite', 'Occupied', 'No', 3),
    ( '410', 'Executive Suite', 'Available', 'No', 4),
    ( '501', 'Family Room', 'Occupied', 'No', 5);

SELECT * FROM rooom;

CREATE TABLE logi(
ID int PRIMARY KEY identity(1,1),
andmed TEXT,
kuupaev datetime,
kasutaja varchar(100)
)

CREATE TRIGGER roommlisamine
ON rooomm
FOR INSERT
AS
BEGIN
    INSERT INTO logi (kuupaev, andmed, kasutaja)
    SELECT GETDATE(),
           CONCAT(rt.descriptionn, ', ', r.numberr),
           USER
    FROM inserted AS i
    INNER JOIN rooomm AS r ON i.rooommID = r.rooommID
    INNER JOIN roommtype AS rt ON r.roommtypeID = rt.roommtypeID;
END;

INSERT INTO rooomm (numberr, namee, statuss, smokee, roommtypeID)
VALUES
( '503', 'Dog Room', 'Occupied', 'No', 1);
