-- data cleaning

use  world_leyoffs;

select * from layoffs;

-- 1. remove duplicates
-- 2. standarize data
-- 3.  null values & blanc values
-- 4.  remove any columns

-- create another table like leyoffs
create table layoffs_staging
like layoffs;

select * from layoffs_staging;

insert into layoffs_staging
select * from layoffs;
-- 1. remove duplicates

select *,
row_number() over(
partition by company,industry,total_laid_off,percentage_laid_off,`date`) as row_num
from layoffs_staging;

with duplicate_cte as (
select *,
row_number() over(
partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging
)

select * from duplicate_cte
where row_num > 1;


select * from layoffs_staging
where company like 'Cazoo';


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select * from layoffs_staging2;

insert into layoffs_staging2
select *,
row_number() over(
partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging;

select * from layoffs_staging2
where row_num > 1;

SET SQL_SAFE_UPDATES = 0;
DELETE
FROM layoffs_staging2
WHERE row_num > 1;

select * from layoffs_staging2;

-- standarizing data its mean finding issues in the data and then fix it--
-- there is space in the begining of the data of column company

select company,(TRIM(company))
from layoffs_staging2;

update layoffs_staging2
set company = TRIM(company);

select distinct industry
from layoffs_staging2
order by 1; -- to see the blancs and null in the first of the list

select industry
from layoffs_staging2
where industry like 'crypto%';
-- we have crypto cryptocurrency and crypto currenctry and all are the same, so we will rename them to crypto
update layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%';

-- now for location

select distinct location 
from layoffs_staging2
order by 1
;
-- for country there united states and united states. we need to rename it to united states
select distinct country 
from layoffs_staging2
order by 1
;

select country
from layoffs_staging2
where country like 'United states.%';

select distinct country , trim(trailing '.' from country)
from layoffs_staging2;

update layoffs_staging2
set country= 'United States'
where country like 'United States.';
-- or 
update layoffs_staging2
set country= trim(trailing '.' from country)
where country like 'United States.';

-- if we want to use date and time series we need to fix the column date because its for now a text 

select `date`,
STR_TO_DATE(`date`,'%m/%d/%Y')
from layoffs_staging2;

update layoffs_staging2
set `date` = STR_TO_DATE(`date`,'%m/%d/%Y');

alter table layoffs_staging2
modify column `date` DATE;

-- now its time to fix the null and blanc values

select *
from layoffs_staging2;

select *
from layoffs_staging2
where total_laid_off is null and percentage_laid_off is null;

select *
from layoffs_staging2
where industry is null 
or industry = '';

select *
from layoffs_staging2
where company = 'Airbnb';-- travel industry so all companies airbnb in industry we can put travel instead of null


select t1.industry, t1.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
    and t1.location = t2.location
where (t1.industry is null or t1.industry='' ) and t2.industry is not null;

update layoffs_staging2
set industry = null
where industry = '';

update layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
set t1.industry= t2.industry
where (t1.industry is null ) and (t2.industry is not null) ;
-- Bally's is still null
select *
from layoffs_staging2
where industry is null 
or industry = '';

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;
-- we can delete the data in these two culumn if they are null but its depend on our need.
delete 
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

-- finally we need to drop the row_num that we added to the table

alter table layoffs_staging2
drop column row_num;