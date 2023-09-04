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

CREATE TRIGGER guestuuendamine
ON guest
FOR UPDATE
AS
INSERT INTO logi(kuupaev, kasutaja, andmed, tegevus)
SELECT GETDATE(), USER,
CONCAT('VANAD - ',
deleted.first_name, 
', ', deleted.last_name,
' UUED - ', 
inserted.first_name, 
', ',
inserted.last_name),
'guest on uuendatud'

FROM deleted INNER JOIN inserted
ON deleted.guestID=inserted.guestID

INSERT INTO Guest ( first_name, last_name, member_since)
VALUES
    ('Bob', 'Dog', '2020-05-15');



SELECT * from guest;
UPDATE first_name='Luca';
WHERE guestID=2;
SELECT * from guest;
SELECT * from logi;
