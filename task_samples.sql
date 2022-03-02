--Zadania Pomiary
--Tabela samples zawiera dane pomiarów dla pewnej liczby próbek. Ka¿da próbka by³a poddawana trzem testom. Poza wynikami testów ka¿dy rekord zawiera równie¿ wielkoœci dwóch wspó³czynników. 


--1. Oblicz sumê wyników trzech testów dla ka¿dej próbki i wyœwietl kolumny: id oraz obliczon¹ sumê. Drug¹ kolumnê nazwij total i posortuj po niej rekordy malej¹co.

SELECT id, test_1+test_2+test_3 AS total FROM samples ORDER BY total DESC;



--2. Dla próbek o parzystych id, oblicz œredni¹ wyników testów pomno¿on¹ przez wartoœæ factor (kolumnê nazwij average). Uszereguj rekordy malej¹co po tej kolumnie. 

SELECT id, ((test_1+test_2+test_3)/3)*factor AS average FROM samples WHERE id%2 = 0 GROUP BY id ORDER BY average DESC;



--3. Pole group zawiera oznaczenie do jakiej grupy: A, B, czy C nale¿y próbka. Oblicz liczbê próbek nale¿¹cych do poszczególnych grup. Uwzglêdnij jedynie próbki, w których suma wyników testów jest wiêksza ni¿ 10. Uwzglêdnij jedynie grupy, dla których liczba próbek spe³niaj¹cych ten warunek jest wiêksza ni¿ 1. Uszereguj rekordy malej¹co po liczbie próbek. Kolumnê z liczb¹ próbek nazwij total samples. Wyœwietl kolumny z nazw¹ grupy (group) oraz z liczb¹ próbek. 

SELECT [group], COUNT(id) AS [total samples] FROM samples WHERE test_1+test_2+test_3 > 10 GROUP BY [group] HAVING COUNT(id) > 1 ORDER BY [total samples] DESC;



--4. Funkcja round( x, y ) zaokr¹gla liczbê x do wartoœci z y miejscami po przecinku.  W tabeli samples po zaokr¹gleniu  sumy z pól test_1, test_2 i test_3 do wartoœci ca³kowitych, suma ta mo¿e powtarzaæ siê w wielu rekordach. Usuñ z tabeli samples rekordy, w których wspomniana suma jest taka sama dla wiêcej ni¿ dwóch rekordów. 

DELETE FROM samples WHERE ROUND((test_1+test_2+test_3),0)  IN  (SELECT ROUND((test_1+test_2+test_3),0) FROM samples GROUP BY ROUND((test_1+test_2+test_3),0) HAVING COUNT(*) >2);