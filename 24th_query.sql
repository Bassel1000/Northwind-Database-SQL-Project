USE Northwind
--24-Create a function that returns the total sales amount for a given product. 
CREATE FUNCTION dbo.GetTotalSalesForProduct
(
    @ProductID INT
)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @TotalSales DECIMAL(18,2);

    SELECT @TotalSales = SUM(Quantity * UnitPrice)
    FROM [Order Details]
    WHERE ProductID = @ProductID;

    RETURN ISNULL(@TotalSales, 0);
END;

--See result
SELECT dbo.GetTotalSalesForProduct(5) AS TotalSales;

