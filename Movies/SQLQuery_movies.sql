
-- display top 10 videos that are under 100 minutes long

SELECT TOP(10) Title, Director, Year, Runtime, Rating
FROM Movies
WHERE Runtime <= 100
ORDER BY Rating DESC

-- display three directors and with the highest revenues

SELECT TOP(3) Director, MAX(CAST(Revenue AS float)) AS max_revenue
FROM Movies
GROUP BY Director
ORDER BY max_revenue DESC

-- display the worst films with revenues over 100.000

SELECT [Rank], Title, CAST(Revenue AS float) Revenue, Rating
FROM Movies
WHERE CAST(Revenue AS float) >100
ORDER BY Rating

-- display worst horror

SELECT TOP (1) [Rank], Title, Genre, Rating
FROM Movies
WHERE Genre LIKE '%Horror%'
ORDER BY Rating


-- display actor and director in one person

SELECT Title, Director, Actors
FROM Movies
WHERE Actors like '%' + Director + '%'


--display the list of the top 10 highest-grossing films (in million dollars)

SELECT TOP(10) Title, Director, Actors, Year, Rating, CHAR(36)+Revenue + ' M' AS Revenue
FROM Movies
ORDER BY CAST(Revenue AS float) DESC


--display ratings of films in which he starred Brad Pitt

SELECT Actors, Title, Year, CAST(Rating AS float)
FROM Movies
WHERE Actors LIKE '%Brad Pitt%'
ORDER BY Year


--dispaly average rating of films for each director

SELECT Director, COUNT(Title), ROUND(AVG(CAST(Rating AS float)),2) AS avg_rating
FROM Movies
GROUP BY Director
ORDER BY avg_rating DESC


--dispaly average film rating for each director who has directed at least four films

SELECT Director, COUNT(Title), ROUND(AVG(CAST(Rating AS float)),2) AS avg_rating
FROM Movies
GROUP BY Director
HAVING COUNT(Title) >= 4
ORDER BY avg_rating DESC


--display a list of all directors with their initials

SELECT DISTINCT Director, SUBSTRING(Director,1,1) + SUBSTRING(Director,PATINDEX('% %',Director)+1,1) AS initial
FROM Movies
ORDER BY 1


--search for movies with an apostrophe in the title

SELECT *
FROM Movies
WHERE Title LIKE '%''%'


-- display data about movies that do not fit in the column, because they have descriptions up to 255 characters

SELECT Title, Description, LEN(Description) AS length
FROM Movies
WHERE LEN(Description) >= 255
ORDER BY length DESC





