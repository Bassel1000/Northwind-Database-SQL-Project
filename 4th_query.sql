USE Northwind
--4-Create a new table to store customer reviews with appropriate data types. Insert sample data into this table. 
CREATE TABLE CustomerReviews (
    CustomerID NCHAR(5) FOREIGN KEY REFERENCES Customers(CustomerID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comments NVARCHAR(MAX),
);

INSERT INTO CustomerReviews (CustomerID, ProductID, Rating, Comments)
VALUES 
('ALFKI', 1, 4, 'Great product!'),
('ANATR', 2, 5, 'Excellent quality and fast delivery.'),
('ANTON', 3, 3, 'Good product but a bit pricey.');

select * from CustomerReviews

