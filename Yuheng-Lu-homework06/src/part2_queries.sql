-- 1. Show the possible values of the year column in the country_stats table sorted by most recent year first.
SELECT DISTINCT year 
FROM country_stats
ORDER BY year DESC;

-- 2. Show the names of the first 5 countries in the database when sorted in alphabetical order by name.
SELECT name 
FROM countries
ORDER BY name ASC
LIMIT 5;

-- 3. Adjust the previous query to show both the country name and the gdp from 2018, but this time show the top 5 countries by gdp.
SELECT name, gdp
FROM countries
JOIN country_stats on countries.country_id = country_stats.country_id
WHERE year = 2018
ORDER BY gdp DESC
LIMIT 5;

-- 4. How many countries are associated with each region id?
SELECT region_id, COUNT(*) as country_count 
FROM countries
GROUP BY region_id
ORDER BY country_count DESC;

-- 5. What is the average area of countries in each region id?
SELECT region_id, ROUND(AVG(area), 0) as avg_area 
FROM countries
GROUP BY region_id
ORDER BY avg_area ASC;

-- 6. Use the same query as above, but only show the groups with an average country area less than 1000.
SELECT region_id, ROUND(AVG(area), 0) as avg_area 
FROM countries
GROUP BY region_id
HAVING ROUND(AVG(area), 0) < 1000
ORDER BY avg_area ASC;

-- 7. Create a report displaying the name and population of every continent in the database from the year 2018 in millions.
SELECT continents.name, ROUND(CAST(SUM(population) as decimal)/1000000, 2) AS tot_pop 
FROM country_stats 
JOIN countries on country_stats.country_id = countries.country_id
JOIN regions on countries.region_id = regions.region_id
JOIN continents on regions.continent_id = continents.continent_id
WHERE country_stats.year = 2018
GROUP BY continents.name
ORDER BY SUM(population) DESC;

-- 8. List the names of all of the countries that do not have a language.
SELECT name, language_id
FROM countries
LEFT JOIN country_languages ON countries.country_id = country_languages.country_id
WHERE language_id IS NULL;

-- 9. Show the country name and number of associated languages of the top 10 countries with most languages.
SELECT name, COUNT(*) as lang_count
FROM country_languages
JOIN countries ON country_languages.country_id = countries.country_id
GROUP BY name
ORDER BY lang_count DESC, name ASC
LIMIT 10;

-- 10. Repeat your previous query, but display a comma separated list of spoken languages rather than a count.
SELECT name, string_agg(language::character varying, ',') as string_agg
FROM country_languages
JOIN countries ON country_languages.country_id = countries.country_id
JOIN languages ON country_languages.language_id = languages.language_id
GROUP BY name;

-- 11. What's the average number of languages in every country in a region in the dataset?
DROP TABLE temp_table_name;
CREATE TEMPORARY TABLE temp_table_name AS
	SELECT name, region_id, COUNT(country_languages.language_id) as lang_count
	FROM countries
	LEFT JOIN country_languages ON countries.country_id = country_languages.country_id
	GROUP BY name, region_id
	ORDER BY lang_count ASC, name ASC;
SELECT regions.name, ROUND(AVG(temp_table_name.lang_count), 1) as avg_lang_count_per_country
FROM regions
JOIN temp_table_name on regions.region_id = temp_table_name.region_id
GROUP BY regions.name
ORDER BY ROUND(AVG(temp_table_name.lang_count), 1) DESC;

-- 12. Show the country name and its "national day" for the country with the most recent national day and the country with the oldest national day.
SELECT name, national_day
FROM countries
WHERE national_day = (SELECT MAX(national_day) from countries) OR national_day = (SELECT MIN(national_day) from countries);
