-- Insert sample data for testing

INSERT INTO Users (user_id, name, email)
VALUES 
	(1, 'Kunal', 'kunal@email.com'),
	(2, 'Hitesh' , 'hitesh@email.com'),
	(3, 'Anushka' , 'anushka@email.com'),
	(4 , 'Awinash', 'awinash@email.com'),
	(5, 'Ayan' , 'ayan@email.com');
    
select * from Users;

INSERT INTO Movies VALUES (1, 'Avengers', 'Action', 180);
INSERT INTO Movies VALUES (2, 'Interstellar', 'Sci-Fi', 169);

INSERT INTO Theatres VALUES (1, 'PVR Jaipur', 'Jaipur');
INSERT INTO Theatres VALUES (2, 'INOX Delhi', 'Delhi');

INSERT INTO Shows VALUES (1, 1, 1, '2026-03-25 18:00:00');
INSERT INTO Shows VALUES (2, 2, 2, '2026-03-25 20:00:00');

INSERT INTO Bookings (booking_id, user_id , show_id , seats)
VALUES 
(1, 1, 1, 2),
(2, 2, 1, 2),
(3, 4, 2, 3),
(4, 3, 2, 5);
select * from movies;
select * from shows;
select * from bookings;
select * from theatres;
