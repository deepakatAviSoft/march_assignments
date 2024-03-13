USE DB;

-- Query to find customer ids that bought all products
/* Find customer ids from Customer table who bought all products listed in Product table */
SELECT * FROM Product;
SELECT * FROM Customer;
SELECT customer_id FROM Customer GROUP BY customer_id HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);

-- Query to find products that are both low fat and recyclable
/* Find product ids of products that are both low fat and recyclable */
SELECT * FROM products;
SELECT product_id FROM Products WHERE low_fats='Y' AND recyclable='Y';

-- Query to determine if three line segments can form a triangle
/* Determine if three line segments can form a triangle */
SELECT * FROM Triangle;
SELECT x,y,z,
	CASE
		WHEN x+y>z AND x+z>y AND y+z>x THEN 'Yes'
		ELSE 'No'
	END AS triangle
FROM Triangle;

-- Query to find activities with neither maximum nor minimum participants
/* Find activities with neither maximum nor minimum participants */
SELECT * FROM Friends;
SELECT * FROM Activities;
SELECT activity
FROM Friends
GROUP BY activity
HAVING COUNT(activity) != (
	SELECT MAX(activity_count) FROM (
		SELECT COUNT(activity) AS activity_count
		FROM Friends
		GROUP BY activity
        ) AS subquery
) AND COUNT(activity) != (
	SELECT MIN(activity_count) FROM (
		SELECT COUNT(activity) AS activity_count
		FROM Friends
		GROUP BY activity
       ) AS subquery
    );

-- Query to list classes with five or more students
/* List classes with five or more students */
SELECT class
FROM courses
GROUP BY class
HAVING COUNT(student) >= 5;

-- Query to find duplicate emails in the Person table
/* Find duplicate emails in the Person table */
SELECT Email
FROM Person
GROUP BY Email
HAVING COUNT(*) > 1;


-- Query to find number of comments per each post
/* Find number of comments per each post */
-- SELECT * FROM Submissions
SELECT s.sub_id AS post_id,
COUNT(DISTINCT c.sub_id) AS number_of_comments 
FROM Submissions s LEFT JOIN Submissions c ON s.sub_id=c.parent_id 
WHERE s.parent_id IS NULL 
GROUP BY s.sub_id
ORDER BY s.sub_id;
