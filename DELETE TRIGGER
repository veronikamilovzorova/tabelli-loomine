CREATE TABLE Guest (
    guestID INT PRIMARY KEY identity(1,1),
    first_name VARCHAR(80),
    last_name VARCHAR(80) null,
    member_since DATE
);

CREATE TABLE logi(
    id int PRIMARY KEY identity (1,1),
    kuupaev datetime,
    kasutaja varchar(100),
    andmed TEXT,
	tegevus varchar(100)) 

CREATE TRIGGER guestkustutamine
ON guest
FOR DELETE
AS
INSERT INTO logi(kuupaev, kasutaja, andmed, tegevus)
SELECT GETDATE(), USER,
CONCAT(deleted.first_name, ', ', deleted.last_name),
'guest on kustutatud'
FROM deleted
--kontroll'

DELETE FROM guest WHERE guestID=1
SELECT * from guest
SELECT * from logi
