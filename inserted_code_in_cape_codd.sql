USE commerce;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(40) NOT NULL,
    user_age INT NOT NULL,
    e_mail VARCHAR(50) UNIQUE NOT NULL,
    user_password VARCHAR(20) NOT NULL
);

CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(30) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL
);

CREATE TABLE order_items (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (UserID) REFERENCES users(user_id)
);

INSERT INTO users (user_name, user_age, e_mail, user_password)
VALUES ('emma', 30, 'ighoe571@gmail.com', 'Emma2666@');

INSERT INTO product (product_name, Price, StockQuantity)
VALUES ('beans', 7000.00, 5);

INSERT INTO order_items (UserID, OrderDate, TotalAmount, Status)
VALUES (1, '2025-12-15 00:00:00', 7000.00, 'shipping');

SELECT * FROM users;