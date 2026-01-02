CREATE DATABASE restaurant_analysis;
USE restaurant_analysis;
SHOW TABLES;
SELECT * FROM consumers LIMIT 5;

## Local Insights
# 1.Which Indian city has the most consumers?
SELECT City, COUNT(*) AS Total_Consumers FROM consumers GROUP BY City ORDER BY Total_Consumers DESC LIMIT 1;

# 2.Age distribution by city/state
-- by city
SELECT City, Age, COUNT(*) AS Consumer_Count FROM consumers GROUP BY City, Age ORDER BY City;
-- by state
SELECT State, Age, COUNT(*) AS Consumer_Count FROM consumers GROUP BY State, Age ORDER BY State;

# 3.Smoker vs non-smoker analysis
SELECT Smoker, COUNT(*) AS Total_Consumers FROM consumers GROUP BY Smoker;

# 4.Transport method usage
SELECT Transport_Mode, COUNT(*) AS Usage_Count FROM consumers GROUP BY Transport_Mode ORDER BY Usage_Count DESC;

## Restaurant Insights
# 1.Restaurants count by city/state
-- city wise
SELECT City, COUNT(*) AS Total_Restaurants FROM restaurants GROUP BY City ORDER BY Total_Restaurants DESC;
-- state wise
SELECT State, COUNT(*) AS Total_Restaurants FROM restaurants GROUP BY State ORDER BY Total_Restaurants DESC;

# 2.Price range vs ratings
SELECT r.Price_Range,
       AVG(rt.Overall_Rating) AS Avg_Rating
FROM restaurants r
JOIN ratings rt
ON r.Restaurant_ID = rt.Restaurant_ID
GROUP BY r.Price_Range;

# 3.Franchise vs non-franchise comparison
SELECT Franchise, COUNT(*) AS Restaurant_Count FROM restaurants GROUP BY Franchise;

# 4.Parking availability analysis
SELECT Parking, COUNT(*) AS Restaurant_Count FROM restaurants GROUP BY Parking;

## Cuisine Insights
# 1.Most preferred cuisine in India
SELECT Preferred_Cuisine, COUNT(*) AS Preference_Count
FROM consumer_preferences
GROUP BY Preferred_Cuisine
ORDER BY Preference_Count DESC
LIMIT 1;

# 2.Cuisine preference by age group
SELECT c.Age, cp.Preferred_Cuisine, COUNT(*) AS Total_Preferences
FROM consumers c
JOIN consumer_preferences cp
ON c.Consumer_ID = cp.Consumer_ID
GROUP BY c.Age, cp.Preferred_Cuisine
ORDER BY c.Age;

# 3.Cuisine vs ratings
SELECT rc.Cuisine_Type, AVG(r.Overall_Rating) AS Avg_Rating
FROM restaurant_cuisines rc
JOIN ratings r
ON rc.Restaurant_ID = r.Restaurant_ID
GROUP BY rc.Cuisine_Type
ORDER BY Avg_Rating DESC;


## Service & Quality
# 1.Food vs Service rating comparison
SELECT AVG(Food_Rating) AS Avg_Food_Rating, AVG(Service_Rating) AS Avg_Service_Rating
FROM ratings;

# 2.Impact of alcohol service on ratings
SELECT r.Alcohol_Served, AVG(rt.Overall_Rating) AS Avg_Rating
FROM restaurants r
JOIN ratings rt
ON r.Restaurant_ID = rt.Restaurant_ID
GROUP BY r.Alcohol_Served;

# 3.Value for money analysis
SELECT AVG(Value_for_Money) AS Avg_Value_For_Money FROM ratings;

## Top Restaurants
# 1.Top 5 restaurants by Overall Rating
SELECT r.Restaurant_Name, AVG(rt.Overall_Rating) AS Avg_Rating
FROM restaurants r
JOIN ratings rt
ON r.Restaurant_ID = rt.Restaurant_ID
GROUP BY r.Restaurant_Name
ORDER BY Avg_Rating DESC
LIMIT 5;

# 2.Top 5 by Food Rating
SELECT r.Restaurant_Name, AVG(rt.Food_Rating) AS Avg_Food_Rating
FROM restaurants r
JOIN ratings rt
ON r.Restaurant_ID = rt.Restaurant_ID
GROUP BY r.Restaurant_Name
ORDER BY Avg_Food_Rating DESC
LIMIT 5;

# 3.Top 5 by Service Rating
SELECT r.Restaurant_Name, AVG(rt.Service_Rating) AS Avg_Service_Rating
FROM restaurants r
JOIN ratings rt
ON r.Restaurant_ID = rt.Restaurant_ID
GROUP BY r.Restaurant_Name
ORDER BY Avg_Service_Rating DESC
LIMIT 5;


