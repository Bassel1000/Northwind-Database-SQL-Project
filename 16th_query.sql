USE Northwind
--16-Write a T-SQL script to generate a monthly sales report and store it in a new table.
-- Create the monthly sales report table
CREATE TABLE MonthlySalesReport (
    ReportMonth DATE,
    TotalOrders INT,
    TotalSales DECIMAL(18,2)
);

-- Insert monthly sales data
INSERT INTO MonthlySalesReport (ReportMonth, TotalOrders, TotalSales)
SELECT 
    DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS ReportMonth,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1)
ORDER BY ReportMonth;


SELECT * FROM MonthlySalesReport;