----Fact Table 

CREATE TABLE Fact_Women_Empowerment
(
Income_Level_ID		INT			FOREIGN KEY REFERENCES [dbo].[Dim_Income_Level]([Income_Level_ID]),
Region_ID			INT			FOREIGN KEY REFERENCES [dbo].[Dim_Region]([Region_ID]),
Country_ID			INT			FOREIGN KEY REFERENCES [dbo].[Dim_Country]([Country_ID]),
Year_ID				INT			FOREIGN KEY REFERENCES [dbo].[Dim_Year]([Year_ID]),
Gender_ID			INT			FOREIGN KEY REFERENCES [dbo].[Dim_Gender]([Gender_ID]),
Sector_ID			INT			FOREIGN KEY REFERENCES [dbo].[Dim_Sector]([Sector_ID]),
Percentage			FLOAT,
Schooling			FLOAT,
Literacy			FLOAT,
Indicator_ID		INT			FOREIGN KEY REFERENCES [dbo].[Dim_Indicator]([Indicator_ID]),
subindex			FLOAT,
Inhabitants			FLOAT
);

SELECT * FROM Fact_Women_Empowerment;

TRUNCATE TABLE Fact_Women_Empowerment;

DROP TABLE Fact_Women_Empowerment;