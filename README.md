# Implementation-of-Data-Warehouse-for-Women-Empowerment-and-Gender-Gap

**Field:** Data Warehousing and Business Intelligence.

**Technologies Used:** SSMS, SSAS, Visual Studio, R-Studio, Tableau, and MS Excel. 

**Description:** 

•	Created a data warehouse of Women Empowerment and Gender Gap, which gives better suggestions and more details for the prospective gender gap.

•	Data collected from 6 different data sources ( both structured and unstructured data) using web scraping.

•	Cleaned the dataset using R and automated script to load cleaned datasets and processed (ETL).

•	Data was analyzed using Visual Studio and Microsoft SQL tools (SSIS, SSMS, SSAS) to create a data warehouse and deploy cube and finally visualized analysis using Tableau. 


** All the code and data files were uploded.


**Introduction**

Gender Equality is nothing but a human right which makes all the people to live their life with dignity and freedom regardless of the gender. Women empowerment in one way plays a crucial role in decreasing the gender inequality and the other side it paves path for economic development of the countries. But unfortunately, from centuries women are the victims of this gender discrimination in our society. Keeping the status of Women in various fields like education, employment and politics in different countries. In this paper an attempt is made to present important factors of inequalities that exist in countries worldwide and how they are changing from past few years so as to have an idea about to what extent the women are empowered. For this analysis the Data Science is the correct approach for having a right visualization and analyzing the present growth and the future prediction to improve the gender equality.


**BI Queries**

_(Req-1)_ My first requirement is to analyze that Employability of women in different sectors like Agriculture, Industry and Services and Women in politics and comparing the gap between men and women Region years for the years 2010 to 2018

_(Req-2)_ My second requirement is to compare the literacy rate and means of schooling women and men and analyzing the gap between the over years from 1990 to 2016.

_(Req-3)_ My Third BI Query is easy Analyze whether this gender gap is based on Region or Income level of the countries or depends on population of country.


**Data Sources**

Sources of data used in the project.

_**Source 1:ILO**_

ILO Contains the data for the Employment of women and men in different sectors which helps us to compare that employability rate between the women and men and also to know in which sectors the women have to improve this will be visualized further in the business intelligence(BI) query. The link for the data is https://www.ilo.org/wesodata/

**_Source 2: UN data_**

Downloaded the csv file which contains the data of Percentage of women sharing the seats in national parliament. By this data we can analyze how much the women are empowered in our parliament and how much of growth taking place every year. This source2 is combined with source 1 and used in our first BI query to show the growth rate of women in different sectors by comparing with men. The source link is http://data.un.org/

**_Source 3: UNICEF_**
The link for data source is https://data.unicef.org/topic/education/literacy/. From this site we have got structured data source contains the information on literacy rate of men and women over years, where literacy is one of the main components of economic growth of the countries. Further we will be visualizing this data in our second BI Query.

**_Source 4: UNDP_**

UNDP means United Nations Development program, which contains a huge amount of data related to the growth of countries. From this site we have taken two structured data set for Mean years of Schooling Male and Mean years of Schooling Female. As the education in turn helps in making the good society both in economically and techno- logically. So we have used this source 4 with Source 3 and will be visualizing later in our BI query 2 to analyze how the mean years of schooling effecting literacy rate and also what percentage of female are lacking in education than men. The link for data is http://hdr.undp.org/en/data**

**_Source 5: Statista_**

Statista was the fifth source which is also used as structured data, The link for data set is https://www.statista.com/statistics/262879/countries-with-the-largest-population/. This data set contains the ten largest populated countries In the year 2018.We are using this population of the countries to find whether gender equality depends on population or on other factors which we can see in our third BI query.

**_Source 6: The World Bank_**

The World Bank was the last source, in which have used two data sets one is structured and other is unstructured data. https://tcdata360.worldbank.org/indicators/af52ebe9? country=BRA&indicator=27959&viz=line_chart&years=2006,2018&indicators=944& compareBy=region this data set contains the data of global gender gap index for different indicators for all the countries by which we can easily analyze what percentage of women are facing gender inequalities. 

   Another data for this project was also from this source https://datahelpdesk.worldbank.org/knowledgebase/articles/906519 which we web scraped using R. This contains the data of World Countries Region wise and Income Level of the Countries wise which is used for us to analyze our data based on this parameters to get more clear idea on which areas and fields we are having gender inequalities and what should be in particular fields to improve empowerment of women which we will be visualized in our BI Queries later.
    
    
** Find my project report on https://www.slideshare.net/bhupatialekhya/dwbiprojectwomenempowermentandgendergap
