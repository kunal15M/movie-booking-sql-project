# 🎬 Movie Ticket Booking System (SQL Project)

## 📌 Overview

This project is a beginner-friendly yet professional implementation of a relational database system for an online movie ticket booking platform (similar to BookMyShow).

It demonstrates core SQL concepts such as database design, table relationships, and real-world query handling.

---

## 🧠 Key Features

* Designed a normalized relational database schema
* Implemented primary and foreign key constraints
* Managed user bookings for movie shows
* Performed complex queries using JOIN operations
* Applied aggregation functions like SUM and GROUP BY
* Supported CRUD operations (Create, Read, Update, Delete)

---

## 🗂️ Database Structure

The database consists of the following tables:

* **Users** → Stores user details
* **Movies** → Contains movie information
* **Theatres** → Stores theatre details
* **Shows** → Links movies and theatres with timings
* **Bookings** → Records ticket bookings

---

## 🔗 Relationships

* A user can make multiple bookings
* A movie can have multiple shows
* A theatre can host multiple shows
* Each booking is linked to a specific show and user

---

## 🔍 Sample Queries

### 1. Retrieve complete booking details

```sql
SELECT u.name, m.title, t.name AS theatre, s.show_time, b.seats
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
JOIN Theatres t ON s.theatre_id = t.theatre_id;
```

### 2. Total seats booked per movie

```sql
SELECT m.title, SUM(b.seats) AS total_seats
FROM Bookings b
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
GROUP BY m.title;
```

### 3. Most popular movie

```sql
SELECT m.title, SUM(b.seats) AS total
FROM Bookings b
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
GROUP BY m.title
ORDER BY total DESC
LIMIT 1;
```

---

## 🛠️ Technologies Used

* SQL (MySQL)

---

## 📁 Project Structure

```
movie-booking-sql-project/
│
├── schema.sql
├── data.sql
├── queries.sql
├── README.md
```

---

## 🚀 How to Run

1. Create the database and tables:

```sql
SOURCE schema.sql;
```

2. Insert sample data:

```sql
SOURCE data.sql;
```

3. Run queries:

```sql
SOURCE queries.sql;
```

---

## 📌 Future Improvements

* Add seat availability tracking
* Implement payment system
* Introduce stored procedures and triggers

---

## 👨‍💻 Author

Kunal Mohnani

---

🚧 Project in progress – advanced features coming soon.
