----QUESTION 1----

--<A> Average Sales Price of homes for each Zip Code?

SELECT zip, AVG(price) AS Avg_SalesPrice_PerZip
FROM Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
GROUP BY zip



--<B> Zip Code with Highest Ratio of Average Home's Price to Household Median Income

SELECT TOP 10 Avg_HomePrice.zip, Avg_SalesPrice_PerZip, 
			Median AS Median_HHIncome_PerZip,
			ROUND((Avg_SalesPrice_PerZip * 1.0 /Median),2) AS Ratio
FROM (
	SELECT zip, AVG(price) AS Avg_SalesPrice_PerZip
	FROM Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
	GROUP BY zip
	) AS Avg_HomePrice
INNER JOIN Student_FS2020.[UM-AD\ptd9pk].HHIncome AS Median_HHIncome
ON Avg_HomePrice.zip = Median_HHIncome.Zip
ORDER BY Ratio DESC



--<C> Count all the places within 20 miles from the Real Estate Office

--First, calculate distance from each place to the Real Estate Company's address 
---(1315 10TH ST, SACRAMENTO, CA, 95814)
--The Real Estate Company's geometry coordinates are X: -121.494995, Y: 38.576763

SELECT SUM (Count_Within20Miles) AS Count_20Miles_FromOffice
FROM (
	SELECT *, CASE WHEN Distance_Miles <= 20 THEN '1' ELSE 0 END 
AS Count_Within20Miles
	FROM (
		SELECT *, 
			GeoLocation.STDistance(geography::STGeomFromText('POINT
(-121.494995 38.576763)', 4326)) *0.000621371 AS Distance_Miles
		FROM Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
		) AS distance
	) AS within20Miles
