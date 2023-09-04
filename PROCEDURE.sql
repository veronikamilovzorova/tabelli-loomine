

--Protseduurid - tabel - guest

CREATE TABLE gguestt (
    gguesttID INT PRIMARY KEY identity(1,1),
    first_name VARCHAR(80),
    last_name VARCHAR(80),
    member_since DATE
);
-----------------------------------
--ANdmete lisamine ja SELECT
CREATE PROCEDURE lisagguestt
@fname varchar(100),
@lname varchar(100),
@sinse date
AS
BEGIN
INSERT INTO gguestt(first_name, last_name, member_since)
VALUES (@fname, @lname, @sinse);
SELECT * FROM guest;
select * from logi;
END;
--------------------------------
CREATE PROCEDURE deletegguestt
@ID int
AS
BEGIN
SELECT * from gguestt;
DELETE FROM gguestt
WHERE @ID=gguesttID
SELECT * from gguestt;
SELECT * from logi;
END;
----------------------------
--Andmete uuendamine sisasetatus ID järgi
CREATE PROCEDURE gguesttuuendamine 
@ID int
AS
BEGIN
    UPDATE gguestt
    SET first_name = first_name1,
        last_name = last_name2,
        member_since = member_since3
    WHERE gguesttID = gguesttID;
END;
