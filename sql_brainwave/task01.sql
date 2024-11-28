create database libray;
use libray;
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Role ENUM('Member', 'Staff') DEFAULT 'Member',
    JoinDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO Users (FullName, Email, Role, JoinDate) 
VALUES 
('John Doe', 'john.doe@example.com', 'Member', '2024-11-26'),
('Jane Smith', 'jane.smith@example.com', 'Member', '2024-11-20'),
('Michael Brown', 'michael.brown@example.com', 'Staff', '2024-11-15'),
('Emily Davis', 'emily.davis@example.com', 'Member', '2024-11-10'),
('Daniel Wilson', 'daniel.wilson@example.com', 'Staff', '2024-11-01');
select * from Users;

SELECT FullName, Email FROM Users;



SELECT * FROM Users 
WHERE JoinDate > '2024-11-15';



INSERT INTO Users (FullName, Email, Role, JoinDate) 
VALUES ('Sara Lee', 'sara.lee@example.com', 'Member', '2024-11-25');

SELECT * FROM Users ;



CREATE TABLE Book (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255),
    ISBN VARCHAR(13) UNIQUE,
    Publisher VARCHAR(255),
    Genre VARCHAR(100),
    CopiesAvailable INT DEFAULT 0,
    TotalCopies INT DEFAULT 0
);

INSERT INTO Book (Title, Author, ISBN, Publisher, Genre, CopiesAvailable, TotalCopies) 
VALUES 
('The Catcher in the Rye', 'J.D. Salinger', '9780316769488', 'Little, Brown and Company', 'Fiction', 5, 10),
('The Hobbit', 'J.R.R. Tolkien', '9780345339683', 'Houghton Mifflin Harcourt', 'Fantasy', 3, 7),
('The Alchemist', 'Paulo Coelho', '9780061122415', 'HarperOne', 'Adventure', 4, 8),
('Brave New World', 'Aldous Huxley', '9780060850524', 'HarperPerennial', 'Dystopian', 6, 12),
('The Road', 'Cormac McCarthy', '9780307387899', 'Alfred A. Knopf', 'Post-apocalyptic', 2, 5);
select * from Book;
SELECT Title, Author, Genre FROM Book;

SELECT * FROM Book
WHERE Genre = 'Fantasy';

SELECT * FROM Book
WHERE CopiesAvailable > 5;
SELECT * FROM Book
ORDER BY Title ASC;

SELECT * FROM Book
WHERE CopiesAvailable < TotalCopies;
SELECT * FROM Book
WHERE ISBN = '9780316769488';


CREATE TABLE Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    BookID INT NOT NULL,
    IssueDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FineAmount DECIMAL(5,2) DEFAULT 0.00,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);


SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO Transactions (UserID, BookID, DueDate, ReturnDate, FineAmount) 
VALUES 
(1, 1, '2024-12-10', '2024-12-08', 100.00),   
(2, 2, '2024-12-15', NULL, 0.00),           
(3, 3, '2024-12-12', '2024-12-12', 50.00),   
(4, 4, '2024-12-05', '2024-12-10', 110.00),  
(5, 5, '2024-12-18', NULL, 200.00);

SET FOREIGN_KEY_CHECKS = 1;

select * from Transactions;

CREATE TABLE Reservations (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    BookID INT NOT NULL,
    ReservationDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO Reservations (UserID, BookID) 
VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5);

SET FOREIGN_KEY_CHECKS = 1;
select * from Reservations;

SHOW TABLES;


