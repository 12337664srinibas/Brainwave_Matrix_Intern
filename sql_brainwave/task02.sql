Create database developement;
use developement;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT
);

INSERT INTO Products (ProductName, Category, Price, Stock) 
VALUES 
('Wireless Mouse', 'Electronics', 25.99, 100),
('Keyboard', 'Electronics', 49.99, 50),
('Smartphone', 'Electronics', 699.00, 30),
('Laptop', 'Electronics', 1200.00, 20),
('Python Programming Book', 'Books', 35.50, 200),
('Earbuds', 'Electronics', 55.00, 150);
select * from Products;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) 
VALUES 
('John', 'Doe', 'john.doe@gmail.com', '1234567890', '123 Elm Street, Springfield'),
('Jane', 'Smith', 'jane.smith@gmail.com', '9876543210', '456 Maple Avenue, Riverside'),
('Robert', 'Brown', 'robert.brown@gmail.com', '5678901234', '789 Oak Road, Greenfield'),
('Emily', 'Davis', 'emily.davis@gmail.com', '6789012345', '321 Pine Lane, Brookside'),
('Michael', 'Wilson', 'michael.wilson@gmail.com', '4567890123', '654 Cedar Court, Hillview'),
('Sarah', 'Taylor', 'sarah.taylor@gmail.com', '2345678901', '987 Birch Boulevard, Lakewood');
select * from Customers;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    PaymentMethod VARCHAR(50),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


