select * 
from covid_project..coviddata
order by 3,4


select * 
from covid_project..covidvacc
order by 3,4

--filtering data and exploring 

select Location, date, total_cases, new_cases, total_deaths, population
from covid_project..coviddata
order by 1,2

-- looking for total deaths vs total cases 
select location , date, total_cases, total_deaths, (total_deaths / total_cases)*100 as death_percentage  
from covid_project..coviddata
order by 1,2

-- data exploration 

-- looking into data specifily in india how much percent of chance to have death if you are infected 
select location , date, total_cases, total_deaths, (total_deaths / total_cases)*100 as death_percentage  
from covid_project..coviddata
where location like '%india%'
order by 1,2


-- looking at total cases vs 
select location , date,  population,total_cases, (total_cases /population ) * 100 as infected_population
from covid_project..coviddata
order by 5 DESC


-- lokking for countries with highest population 
select Location ,population , max(total_cases) as Highest_infection_count,
	Max((total_cases/ population ))*100 as percent_of_population_infected
from covid_project..coviddata
group by location , population 
order by 4 desc

--- obervation - minimum infected population is from location afghanistan and maximum 
---				 population is affected is from Faeroe lslands but this data can be  
---				 misliding in terms of which contory is most affected also becuase faeroe lsland have very low population so to 
--				 know which contory affected more from covid is not clear through this. 


--showing countries with highest death count per population 
select location , max(cast(total_deaths as int)) as total_death_count 
from covid_project.. coviddata
group by population, location 
order by 2 desc


--from upper Query we are getting death counts of continents and some region like 
--for ex.(world , upper_middel_income, high_income) 
-- which is not usefull data so we need to clean that section of data 

select * 
from covid_project..coviddata
where continent is not null
order by 3,4

-- with is cline of query ( where continents is not null all null values are removed ) see result by executing lower code

select location , max(cast(total_deaths as int)) as total_death_count 
from covid_project.. coviddata
where continent is not null
group by population, location 
order by total_death_count  desc

-- this gives me contory which is actually affected more from a covid
-- in this i taken maximum deaths on lataest date 

-- in upper query i seen deaths by country. 
-- now i will see data from continent prespective. starting to breckdown data from continent prespective. 


select continent , max(cast(total_deaths as int)) as total_death_count_by_continents 
from covid_project.. coviddata
where continent is not null
group by continent
order by total_death_count_by_continents desc
-- observation -- after running upper query i oberved that north america data is not proper in it by just looking at it 
--				  i oberved this total death count by continent just added data of USA. but  canada and mexico's data is 
--				  not added in that. (( north america deaths -- 1013975 ))


select location , max(cast(total_deaths as int)) as total_death_count_by_continents 
from covid_project.. coviddata
where continent is null
group by location
order by total_death_count_by_continents desc

-- obervation --> by exicuting above query in which i included a null values 
--				  and after that i got population around ( north america = 1456362) and this is correct population 
--				  compare to previous count this may happed beacuse of 1 or 2 contory like canada or mexico 
--				  not have continent in the main data. 
--				  (( this is asumtion by looking at data i we will cross verify that. ))


select location ,continent ,  max(cast(total_deaths as int)) as total_death_count_by_continents 
from covid_project.. coviddata
where continent is null
group by location, continent
order by total_death_count_by_continents desc

-- obervation --> in above query i seen how much abount of data for north america
--				  have null continents. that means that much of data is not consided 

-- Below --> checking globel numbers. 

select date, SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_death,
	(SUM(new_cases) / SUM(cast(new_deaths as int)))* 100 as death_percentage
from covid_project..coviddata
where continent is  not null 
group by date
order by 1, 2

-- above code explanation --> above code is showing total cases and death reported on each day. 
--							 this information also going to helpfull to show on Tableau.
		
		
select SUM(new_cases) as total_cases, 
	 SUM(cast(new_deaths as int)) as total_death,
	(SUM(new_cases) / SUM(cast(new_deaths as int)))* 100 as death_percentage
from covid_project..coviddata
where continent is  not null 
order by 1, 2

-- above code explanation  --> it is juat modified code of previous code. this code will give 
							-- total deaths, cases and death percentage. 



-- Looking at Total popilation vs vaccination 

select dea.location, dea.date, population, vac.new_vaccinations
from covid_project..coviddata dea
join covid_project..covidvacc vac
	on dea.location = vac.location and dea.date = vac.date 
where dea.continent is not null
order by 1,2 desc

-- above Query- in above Query i joind 2 data sets of vaccination and deaths data sets. 
-- and looking at population and how much people are vaccinated 

-- obervation - by looking at data i observed that as data is incresing means as days are passing vaccination count is incresing. 

 
 
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as bigint)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From covid_project..CovidData dea
Join covid_project..CovidVacc vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3


with popVSvac( continent, location, date, population, new_vaccination_by_day , total_people_vaccinated)
as 
(

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as bigint)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From covid_project..CovidData dea
Join covid_project..CovidVacc vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
)
select * , (total_people_vaccinated / population) *100 as total_vaccination_by_percentage
from popVSvac


-- temp- tabel
drop table if exists #PercentPopulationVaccinated
create table #PercentPopulationVaccinated
(
continent nvarchar(255),
location nvarchar(255),
date datetime, 
population numeric,
new_vaccination numeric,
total_people_vaccinated numeric
)
Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as bigint)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From covid_project..CovidData dea
Join covid_project..CovidVacc vac
	On dea.location = vac.location
	and dea.date = vac.date 
--where dea.continent is not null 

select * , (total_people_vaccinated /population) *100 as total_vaccination_by_percentage
from #PercentPopulationVaccinated


-- Using Temp Table to perform Calculation on Partition By in previous query
use covid_project
DROP Table if exists PercentPopulationVaccinated
Create Table PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(bigint,vac.new_vaccinations)) OVER
	(Partition by dea.Location Order by dea.location, dea.Date)
		as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From covid_project..coviddata dea
Join covid_project..covidvacc vac
	On dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null 
--order by 2,3

Select *,(RollingPeopleVaccinated/Population)*100
From PercentPopulationVaccinated

-- using above query i am saving and creating new table 
-- use covid_project is location where i need to store data
-- create table is making table 
-- when creating make sure columns should mach to data you are inserting 



-- creating view to store data for later visualization. 

create view percent_population_vaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(bigint,vac.new_vaccinations)) OVER
	(Partition by dea.Location Order by dea.location, dea.Date)
		as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From covid_project..coviddata dea
Join covid_project..covidvacc vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 