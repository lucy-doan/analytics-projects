--Designing Data Schema--


SELECT *
FROM Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
ORDER BY zip

--The result show there is one blank value in zip field. 
--My solution is extracting the full address (street + city + state), 
--then search for its zip code accordingly. 
--Google Maps shows this address has zip code of '95828'

UPDATE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate
SET zip = '95828'
WHERE street = '7342 DAVE ST'



--Link Zip field in HHIncome table as a Foreign Key with zip field in SacRealEstate table

ALTER TABLE Student_FS2020.[UM-AD\ptd9pk].SacRealEstate WITH NOCHECK
ADD CONSTRAINT FK_RealEstate_HHIncome 
FOREIGN KEY (zip) REFERENCES Student_FS2020.[UM-AD\ptd9pk].HHIncome(Zip);
