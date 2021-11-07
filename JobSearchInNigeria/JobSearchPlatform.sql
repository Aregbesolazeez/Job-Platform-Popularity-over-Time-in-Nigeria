

--Making sure all files are correctly imported

Select *
From JobSearchInNigeria..Careers24
Order by 1

Select *
From JobSearchInNigeria..Glassdoor
Order by 1

Select *
From JobSearchInNigeria..HotNigerianJob
Order by 1

Select *
From JobSearchInNigeria..Indeed
Order by 1

Select *
From JobSearchInNigeria..JobbermanPortal
Order by 1

Select *
From JobSearchInNigeria..jobzilla
Order by 1

Select *
From JobSearchInNigeria..myjobmag
Order by 1


--Joining all seven(7) tables together

Select 
ca.Week, 
Careers24, 
Glassdoor,
[hot nigerian jobs],
Indeed,
Jobberman,
jobzilla,
MyJobMag
From 
(((((JobSearchInNigeria..Careers24 ca
Join JobSearchInNigeria..Glassdoor ga
	on ca.week = ga.week)
Join JobSearchInNigeria..HotNigerianJob ho
	on ca.week = ho.week)
Join JobSearchInNigeria..Indeed ind
	on ca.week = ind.week)
Join JobSearchInNigeria..JobbermanPortal jo
	on ca.week = jo.week)
Join JobSearchInNigeria..jobzilla jz
	on ca.week = jz.week)
Join JobSearchInNigeria..myjobmag my
	on ca.week = my.week


--Creating a TEMP table to store the above joined table

DROP Table if exists PlatformSearchComparison
Create Table PlatformSearchComparison(
WeekS datetime, 
Careers24 numeric, 
Glassdoor numeric,
[hot nigerian jobs] numeric,
Indeed numeric,
Jobberman numeric,
Jobzilla numeric,
MyJobMag numeric
)
Insert into PlatformSearchComparison
	
Select 
ca.Week, 
Careers24, 
Glassdoor,
[hot nigerian jobs],
Indeed,
Jobberman,
jobzilla,
MyJobMag
From 
(((((JobSearchInNigeria..Careers24 ca
Join JobSearchInNigeria..Glassdoor ga
	on ca.week = ga.week)
Join JobSearchInNigeria..HotNigerianJob ho
	on ca.week = ho.week)
Join JobSearchInNigeria..Indeed ind
	on ca.week = ind.week)
Join JobSearchInNigeria..JobbermanPortal jo
	on ca.week = jo.week)
Join JobSearchInNigeria..jobzilla jz
	on ca.week = jz.week)
Join JobSearchInNigeria..myjobmag my
	on ca.week = my.week


Select *
From PlatformSearchComparison


--Average of all internet over time for all the platforms from 08/11/2020 to 31/10/2021

Select 
Sum(Careers24) / 52 as Careers24,
Sum(Glassdoor) / 52 as Glassdoor,
Sum([hot nigerian jobs]) / 52 as [Hot Nigerian Job],
Sum(Indeed) / 52 as Indeed,
Sum(Jobberman) / 52 as Jobberman,
Sum(Jobzilla) / 52 as Jobzilla,
Sum(MyJobMag) / 52 as MyJobMag
From PlatformSearchComparison




--View to store data for visualization


Create View Platform_Search_Comparison as
Select *
From PlatformSearchComparison


Create View PlatformAverageInertnetOverTime as
Select
Sum(Careers24) / 52 as Careers24,
Sum(Glassdoor) / 52 as Glassdoor,
Sum([hot nigerian jobs]) / 52 as [Hot Nigerian Job],
Sum(Indeed) / 52 as Indeed,
Sum(Jobberman) / 52 as Jobberman,
Sum(Jobzilla) / 52 as Jobzilla,
Sum(MyJobMag) / 52 as MyJobMag
From PlatformSearchComparison


