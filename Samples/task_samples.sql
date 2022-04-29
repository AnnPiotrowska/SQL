---------------
--Samples tasks
---------------
/*
The samples table contains measurement data for a certain number of samples.
Each sample was subjected to three tests.
In addition to the test results, each record also contains the values of the two factors.
*/


/*
Calculate the sum of the results of the three tests for each sample and display the columns: id and the calculated sum.
The second column call total and sort the records in descending order.
*/

SELECT 
	id, 
	test_1+test_2+test_3 AS total 
FROM samples 
ORDER BY total DESC;



/*
For samples with even id numbers, calculate the mean of the test results multiplied by the value factor (name the column average)
Order records in descending order after this column.
*/

SELECT 
	id, 
	((test_1+test_2+test_3)/3)*factor AS average 
FROM samples 
WHERE id%2 = 0 
GROUP BY id 
ORDER BY average DESC;



/*
The group field contains the indication to which group: A, B or C the sample belongs.
Calculate the number of samples belonging to each group. 
Include only samples where the sum of the test results is greater than 10. 
Include only groups for which the number of samples meeting this condition is greater than 1. 
Order records in descending order by the number of samples. Name the column with the number of samples call total samples.
Display columns with group name and number of samples. 
*/

SELECT 
	[group], 
	COUNT(id) AS [total samples] 
FROM samples 
WHERE test_1+test_2+test_3 > 10 
GROUP BY [group] 
HAVING COUNT(id) > 1 
ORDER BY [total samples] DESC;



/* 
The round(x, y) function rounds the number x to the value with y decimal places.
In the samples table, after the sums of test_1, test_2, and test_3 are rounded to integers, the sum may repeat across multiple records.
Remove records from the samples table where the sum mentioned is the same for more than two records.
*/

DELETE FROM samples 
WHERE ROUND((test_1+test_2+test_3),0)  IN  (
		SELECT 
			ROUND((test_1+test_2+test_3),0) 
		FROM samples 
		GROUP BY ROUND((test_1+test_2+test_3),0) 
		HAVING COUNT(*) >2
	);

	