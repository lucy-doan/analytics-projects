----QUESTION 4B - Part 2----


--Assign Primary Key to Zip field in second dataset, HHIncome

ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].HHIncome
ADD PRIMARY KEY (Zip)


----Assign Primary Key to street field in first dataset, SacRealEstate

ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
ADD PRIMARY KEY (street)	--Cannot assign PK to this column because it has duplicate values



----Handling null values in "street" field

--Count all rows in table, distinct rows, and distinct values in street field

SELECT COUNT(street) AS Count_All_Rows, COUNT(DISTINCT street) AS Count_Dist_Street
FROM Student_FS2020.[UM-AD\ptd9pk].SacRealEstate	--Count all rows and distinct values in street column


SELECT COUNT (*) AS Count_Dist_Rows
FROM	(
		SELECT DISTINCT *
		FROM Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
		) AS dist		--Count distinct rows


--Delete duplicate rows

WITH Count_Dup 
AS	(
	SELECT *, ROW_NUMBER() OVER	(PARTITION BY street, city, zip, state, beds, baths, 
sq__ft, type, sale_date, price, latitude, longitude
					ORDER BY street, city, zip, state, beds, baths, 
sq__ft, type, sale_date, price, latitude, longitude)
			AS Row_Number	--Use ROW_NUMBER function to identify the duplicate rows, which are the rows having row_number > 1
	FROM Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
	)
DELETE FROM Count_Dup
WHERE Row_Number > 1	


--Filter the rows with duplicate values on street field

SELECT p2.*, Count_Dup_street.Row_Number_street
FROM (
	SELECT *, ROW_NUMBER() OVER	(PARTITION BY street
					ORDER BY street, city, zip, state, beds, baths, sq__ft, 
  type, sale_date, price, latitude, longitude)
		   AS Row_Number_street
	FROM Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
	) AS Count_Dup_street
INNER JOIN Student_FS2020.[UM-AD\ptd9pk].SacRealEstate AS p2
ON Count_Dup_street.street = p2.street
WHERE Row_Number_street = 2


--Delete one row with duplicate value on street field

DELETE FROM Student_FS2020.[UM-AD\ptd9pk].SacRealEstate 
WHERE	price = 155500 AND latitude = 38.646677 AND longitude = -121.437573


--Now that all values in "street" field are unique, let's assign primary key to it
ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
ADD PRIMARY KEY street


