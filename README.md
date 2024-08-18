<b>US Household Income Data Analysis </b>

<b>Project Overview</b>
This project focuses on analyzing US household income data using MySQL. The main goal is to clean the dataset and explore various factors affecting household income across different states and types of places in the US.

<b>Objectives</b>
- Data Cleaning: Eliminate duplicates, manage missing values, rectify errors, and standardize data for consistency. 
- Exploratory Data Analysis: Discover connections and correlations between household income and variables like state, area type, and land/water area.

<b>Data</b>
The project utilizes publicly available datasets with household income information for various states and places in the US.

<b>Data Cleaning Process</b>
Inspect the Data: SELECT statements were used to explore the initial dataset.
Identify and Remove Duplicates: Used GROUP BY and HAVING clauses to find duplicates and ROW_NUMBER() window function to remove them.
Handle Missing Values: Utilized UPDATE statements to fill in missing values based on specific conditions.
Standardize Data: Applied UPDATE and ALTER TABLE statements to correct errors and ensure consistency in data formatting.

<b>Exploratory Data Analysis</b>
Land and Water Area by State: Analyzed the total land and water area by state using SUM and GROUP BY clauses.
Top States by Land and Water Area: Identified the top 10 states by land and water area using ORDER BY and LIMIT clauses.
Income Correlation: Examined the relationship between household income and other variables using INNER JOIN and RIGHT JOIN statements.
Average and Median Income Analysis: Identified states and types of places with the highest and lowest average and median incomes using AVG, ROUND, and ORDER BY clauses.

<b>Challenges and Insights</b>
- Challenges
Data Quality Issues: Encountered several incorrect or missing data instances, which required careful handling to avoid skewed results.
Standardization of Data: Faced challenges in correcting errors and standardizing data entries, especially for state and place names.

- Insights
State Income Analysis: Identified significant differences in household income across states and types of places.
Correlation Patterns: Observed clear correlations between the type of place and household income, highlighting the impact of urbanization on income levels.
Data Visualization Needs: Realized the importance of visual tools like Tableau for better pattern recognition and presentation.

- Findings and Improvements
Lowest Average Income States: Puerto Rico has the lowest average income at $27,841.7 per person per year, followed by Mississippi at $49,385 per person per year, Arkansas, West Virginia, and Alabama.
Highest Average Income States: Columbia has the highest average income at $90,668 per person per year, followed by Connecticut, New Jersey, Maryland, and Massachusetts.
Highest Median Income State: New Jersey is the highest median income state at $126,772.7 per person per year, followed by Wyoming, Alaska, Connecticut, and Massachusetts.
Lowest Median Income State: Puerto Rico has the lowest median income at $22,522.4 per person annually.
Income by Place Type: The municipality has the highest average income but needs more representation in more than one city. Urban and Community types have significantly lower incomes than City, Track, and Municipality types.
Community Type Analysis: Puerto Rico is the only state with this Community type, which explains its lowest average income status.
Average Income by State and City: Delta Junction in Alaska has the highest average income, and many high-income cities are in the northeastern US.

<b>Conclusion</b>
This project showcases the use of MySQL for data cleaning and exploratory data analysis. It demonstrates skills in handling real-world data, identifying patterns, and deriving insights.
