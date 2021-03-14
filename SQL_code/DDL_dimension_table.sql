CREATE TABLE Dim_Region
(
Region_ID	 INT			IDENTITY (1,1) PRIMARY KEY,
Region		 VARCHAR(50)
);

CREATE TABLE Dim_Income_Level
(
Income_Level_ID	 INT			IDENTITY (1,1) PRIMARY KEY,
Income_Level	 VARCHAR(50)
);

CREATE TABLE Dim_Country
(
Country_ID	 INT			IDENTITY (1,1) PRIMARY KEY,
Country		 VARCHAR(50)
);


CREATE TABLE Dim_Gender
(
Gender_ID	 INT			IDENTITY (1,1) PRIMARY KEY,
Gender	 VARCHAR(50)
);

CREATE TABLE Dim_Year
(
Year_ID	 INT			IDENTITY (1,1) PRIMARY KEY,
Year	 VARCHAR(50)
);

CREATE TABLE Dim_Sector
(
Sector_ID	 INT			IDENTITY (1,1) PRIMARY KEY,
Sector		 VARCHAR(50)
);

CREATE TABLE Dim_Indicator
(
Indicator_ID	 INT			PRIMARY KEY,
Indicator		 VARCHAR(50)
);

TRUNCATE TABLE Dim_Region;
TRUNCATE TABLE Dim_Income_Level;
TRUNCATE TABLE Dim_Country;
TRUNCATE TABLE Dim_Gender;
TRUNCATE TABLE Dim_Year;
TRUNCATE TABLE Dim_Sector;
TRUNCATE TABLE Dim_Indicator;

DROP TABLE Dim_Region;
DROP TABLE Dim_Income_Level;
DROP TABLE Dim_Country;
DROP TABLE Dim_Gender;
DROP TABLE Dim_Year;
DROP TABLE Dim_Sector;
DROP TABLE Dim_Indicator;


SELECT * FROM Dim_Region;
SELECT * FROM Dim_Income_Level;
SELECT * FROM Dim_Country;
SELECT * FROM Dim_Gender;
SELECT * FROM Dim_Year;
SELECT * FROM Dim_Sector;
SELECT * FROM Dim_Indicator;