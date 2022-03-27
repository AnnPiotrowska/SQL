SELECT *
FROM MyProjects..Movies

-- 10 najlepszych filmów, które trwaja poni¿ej 100 minut

SELECT TOP(10) Title, Director, Year, Runtime, Rating
FROM MyProjects..Movies
WHERE Runtime <= 100
ORDER BY Rating DESC

-- który rezyser ma najwyzsze przychody - top 3

SELECT TOP(3) Director, MAX(CAST(Revenue AS float)) AS max_revenue
FROM MyProjects..Movies
GROUP BY Director
ORDER BY max_revenue DESC

-- najgorsze filmy z przychodami powy¿ej 100 tyœ

SELECT [Rank], Title, CAST(Revenue AS float) Revenue, Rating
FROM MyProjects..Movies
WHERE CAST(Revenue AS float) >100
ORDER BY Rating

-- najgorszy horror 

SELECT TOP (1) [Rank], Title, Genre, Rating
FROM MyProjects..Movies
WHERE Genre LIKE '%Horror%'
ORDER BY Rating


-- aktor i re¿yser w jednym

SELECT Title, Director, Actors
FROM MyProjects..Movies
WHERE Actors like '%' + Director + '%'


-- wyswietlenie listy 10 najbardziej dochodowych filmow (w milionach dolarow)

SELECT TOP(10) Title, Director, Actors, Year, Rating, CHAR(36)+Revenue + ' M' AS Revenue
FROM MyProjects..Movies
ORDER BY CAST(Revenue AS float) DESC


-- oceny filmow w ktorych zagral Brad Pitt

SELECT Actors, Title, Year, CAST(Rating AS float)
FROM MyProjects..Movies
WHERE Actors LIKE '%Brad Pitt%'
ORDER BY Year

-- œrednie ocena filmow w ktorych zagral Ryan Reynolds a Brad Pitt

SELECT 'Brad Pitt' As Actor, AVG(CAST(Rating AS float))
FROM MyProjects..Movies
WHERE Actors LIKE '%Brad Pitt%'

SELECT 'Ryan Reynolds' As Actor, AVG(CAST(Rating AS float))
FROM MyProjects..Movies
WHERE Actors LIKE '%Ryan Reynolds%'

--œrednia ocena filmow dla kazdego rezysera

SELECT Director, COUNT(Title), ROUND(AVG(CAST(Rating AS float)),2) AS avg_rating
FROM MyProjects..Movies
GROUP BY Director
ORDER BY avg_rating DESC

SELECT *
FROM MyProjects..Movies
WHERE Director = 'Christopher Nolan'

--œrednia ocena filmow dla rezysera, który ma na koncie co najmniej 4 filmy

SELECT Director, COUNT(Title), ROUND(AVG(CAST(Rating AS float)),2) AS avg_rating
FROM MyProjects..Movies
GROUP BY Director
HAVING COUNT(Title) >= 4
ORDER BY avg_rating DESC

-- wyswietlenie listy wszystkich rezyserów wraz z ich inicja³ami

SELECT DISTINCT Director, SUBSTRING(Director,1,1) + SUBSTRING(Director,PATINDEX('% %',Director)+1,1) AS initial
FROM MyProjects..Movies
ORDER BY 1


--wyszukanie filmów które w tytule zawieraj¹ apostrof

SELECT *
FROM MyProjects..Movies
WHERE Title LIKE '%''%'


-- opisy do 255 znaków -> wyswietl dane dotyczace filmów, ktore nie mieszcza sie w kolumnie

SELECT Title, Description, LEN(Description) AS length
FROM MyProjects..Movies
WHERE LEN(Description) >= 255
ORDER BY length DESC





