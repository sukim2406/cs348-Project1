-- Query1
SELECT Category, COUNT(ProductID) AS NumberOfProducts FROM Product GROUP BY Category ORDER BY NumberOfProducts DESC;

-- Query2
SELECT Category,  ROUND(AVG(ExFactoryPrice),2) AS AveragePrice FROM Product GROUP BY Category ORDER BY AveragePrice DESC;

-- Query3
SELECT P.ProductId, P.ProductName FROM Product P, Company C WHERE P.CompanyId = C.CompanyId AND C.CompanyID IN (SELECT C.CompanyID FROM Company C WHERE C.State ='IN' OR C.State = 'CA') ORDER BY P.ProductID ASC; 

-- Query4
SELECT I.ProductID FROM (SELECT ProductID, SUM(Count) AS TotalCount FROM Orders GROUP BY ProductID ORDER BY ProductID) O, (SELECT ProductID, SUM(TotalStock) as TotTotalStock FROM REtailerInventory Group By ProductID Order By ProductID) I WHERE O.ProductID = I.ProductID AND O.TotalCount > I.TotTotalStock GROUP BY I.ProductID ORDER BY I.ProductID;
SELECT ProductID, SUM(Count) AS TotCount FROM Orders GROUP BY ProductID ORDER BY ProductID;
SELECT ProductID, SUM(TotalStock) as TotTotalStock FROM RetailerInventory GROUP BY ProductID ORDER BY ProductID;


-- Query5


-- Query6


-- Query7


-- Query8


-- Query9


-- Query10

