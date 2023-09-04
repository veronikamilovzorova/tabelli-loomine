CREATE TABLE rooom (
	RooomID int primary key identity(1,1),
	number varchar(10),
	name varchar(40),
	status varchar(10),
	smoke varchar(10))

NSERT INTO rooom (number, name, status, smoke)
VALUES
    ('101', 'Single Room', 'Available', 'True')
------------------------------
CREATE TRIGGER rooomlisamine
ON rooom
FOR INSERT
AS
INSERT INTO logi(kuupaev, kasutaja, andmed, tegevus)
SELECT GETDATE(), USER,
CONCAT(inserted.number, ', ', inserted.name, ', ', inserted.status, ', ', inserted.smoke),
'rooom on lisatud'
FROM inserted
---------------------------------
CREATE TRIGGER rooomkustutamine
ON rooom
FOR DELETE
AS
INSERT INTO logi(kuupaev, kasutaja, andmed, tegevus)
SELECT GETDATE(), USER,
CONCAT(deleted.number, ', ', deleted.name, ', ', deleted.status, ', ', deleted.smoke),
'guest on kustutatud'
FROM deleted
--kontroll'

DELETE FROM guest WHERE guestID=2
SELECT * from guest
SELECT * from logi
----------------------------------

CREATE TRIGGER rooomuuendamine
ON rooom
FOR UPDATE
AS
INSERT INTO logi(kuupaev, kasutaja, andmed, tegevus)
SELECT GETDATE(), USER,
CONCAT('VANAD - ',
deleted.number, 
', ', deleted.name,
', ', deleted.status,
', ', deleted.smoke,
' UUED - ', 
inserted.number, 
', ',
inserted.name),
', ',
inserted.status),
', ',
inserted.smoke),
'rooom on uuendatud'

FROM deleted INNER JOIN inserted
ON deleted.rooomID=inserted.rooomID

INSERT INTO rooom ( number, name, status, smoke)
VALUES('101', 'Single Room', 'Available', 'True')



SELECT * from guest;
UPDATE first_name='Luca';
WHERE guestID=2;
SELECT * from guest;
SELECT * from logi;
