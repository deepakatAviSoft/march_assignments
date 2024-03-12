-- Write a SQL query to get the second highest salary 
SELECT * FROM secondhigh;
SELECT MAX(Salary) AS SecondHighestSalary FROM Secondhigh WHERE Salary < (SELECT MAX(Salary) FROM Secondhigh);


-- Write an SQL query to report the number of calls and the total call duration between each pair of distinct persons (person1, person2) where person1 < person2
SELECT * FROM duration;
SELECT 
    least(from_id,to_id) AS person1,
    greatest(from_id,to_id) AS person2,
    count(*) AS call_count,
    SUM(duration) AS total_duration
FROM
    Duration
group by
       least(from_id,to_id),
       greatest(from_id,to_id);


-- Pivot the continent column in this table so that each name is sorted alphabetically and displayed underneath its corresponding continent. The output headers should be America, Asia and Europe respectively. It is guaranteed that the student number from America is no less than either Asia or Europe.
SELECT * FROM student;
SELECT
	MAX(CASE WHEN continent = 'America' THEN name END) AS America,
	MAX(CASE WHEN continent = 'Asia' THEN name END) AS Asia,
	MAX(CASE WHEN continent = 'Europe' THEN name END) AS Europe
FROM
	student
GROUP BY
	name
ORDER BY
	America;