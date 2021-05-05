USE AdventureWorks2008R2;


SELECT COUNT(*) AS 'No. of Records'
FROM Sales.SalesPerson;

 

SELECT FirstName ,LastName 
FROM Person.Person
WHERE FirstName LIKE 'B%';

 

SELECT p.FirstName, p.LastName 
FROM Person.Person AS p, HumanResources.Employee AS e
WHERE e.BusinessEntityID = p.BusinessEntityID 
    AND e.JobTitle IN ('Design Engineer','Tool Designer','Marketing Assistant');

 



SELECT Name, Color 
FROM Production.Product
WHERE [Weight] = (SELECT MAX([Weight]) FROM Production.Product);

 


SELECT [Description], COALESCE(MaxQty, 0.00)   
FROM Sales.SpecialOffer;

 

SELECT AVG(AverageRate) AS 'Average Exchange Rate'
FROM Sales.CurrencyRate
WHERE FromCurrencyCode = 'USD' 
    AND ToCurrencyCode = 'GBP' 
    AND YEAR(CurrencyRateDate) = 2005;

 



SELECT ROW_NUMBER() OVER(ORDER BY FirstName, LastName) AS 'Sr. No.', FirstName, LastName
FROM Person.Person
WHERE FirstName LIKE '%ss%';

 

 


SELECT BusinessEntityID AS 'SalesPersonID',
    CASE
        WHEN CommissionPct = 0.0 then 'BAND 0'
        WHEN CommissionPct > 0.0 AND CommissionPct <=0.01 then 'BAND 1'
        WHEN CommissionPct > 0.01 AND CommissionPct <=0.015 then 'BAND 2'
        WHEN CommissionPct > 0.015 then 'BAND 3'
        END AS 'Commission Band'
FROM Sales.SalesPerson;

 


DECLARE @ID int;
SELECT @ID = BusinessEntityID 
FROM Person.Person 
WHERE FirstName = 'Ruth' 
    AND LastName = 'Ellerbrock'
    AND PersonType = 'EM';
EXEC dbo.uspGetEmployeeManagers @BusinessEntityID = @ID;

 


SELECT MAX(dbo.ufnGetStock(ProductID)) FROM Production.Product;