--Zadania Pomiary
--Tabela samples zawiera dane pomiar�w dla pewnej liczby pr�bek. Ka�da pr�bka by�a poddawana trzem testom. Poza wynikami test�w ka�dy rekord zawiera r�wnie� wielko�ci dw�ch wsp�czynnik�w. 


--1. Oblicz sum� wynik�w trzech test�w dla ka�dej pr�bki i wy�wietl kolumny: id oraz obliczon� sum�. Drug� kolumn� nazwij total i posortuj po niej rekordy malej�co.

SELECT id, test_1+test_2+test_3 AS total FROM samples ORDER BY total DESC;



--2. Dla pr�bek o parzystych id, oblicz �redni� wynik�w test�w pomno�on� przez warto�� factor (kolumn� nazwij average). Uszereguj rekordy malej�co po tej kolumnie. 

SELECT id, ((test_1+test_2+test_3)/3)*factor AS average FROM samples WHERE id%2 = 0 GROUP BY id ORDER BY average DESC;



--3. Pole group zawiera oznaczenie do jakiej grupy: A, B, czy C nale�y pr�bka. Oblicz liczb� pr�bek nale��cych do poszczeg�lnych grup. Uwzgl�dnij jedynie pr�bki, w kt�rych suma wynik�w test�w jest wi�ksza ni� 10. Uwzgl�dnij jedynie grupy, dla kt�rych liczba pr�bek spe�niaj�cych ten warunek jest wi�ksza ni� 1. Uszereguj rekordy malej�co po liczbie pr�bek. Kolumn� z liczb� pr�bek nazwij total samples. Wy�wietl kolumny z nazw� grupy (group) oraz z liczb� pr�bek. 

SELECT [group], COUNT(id) AS [total samples] FROM samples WHERE test_1+test_2+test_3 > 10 GROUP BY [group] HAVING COUNT(id) > 1 ORDER BY [total samples] DESC;



--4. Funkcja round( x, y ) zaokr�gla liczb� x do warto�ci z y miejscami po przecinku.  W tabeli samples po zaokr�gleniu  sumy z p�l test_1, test_2 i test_3 do warto�ci ca�kowitych, suma ta mo�e powtarza� si� w wielu rekordach. Usu� z tabeli samples rekordy, w kt�rych wspomniana suma jest taka sama dla wi�cej ni� dw�ch rekord�w. 

DELETE FROM samples WHERE ROUND((test_1+test_2+test_3),0)  IN  (SELECT ROUND((test_1+test_2+test_3),0) FROM samples GROUP BY ROUND((test_1+test_2+test_3),0) HAVING COUNT(*) >2);