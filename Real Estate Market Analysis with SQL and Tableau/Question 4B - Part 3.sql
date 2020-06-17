----QUESTION 4B - Part 3----



--Change the name of "sq__ft" field to "sq__ft_deleted"
USE Student_FS2020;  
GO  
EXEC sp_rename '[UM-AD\ptd9pk].SacRealEstate.sq__ft', 'sq__ft_deleted', 'COLUMN';  
GO  



--Create a geography field from “latitude” and “longitude” geometry field

ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
ADD GeoLocation GEOGRAPHY


UPDATE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
SET GeoLocation = geography::STPointFromText('POINT(' + CAST(longitude AS VARCHAR(20)) 
+ ' ' + CAST(latitude AS VARCHAR(20)) + ')', 4326)
