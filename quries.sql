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
