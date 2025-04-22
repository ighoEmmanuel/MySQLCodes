use lagosridesharing;


-- SECTION A--  
CREATE TABLE TopDrivers AS SELECT * FROM Drivers ORDER BY Rating DESC LIMIT 5;

CREATE TABLE HighestRide AS
SELECT ri.RiderID, COUNT(*) AS rides
FROM Rides r
JOIN Riders ri ON r.RiderID = ri.RiderID
WHERE ri.City = "Lagos"
GROUP BY ri.RiderID
HAVING COUNT(*) > 5;

select * from highestride;


CREATE TABLE Driver_Name_Revenue(DriverID INT, Name VARCHAR(50), Revenue INT);
	INSERT INTO Driver_Name_Revenue(DriverID, Name, Revenue) SELECT d.DriversId, d.Name, r.Fare FROM Drivers d JOIN Rides r
ON d.DriversId = r.DriverID;
	CREATE TABLE Drivers_Total_Revenue AS SELECT DriverID, Name, SUM(Revenue) AS Total_Revenue FROM Driver_Name_Revenue GROUP BY DriverID, Name;
	CREATE TABLE Highest_Revenue_Driver(Driver INT, Name VARCHAR(50), TotalRevenue INT);
	 INSERT INTO Highest_Revenue_Driver SELECT DriverID, Name, Total_revenue FROM Drivers_Total_Revenue WHERE Total_Revenue = (SELECT MAX(Total_Revenue) FROM Drivers_Total_Revenue);

CREATE TABLE Rides_Outliers AS WITH Fare_Stats AS (SELECT AVG(Fare) AS Average_Fare, AVG(Fare) * 1.5 AS FiftyPercentAboveAvg, AVG(Fare) * 0.5 AS FiftyPercentBelowAvg  FROM Rides) SELECT r.RideID, r.Fare, ROUND(fs.Average_Fare, 2) AS AverageFare, CASE WHEN  r.Fare > fs.FiftyPercentAboveAvg THEN 'Greater' WHEN r.Fare > fs.FiftyPercentBelowAvg THEN 'Lesser' END AS Status FROM Rides r CROSS JOIN Fare_Stats fs WHERE r.Fare > fs.FiftyPercentAboveAvg OR r.Fare < fs.FiftyPercentBelowAvg;

CREATE TABLE Low_Rate AS
    SELECT
     r.RideID,
	rd.Name,
    r.Rating AS Average_Rating
    FROM Rides r
    JOIN Riders rd ON r.RiderID = rd.RiderID WHERE  r.Rating < 3;