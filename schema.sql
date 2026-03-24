-- Create database and tables for movie booking system

CREATE DATABASE movie_booking;
USE movie_booking;

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    duration INT
);

CREATE TABLE Theatres (
    theatre_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE Shows (
    show_id INT PRIMARY KEY,
    movie_id INT,
    theatre_id INT,
    show_time DATETIME,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (theatre_id) REFERENCES Theatres(theatre_id)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    user_id INT,
    show_id INT,
    seats INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);

SHOW TABLES;

DESC MOVIES;
DESC BOOKINGS;
DESC USERS;
DESC THEATRES;
DESC SHOWS;
