USE AdventureWorks2008R2;

 

--JOINS
SELECT c.CustomerID
FROM Sales.SalesOrderHeader soh
    RIGHT JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
WHERE SalesOrderID IS NULL;

 


--SUB QUERY
SELECT c.CustomerID
FROM Sales.Customer c
WHERE c.CustomerID NOT IN (SELECT CustomerID FROM Sales.SalesOrderHeader);

 


--CTE
WITH CustomersWithoutOrder (CustmerID) 
AS 
(
    SELECT c.CustomerID
    FROM Sales.SalesOrderHeader soh
    RIGHT JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
    WHERE SalesOrderID IS NULL
)
SELECT * FROM CustomersWithoutOrder;
    
--EXIST
SELECT c.CustomerID
FROM Sales.Customer c
WHERE NOT EXISTS (SELECT s.CustomerID 
                FROM Sales.SalesOrderHeader AS s
                WHERE s.CustomerID = c.CustomerID);