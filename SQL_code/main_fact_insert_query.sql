 Insert into Fact_Women_Empowerment
 select fa.Income_Level_ID,fa.Region_ID,fa.Country_ID,fa.Year_ID,fa.Sector_ID,fa.Gender_ID,fa.Percentage,fa.Schooling,fa.Literacy_Rate,fa.Indicator_ID,fa.Indicator,fa.Inhabitants from
(
select b2.Income_Level_ID,b2.Region_ID,b2.Country_ID,b2.Year_ID,b2.Sector_ID,b2.Gender_ID,b2.Percentage,b2.Schooling,b2.Literacy_Rate, b1.Indicator_ID, isnull(b1.Indicator,'XXXX') as Indicator,isnull(b1.subindex,'0000') as subindex,isnull(b1.Inhabitants,'000') as Inhabitants from
( 
select e.*, isnull (p.Inhabitants,'0000') as Inhabitants from
(
	select di.Income_Level_ID,i.Income_Level,dr.Region_ID,r.Region,dc.Country_ID,g.Country, dy.Year_ID,g.year,din.Indicator_ID,g.Indicator,g.subindex 
	from Global_Gender_Gap g,Dim_Country dc,Region r,Dim_Region dr, Income_Level i, Dim_Income_Level di,Dim_Year dy,Dim_Indicator din
	 where g.Country=dc.Country and g.Subindicator_Type ='Index' and g.subindex !='NA'
	 and g.Country =r.Country
	 and dr.Region =r.Region
	 and g.Country =i.Country
	 and di.Income_Level = i.Income_Level
	 and dy.Year = g.year
	 and din.Indicator = g.Indicator
) e full outer join Population p on p.Country= e.Country
where e.year is not null
) b1
full outer join
(
select ep.*,isnull (ml.Schooling,'0000') as Schooling ,isnull(ml.Literacy_Rate,'0000') as Literacy_Rate from
(
	select di.Income_Level_ID, i.Income_Level,dr.Region_ID,r.Region,dc.Country_ID, es.Country,dy.Year_ID,es.Year,ds.Sector_ID,es.Sector,dg.Gender_ID,es.Gender,es.Percentage 
	from Employment_Sector es,Region r,Income_Level i,Dim_Country dc,Dim_Region dr, Dim_Income_Level di,Dim_Year dy,Dim_Gender dg,Dim_Sector ds
	Where  r.Country = es.Country and i.country = es.Country and dc.Country =es.Country
	and dr.Region =r.Region
	and di.Income_Level =i.Income_Level
	and dy.Year = es.Year
	and dg.Gender =es.Gender
	and ds.Sector = es.Sector
	union all
	select di.Income_Level_ID,i.Income_Level,dr.Region_ID,r.Region,dc.Country_ID,p.Country,dy.Year_ID,p.Year,ds.Sector_ID,p.Sector,dg.Gender_ID,p.Gender,p.Percentage 
	from Parliment p ,Region r ,Income_Level i,Dim_Country dc,Dim_Region dr, Dim_Income_Level di,Dim_Year dy,Dim_Gender dg,Dim_Sector ds 
	where r.country = p.Country and i.country = p.Country and dc.Country = p.Country
	and dr.Region =r.Region
	and di.Income_Level =i.Income_Level
	and dy.Year = p.Year
	and dg.Gender =p.Gender
	and ds.Sector = p.Sector
) ep 
full outer join ( 
select b.year,b.Gender,b.schooling,b.Literacy_Rate from
(
	select  m.Year,m.Gender,avg(convert(decimal(10,2),m.Mean_years_schooling)) as Schooling, l.Literacy_Rate from Mean_Years_Schooling m,Literacy_Rate l 
	where m.year = l.year and m.Gender = l.Gender 
	Group by m.year,m.Gender,l.Literacy_Rate 
) b)ml
on (ep.Year = ml.Year and ep.Gender =ml.Gender)
where ep.Region is not null
)b2 on (b1.Country = b2.Country and b1.Year =b2.Year)
where b2.Income_Level is not null  
 ) fa
 order by fa.Income_Level_ID,fa.Region_ID,fa.Country_ID,fa.Year_ID,fa.Sector_ID,fa.Gender_ID,fa.Indicator_ID