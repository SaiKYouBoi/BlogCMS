--SELECT - Retrieving Articles (Retrieve all articles with their title, creation date, and status.)
SELECT title,creation_date,status FROM POST;

-- Change the status of all "draft" articles created before 2024 to "archived".
UPDATE POST
SET status = 'archived'
WHERE status = 'draft' AND creation_date < '2024-01-01';

-- Delete all comments marked as "spam" and older than one year.
DELETE FROM comments
WHERE status = 'spam' AND creation_date < CURDATE() - INTERVAL 1 YEAR;

-- WHERE - Temporal Filtering Retrieve articles published after December 1, 2024.
SELECT * FROM POST
WHERE creation_date > '2024-12-01';

-- ORDER BY - Chronological Sorting Sort users by registration date (oldest to newest).
SELECT * FROM USER
ORDER BY inscription_date DESC;

-- LIMIT - Recent Articles Get the 5 most recent articles (only titles and dates).
SELECT title,creation_date FROM POST
ORDER BY creation_date DESC LIMIT 5;

-- DISTINCT - Unique Roles Retrieve all distinct roles of the users.
SELECT DISTINCT role
FROM USER;

-- AND/OR - Articles by Category and Status Retrieve articles in the "Technology" category that are either "published" or in "advanced draft".
SELECT * FROM POST
WHERE id_category = 1 AND (status ='published' OR status ='draft');

-- BETWEEN - Comments by Period List comments posted between December 1 and December 15, 2024.
SELECT * FROM COMMENTS
WHERE creation_date BETWEEN '2024-12-01' AND '2024-12-15';

-- IN - Articles by Multiple Categories Find articles belonging to the categories "PHP", "JavaScript", or "Database"
SELECT * FROM POST
WHERE id_category IN (1,2,3);

-- COUNT() - Article Statistics Count the ** total number** of published articles.
SELECT COUNT(*) 
FROM POST
WHERE status = 'published';

-- COUNT() with GROUP BY - Articles by Category Count the number of articles per category.
SELECT id_category, COUNT(*) AS TOTALPOSTS
FROM POST
GROUP BY id_category;

-- AVG() - Average Article Length Calculate the average length (in characters) of published articles.
SELECT AVG(CHAR_LENGTH(content)) AS avglenght
FROM POST
WHERE status = 'published';

-- MAX()/MIN() - Extreme Dates The date of the **last** published article.
SELECT MAX(creation_date) AS lastpostdate
FROM POST
WHERE status = 'published';

-- MAX()/MIN() - - The date of the **first** comment in the system.
SELECT MIN(creation_date) AS firstcomment
FROM COMMENTS;

-- SUM() - Total Views Calculate the total number of views for all articles (If you have a view_count column).
SELECT SUM(view_count) AS totalveiws
FROM POST;