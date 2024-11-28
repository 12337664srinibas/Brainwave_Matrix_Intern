# Library Management System 📚

A **Library Management System** designed to manage book inventories, user records, and borrowing activities. This project emphasizes efficient database management and querying using **SQL** for backend operations, ensuring data integrity and optimized performance.

---

## Features ✨
- **Book Management**: Add, update, delete, and search for books.
- **User Management**: Manage library members and their borrowing history.
- **Borrowing System**: Track issued and returned books.
- **Fine Calculation**: Calculate fines for late returns based on due dates.
- **Reports**: Generate reports on book usage, borrowing history, and member activities.

## Role: SQL Intern 🎓
As an SQL Intern, your primary focus is on:
- **Database Design**: Structuring the database schema to ensure normalization and avoid redundancy.
- **Query Optimization**: Writing and optimizing SQL queries for faster performance.
- **Data Integrity**: Implementing constraints and triggers to maintain consistency.
- **Stored Procedures & Functions**: Developing reusable SQL scripts for core operations.

## Technologies Used 🛠️
 **Database**: MySQL
  **Tools**: SQL Workbench

  ## Database Structure 🗄️
  ### Tables:
- **Books**: Stores details about each book.
- **User** : Stores details about each users.
- **Transaction** :
    - **Fields Explanation** :
         TransactionID: Unique identifier for each transaction.
         UserID: Foreign key linking to the Users table.
         BookID: Foreign key linking to the Books table.
        IssueDate: The date when the book was issued.
        DueDate: The due date for returning the book.
        ReturnDate: The actual date the book was returned.
       FineAmount: Any applicable fine for late return.
       TransactionType: Indicates whether the transaction is for issuing or returning a book.

- **Reservations** :
         **Fields Explanation** :
                   ReservationID: Unique identifier for each reservation.
                   UserID: Foreign key linking to the Users table, identifying who made the reservation.
                   BookID: Foreign key linking to the Books table, identifying the reserved book.
                   ReservationDate: The date when the reservation was made. Defaults to the current date.
                   ExpirationDate: The date until which the reservation is valid.
                   Status: Indicates the current status of the reservation (e.g., pending, completed, or canceled).
