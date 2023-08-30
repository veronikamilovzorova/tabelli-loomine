CREATE TABLE Guest (
    guestID INT PRIMARY KEY,
    first_name VARCHAR(80),
    last_name VARCHAR(80),
    member_since DATE
);

INSERT INTO Guest (guestID, first_name, last_name, member_since)
VALUES
    (1, 'John', 'Doe', '2020-05-15'),
    (2, 'Jane', 'Smith', '2019-11-20'),
    (3, 'Michael', 'Johnson', '2022-02-10'),
    (4, 'Emily', 'Williams', '2021-07-08'),
    (5, 'David', 'Brown', '2023-03-25');

	SELECT * FROM Guest;



CREATE TABLE room_type (
    roomID INT PRIMARY KEY,
    description VARCHAR(80),
    max_capacity INT
);

INSERT INTO room_type (roomID, description, max_capacity)
VALUES
    (1, 'Single', 1),
    (2, 'Double', 2),
    (3, 'Family ', 4),
    (4, 'Exclusive', 3),
    (5, 'Double exclusive', 6);

	SELECT * FROM room_type;




CREATE TABLE reservation (
    reservationID INT PRIMARY KEY,
    date_in DATE,
    date_out DATE,
    made_by VARCHAR(20),
    guestID INT,
    FOREIGN KEY (guestID) REFERENCES Guest(guestID)
);

INSERT INTO reservation (reservationID, date_in, date_out, made_by, guestID)
VALUES
    (1, '2023-09-10', '2023-09-15', 'Alice', 1),
    (2, '2023-08-20', '2023-08-25', 'Bob', 2),
    (3, '2023-10-05', '2023-10-10', 'Charlie', 3),
    (4, '2023-09-01', '2023-09-05', 'David', 4),
    (5, '2023-11-15', '2023-11-20', 'Eve', 5);

SELECT * FROM reservation;


CREATE TABLE reserved_room (
	reservedID INT PRIMARY KEY,
	number_of_rooms int,
	roomID int,
	FOREIGN KEY (roomID) REFERENCES room_type(roomID),
	reservationID INT,
	FOREIGN KEY (reservationID) REFERENCES reservation(reservationID),
	status varchar(20)
);

INSERT INTO reserved_room (reservedID, number_of_rooms, roomID, reservationID, status)
VALUES
    (1, 2, 1, 1, 'Confirmed'),
    (2, 1, 2, 2, 'Confirmed'),
    (3, 1, 3, 3, 'Pending'),
    (4, 2, 4, 4, 'Confirmed'),
    (5, 1, 5, 5, 'Confirmed');

SELECT * FROM reserved_room;

	
CREATE TABLE room (
	RooomID int primary key,
	number varchar(10),
	name varchar(40),
	status varchar(10),
	smoke varchar(10),
	roomID INT,
	FOREIGN KEY (roomID) REFERENCES room_type(roomID)
);

INSERT INTO room (RooomID, number, name, status, smoke, roomID)
VALUES
    (1, '101', 'Single Room', 'Available', 'No', 1),
    (2, '202', 'Double Room', 'Available', 'No', 2),
    (3, '305', 'Suite', 'Occupied', 'No', 3),
    (4, '410', 'Executive Suite', 'Available', 'No', 4),
    (5, '501', 'Family Room', 'Occupied', 'No', 5);

SELECT * FROM room;


CREATE TABLE occupies_room (
ocupiedID int	primary key,
check_in datetime,
check_out datetime,
RooomID int,
FOREIGN KEY (RooomID) REFERENCES room(RooomID),
reservationID INT,
FOREIGN KEY (reservationID) REFERENCES reservation(reservationID)
);


INSERT INTO occupies_room (ocupiedID, check_in, check_out, RooomID, reservationID)
VALUES
    (1, '2023-09-10 14:00:00', '2023-09-15 11:00:00', 1, 1),
    (2, '2023-08-20 15:00:00', '2023-08-25 10:00:00', 2, 2),
    (3, '2023-10-05 12:00:00', '2023-10-10 10:30:00', 3, 3),
    (4, '2023-09-01 13:30:00', '2023-09-05 10:00:00', 4, 4),
    (5, '2023-11-15 14:00:00', '2023-11-20 11:30:00', 5, 5);

SELECT * FROM occupies_room;


CREATE TABLE hosted_at (
hostedID int primary key,
guestID int,
FOREIGN KEY (guestID) REFERENCES Guest(guestID),
ocupiedID int,
FOREIGN KEY (ocupiedID) REFERENCES occupies_room(ocupiedID)
);

INSERT INTO hosted_at (hostedID, guestID, ocupiedID)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5);

SELECT * FROM hosted_at;
