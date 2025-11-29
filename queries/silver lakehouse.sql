-- get taxi data and join with shortcuts from SQL and storage account
SELECT TOP 100 *
FROM 
    [silver_lakehouse].[dbo].[green_tripdata_2017] AS gtd
INNER JOIN 
    [silver_lakehouse].[dbo].[payments] AS p
    ON gtd.[payment_type] = p.[paymentTypeID]
INNER JOIN 
    [silver_lakehouse].[dbo].[locations] AS loc
    ON gtd.[PULocationID] = loc.[LocationID]


-- Find the most popular destination
SELECT 
	gt.[passenger_count],
	COUNT(*) AS [NrOfTripswithPassengersNr] 
FROM [silver_lakehouse].[dbo].[green_tripdata_2017] as gt
GROUP BY [gt].[passenger_count] 
ORDER BY NrOfTripswithPassengersNr DESC; 


-- get streaming taxi data and join with shortcuts from SQL and storage account
SELECT TOP 100 *
FROM 
    [silver_lakehouse].[dbo].[green_taxi_streaming] AS gtd
INNER JOIN 
    [silver_lakehouse].[dbo].[payments] AS p
    ON gtd.[payment_type] = p.[paymentTypeID]
INNER JOIN 
    [silver_lakehouse].[dbo].[locations] AS loc
    ON gtd.[PULocationID] = loc.[LocationID]