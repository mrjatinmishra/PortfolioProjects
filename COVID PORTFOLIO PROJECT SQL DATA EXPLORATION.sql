Select *
From PortfolioProject..coviddeaths$
order by 3,4

Select *
From PortfolioProject..CovidVaccinations$
order by 3,4


Select location , date , total_cases, new_cases, total_deaths 
From PortfolioProject..coviddeaths$
order by 1,2

--Looking at Total Cases vs Total Deaths
-- scountryhows likelihood of dying if you contract in your 

Select location , date , total_cases, total_deaths ,(total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..coviddeaths$
Where location like '%india%'
order by 1,2

Select location , MAX(cast (total_deaths as int)) as TotalDeathCount
From PortfolioProject..coviddeaths$
Where continent is not null
Group by location
order by TotalDeathCount desc



-- LET'S BREAK THINGS DOWN BY CONTINENT

Select location , MAX(cast (total_deaths as int)) as TotalDeathCount
From PortfolioProject..coviddeaths$
Where continent is not null
Group by location
order by TotalDeathCount desc


-- GLOBAL NUMBERS
Select SUM( new_cases) as total_cases, 
SUM(cast(new_deaths as int ) ) as total_deaths ,
SUM(cast(new_deaths as int ) ) / SUM (NEW_Cases) * 100 as Deathpercentage
From PortfolioProject..coviddeaths$
where continent is not null 
order by 1,2



Select *
From PortfolioProject..CovidVaccinations$

--looking at total population vs vaccinatuion

Select dea.continent , dea.location , dea.date , vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations) )OVER (Partition by dea.Location )
From PortfolioProject..coviddeaths$ dea
Join PortfolioProject..CovidVaccinations$ vac
 On dea.location = vac.location
 and dea.date = vac.date
 Where dea.continent is not null
 order by 2,3
