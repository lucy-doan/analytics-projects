----CHANGE DATA TYPES AND HANDLE BAD DATA----


----Change Data Type of second dataset

ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].HHIncome
ALTER COLUMN Zip VARCHAR(50) NOT NULL 

ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].HHIncome
ALTER COLUMN Median INTEGER

ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].HHIncome
ALTER COLUMN Mean INTEGER

ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].HHIncome
ALTER COLUMN Pop INTEGER



----Change Data Type of first dataset

ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
ALTER COLUMN street VARCHAR(50) NOT NULL	--Convert the desired PK column "street" from nullable to not null, so that we can assign primary key to this field later on 

ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
ALTER COLUMN latitude FLOAT

ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
ALTER COLUMN longitude FLOAT

ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
ALTER COLUMN baths INTEGER

ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
ALTER COLUMN sq__ft INTEGER

ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
ALTER COLUMN price INTEGER

ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
ALTER COLUMN beds INTEGER	--We cannot convert data type of "beds" field to integer because there is one varchar value in this field



----Handling varchar value ("F") in "beds" field

--Calculate median value of beds field

SELECT *, (lowervalue + highervalue)/2 AS Median_beds
FROM 
	(
	SELECT MAX(beds)*1.0 AS lowervalue
	FROM (
		SELECT TOP 50 PERCENT * 
		FROM Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
		WHERE beds <> 'F'
		ORDER BY beds
		) AS lowerhalf
	) AS p1
,
	(
	SELECT MIN(beds)*1.0 AS highervalue
	FROM (
		SELECT TOP 50 PERCENT * 
		FROM Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
		WHERE beds <> 'F'
		ORDER BY beds DESC
		) AS upperhalf
	) AS p2


--Now replace the "F" value in "beds" field with the median (3)
UPDATE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
SET beds = 3
WHERE street  =
(SELECT street
FROM Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
WHERE beds = 'F')

--Now that all values in "beds" field are integer, let's convert its data type to integer
ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
ALTER COLUMN beds INTEGER



--Convert the sale_date field to datetime type

ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
ADD sell_date AS (CONVERT(datetime, SUBSTRING(sale_date, 5, 6) + ' ' 
      + RIGHT(sale_date, 4) + ' ' + SUBSTRING(sale_date, 12, 8)))


ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
ADD saledate datetime

UPDATE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
SET saledate = sell_date

ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
DROP COLUMN sell_date

ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
DROP COLUMN sale_date


USE Student_FS2020;  
GO  
EXEC sp_rename '[UM-AD\ptd9pk].SacRealEstate.saledate', 'sale_date', 'COLUMN';  
GO  
