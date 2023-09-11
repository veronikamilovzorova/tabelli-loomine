CREATE TABLE maakond(
maakondID int PRIMARY KEY identity(1,1),
maakond varchar(100))

CREATE TABLE linn(
linnID int PRIMARY KEY identity(1,1),
linn varchar(100),
maakondID int,
FOREIGN KEY (maakondID) REFERENCES maakond(maakondID));

CREATE TABLE logi(
ID int PRIMARY KEY identity(1,1),
andmed TEXT,
kuupaev datetime,
kasutaja varchar(100)
)
