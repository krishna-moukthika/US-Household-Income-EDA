# US Household Income Data Cleaning
SELECT *
FROM us_household_income;

SELECT *
FROM us_householdincome_statistics;

ALTER TABLE us_householdincome_statistics RENAME COLUMN `ï»¿id` TO `id`;

SELECT COUNT(id)
FROM us_household_income;

SELECT COUNT(id)
FROM us_householdincome_statistics;

SELECT id, COUNT(id)
FROM us_household_income
GROUP BY id
HAVING COUNT(id) > 1;

SELECT *
FROM (
	SELECT row_id, id,
	ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
	FROM us_household_income
) duplicates
WHERE row_num > 1
;

#Deleting Duplicates
DELETE FROM us_household_income
WHERE row_id IN (
    SELECT row_id
	FROM (
        SELECT row_id,
		id,
		ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
		FROM us_project.us_household_income
		) duplicates
WHERE row_num > 1)
;

#Fixing spelling  mistakes in States
SELECT DISTINCT State_Name
FROM us_household_income
GROUP BY State_Name
ORDER BY 1
;

UPDATE us_household_income
SET State_Name = 'Georgia'
WHERE State_name = 'georia';

UPDATE us_household_income
SET State_Name = 'Alabama'
WHERE State_name = 'alabama';

#Populating missing values in Place
SELECT *
FROM us_household_income
WHERE County = 'Autauga County'
ORDER BY 1
;

UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont';

#Updating values in Type
SELECT Type, COUNT(TYPE)
FROM us_household_income
GROUP BY 1
;

UPDATE us_household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs'
;

# US Household Income Exploratory Data Analysis

SELECT *
FROM us_householdincome_statistics
;

# Exploring States Land And Water Area
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name;

# Exploring Top 10 States By Land
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10;

# Exploring Top 10 States By Water
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 3 DESC
LIMIT 10;

# Joining Tables Together
SELECT *
FROM us_household_income u
INNER JOIN us_householdincome_statistics us
    ON u.id = us.id
WHERE Mean <> 0;

# Mean And Median Household Income By State
SELECT u.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_household_income u
INNER JOIN us_householdincome_statistics us
    ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
;

# Mean And Median Household Income By Type OF Area
SELECT Type, COUNT(Type), ROUND(AVG(MEAN),1), ROUND(AVG(Median),1)
FROM us_household_income u
INNER JOIN us_householdincome_statistics us
    ON u.id = us.id
WHERE Mean <> 0
GROUP BY 1
;

# Exploring Which States Have Community areas
SELECT *
FROM us_household_income
WHERE Type = 'Community';

# Filtering Out the Outliers
SELECT Type, COUNT(Type), ROUND(AVG(MEAN),1), ROUND(AVG(Median),1)
FROM us_household_income u
INNER JOIN us_householdincome_statistics us
    ON u.id = us.id
WHERE Mean <> 0
GROUP BY 1
HAVING COUNT(Type) > 100
;

# Highest Mean And Median Household Income Cities
SELECT u.State_Name, City, ROUND(AVG(MEAN),1), ROUND(AVG(Median),1)
FROM us_household_income u
JOIN us_householdincome_statistics us
     ON u.id = us.id
GROUP BY u.State_Name, City
ORDER BY ROUND(AVG(MEAN),1) DESC
;
  