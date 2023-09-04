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


CREATE TRIGGER guestlisamine
ON guest
FOR INSERT
AS
INSERT INTO logi(kuupaev, kasutaja, andmed, tegevus)
SELECT GETDATE(), USER,
CONCAT(inserted.first_name, ', ', inserted.last_name),
'guest on lisatud'
FROM inserted
--kontroll'

INSERT INTO Guest ( first_name, last_name, member_since)
VALUES
    ('John', 'Doe', '2020-05-15');
SELECT * from guest
SELECT * from logi
