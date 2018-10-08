-- Query1
SELECT Category, COUNT(ProductID) AS NumberOfProducts FROM Product GROUP BY Category ORDER BY NumberOfProducts DESC;

-- Query2
SELECT Category,  ROUND(AVG(ExFactoryPrice),2) AS AveragePrice FROM Product GROUP BY Category ORDER BY AveragePrice DESC;

-- Query3
SELECT P.ProductId, P.ProductName FROM Product P, Company C WHERE P.CompanyId = C.CompanyId AND C.CompanyID IN (SELECT C.CompanyID FROM Company C WHERE C.State ='IN' OR C.State = 'CA'); 

-- Query4


-- Query5


-- Query6


-- Query7


-- Query8


-- Query9


-- Query10

