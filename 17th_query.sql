USE Northwind
--17-Modify the stored procedure from task 15 to include error handling for invalid date ranges.
CREATE PROCEDURE GetSalesReport
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    BEGIN TRY
        IF @StartDate > @EndDate
            THROW 50000, 'Start date must be earlier than or equal to end date.', 1;
        SELECT 
            o.OrderID,
            o.OrderDate,
            c.CompanyName AS CustomerName,
            p.ProductName,
            od.Quantity,
            od.UnitPrice,
            od.Quantity * od.UnitPrice AS TotalAmount
        FROM Orders AS o
        JOIN Customers AS c ON o.CustomerID = c.CustomerID
        JOIN [Order Details] AS od ON o.OrderID = od.OrderID
        JOIN Products AS p ON od.ProductID = p.ProductID
        WHERE o.OrderDate BETWEEN @StartDate AND @EndDate
        ORDER BY o.OrderDate;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;

Declare @StartDate Date = '01-01-1998';
Declare @EndDate Date = '01-01-1997';

exec GetSalesReport @startDate, @EndDate;