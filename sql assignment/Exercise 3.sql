USE AdventureWorks2008R2;

 

SELECT TOP 5 SalesOrderID, AccountNumber, OrderDate
FROM Sales.SalesOrderHeader
WHERE AccountNumber 
IN (SELECT AccountNumber
    FROM Sales.SalesOrderHeader
    GROUP BY AccountNumber
    HAVING SUM(SubTotal) > 70000)
ORDER BY OrderDate DESC;