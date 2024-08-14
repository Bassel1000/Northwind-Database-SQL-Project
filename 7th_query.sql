USE Northwind
--7-Calculate the average unit price of products in each category.
SELECT c.CategoryName, AVG(p.UnitPrice) AS AveragePrice
FROM Products AS p
JOIN Categories AS c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;