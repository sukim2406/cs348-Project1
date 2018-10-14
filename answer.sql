-- Query1
SELECT Category, COUNT(ProductID) AS NumberOfProducts FROM Product GROUP BY Category ORDER BY NumberOfProducts DESC;

-- Query2
SELECT Category, TO_CHAR(ROUND(AVG(ExFactoryPrice), 2), '99999999990.00') AS AveragePrice FROM Product GROUP BY Category ORDER BY AveragePrice DESC;


-- Query3
SELECT P.ProductId, P.ProductName FROM Product P, Company C WHERE P.CompanyId = C.CompanyId AND C.CompanyID IN (SELECT C.CompanyID FROM Company C WHERE C.State ='IN' OR C.State = 'CA') ORDER BY P.ProductID ASC; 

-- Query4
SELECT R.RetailerID, X.ProductID, (X.TotSum-I.TotalStock) AS PrepareNumber FROM(SELECT O.ProductID, SUM(O.Count) AS TotSum FROM Orders O WHERE Status='PENDDING' GROUP BY O.ProductID) X, RetailerInventory I, Retailer R WHERE X.ProductID = I.ProductID AND I.RetailerID=R.RetailerID ORDER BY R.RetailerID, X.ProductID ASC;

-- Query5
SELECT B.ProductName, A.NumberOfItemsSold FROM (SELECT ProductID, SUM(Count) AS NumberOfItemsSold FROM Orders GROUP BY ProductID Order By NumberOfItemsSold DESC) A, Product B  WHERE A.ProductID = B.ProductID AND ROWNUM <= 3;  

-- Query6
SELECT B.FirstName, B.LastName, A.TotalAmount FROM (SELECT CustomerID, TO_CHAR(ROUND(SUM(Count * UnitPrice),2), '99999999990.00') AS TotalAmount FROM Orders GROUP BY CustomerID ORDER BY TotalAmount DESC) A, Customer B WHERE A.CustomerID = B.CustomerID AND ROWNUM <= 3;

-- Query7
SELECT O.RetailerID, R.RetailerName, O.NumberOfOrders FROM (SELECT RetailerID, COUNT(OrderID) as NumberOfOrders FROM Orders GROUP BY RetailerID ORDER BY NumberOfOrders DESC) O, Retailer R WHERE O.RetailerID = R.RetailerID AND ROWNUM <=2;

-- Query8
SELECT X.RetailerID, Y.RetailerName, X.NetProfit FROM (SELECT O.RetailerID, TO_CHAR(ROUND(SUM(O.Count*(O.UnitPrice-P.ExFactoryPrice)), 2), '99999999990.00') AS NetProfit FROM Orders O, Product P WHERE O.productID = P.ProductID GROUP BY O.RetailerID ORDER BY NetProfit DESC) X, Retailer Y WHERE X.RetailerID = Y.RetailerID AND ROWNUM <=2;

-- Query9
SELECT Z.CompanyID, C.CompanyName, Z.TotalCount FROM (SELECT Y.CompanyID, SUM(X.TotalCount) AS TotalCount FROM (SELECT O.ProductID, SUM(O.Count) AS TotalCount FROM Orders O, Product P WHERE P.ProductID = O.ProductID GROUP BY O.ProductID ORDER BY TotalCount DESC) X, Product Y WHERE Y.ProductID = X.ProductID GROUP BY Y.CompanyID ORDER BY TotalCount DESC) Z, Company C WHERE Z.CompanyID = C.CompanyID AND ROWNUM <=3;

-- Query10
SELECT Y.RetailerID, R.RetailerName, Y.NumberOfDistinctCustomers FROM (SELECT X.RetailerID, Count(X.CustomerID) AS NumberOfDistinctCustomers FROM (SELECT DISTINCT CustomerID, RetailerID  FROM Orders) X GROUP BY X.RetailerID ORDER BY NumberOfDistinctCustomers DESC) Y, Retailer R WHERE Y.RetailerID = R.RetailerID AND ROWNUM <=2;
