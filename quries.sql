-- Retrieve complete booking details with user, movie, theatre, and timing
SELECT u.name, m.title, t.name AS theatre, s.show_time, b.seats
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
JOIN Theatres t ON s.theatre_id = t.theatre_id;


-- Calculate total seats booked per movie
SELECT m.title, SUM(b.seats) AS total_seats
FROM Bookings b
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
GROUP BY m.title;


-- Find the most popular movie based on seats booked
SELECT m.title, SUM(b.seats) AS total
FROM Bookings b
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
GROUP BY m.title
ORDER BY total DESC
LIMIT 1;


-- Count total bookings made by each user
SELECT u.name, COUNT(b.booking_id) AS total_bookings
FROM Users u
JOIN Bookings b ON u.user_id = b.user_id
GROUP BY u.name
ORDER BY total_bookings DESC;

-- ADVANCED SQL QUERIES

-- 1. Movies with more than 3 seats booked
SELECT m.title, SUM(b.seats) AS total_seats 
FROM Bookings b
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
GROUP BY m.title 
HAVING SUM(b.seats) > 3;


-- 2. User who booked the maximum number of seats
SELECT u.name, SUM(b.seats) AS total_seats
FROM Users u
JOIN Bookings b ON u.user_id = b.user_id
GROUP BY u.name
ORDER BY total_seats DESC
LIMIT 1;


-- 3. Movies longer than average duration
SELECT title, duration
FROM Movies
WHERE duration > (
    SELECT AVG(duration)
    FROM Movies
);


-- 4. Total revenue generated per movie (₹200 per seat)
SELECT m.title, SUM(b.seats * 200) AS revenue 
FROM Bookings b
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
GROUP BY m.title;


-- 5. Classify bookings based on number of seats
SELECT booking_id, seats,
    CASE
        WHEN seats >= 5 THEN 'Large Booking'
        WHEN seats >= 3 THEN 'Medium Booking'
        ELSE 'Small Booking'
    END AS booking_type
FROM Bookings;


-- 6. Theatre hosting the maximum number of shows
SELECT t.name, COUNT(s.show_id) AS total_shows
FROM Theatres t
JOIN Shows s ON t.theatre_id = s.theatre_id
GROUP BY t.name
ORDER BY total_shows DESC
LIMIT 1;


-- 7. Users who have not made any bookings
SELECT u.name
FROM Users u
LEFT JOIN Bookings b ON u.user_id = b.user_id
WHERE b.booking_id IS NULL;


-- 8. Create a view for booking summary
CREATE VIEW BookingSummary AS
SELECT u.name, m.title, b.seats
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id;


-- 9. Retrieve data from the view
SELECT * FROM BookingSummary;
