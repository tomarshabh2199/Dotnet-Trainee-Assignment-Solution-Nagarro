USE AdventureWorks2012

--FUNCTION
GO
CREATE FUNCTION Sales.uf_getProducts(@SalesOrderID int, @CurrencyCode nchar(3) ,@CurrencyRateDate datetime)
    RETURNS TABLE 
AS
    RETURN
    WITH Products
    AS (
        SELECT *FROM Sales.SalesOrderDetail AS sod 
        WHERE sod.SalesOrderID = @SalesOrderID
    )
    SELECT p.ProductID, p.OrderQty, p.UnitPrice, p.UnitPrice*scr.EndOfDayRate AS 'Converted Price'
    FROM Products AS p, Sales.CurrencyRate AS scr
    WHERE scr.ToCurrencyCode = @CurrencyCode
        AND scr.CurrencyRateDate = @CurrencyRateDate
GO
--Execution
SELECT * FROM Sales.uf_getProducts(43659, 'CNY', '2011-06-01 00:00:00.000');