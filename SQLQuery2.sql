SELECT * 
FROM information_schema.tables 
WHERE table_type = 'BASE TABLE';

-- Find the top 10 most viewed videos across all regions.
SELECT TOP 10 v.title, v.views, 'US' AS region_code
FROM dbo.USvideos$ v
ORDER BY v.views DESC;

SELECT TOP 10 v.title, v.views, 'Canada' AS region_code
FROM  [dbo].[CAvideos$] v
ORDER BY v.views DESC;

SELECT TOP 10 v.title, v.views, 'Japan' AS region_code
FROM [dbo].[JPvideos$] v
ORDER BY v.views DESC;

-- Find the top 10 videos with the highest engagement (likes + comment count). 
SELECT TOP 10 v.title, (v.likes + v.comment_count) AS total_engagement
FROM dbo.USvideos$ v
ORDER BY total_engagement DESC;

SELECT TOP 10 v.title, (v.likes + v.comment_count) AS total_engagement
FROM [dbo].[CAvideos$] v
ORDER BY total_engagement DESC;

SELECT TOP 10 v.title, (v.likes + v.comment_count) AS total_engagement
FROM [dbo].[JPvideos$] v
ORDER BY total_engagement DESC;

-- Get the total views per category across regions.
SELECT v.category_id, SUM(v.views) AS total_views
FROM dbo.USvideos$ v
GROUP BY v.category_id,
ORDER BY total_views DESC;

SELECT v.category_id, SUM(v.views) AS total_views
FROM [dbo].[CAvideos$] v
GROUP BY v.category_id
ORDER BY total_views DESC;

SELECT v.category_id, SUM(v.views) AS total_views
FROM [dbo].[JPvideos$] v
GROUP BY v.category_id
ORDER BY total_views DESC;

--Identify the most liked videos in each region. 
SELECT 'US' AS region_code, v.title, MAX(v.likes) AS max_likes
FROM dbo.USvideos$ v
GROUP BY v.title
ORDER BY max_likes DESC;

SELECT 'CANADA' AS region_code, v.title, MAX(v.likes) AS max_likes
FROM [dbo].[CAvideos$] v
GROUP BY v.title
ORDER BY max_likes DESC;

SELECT 'JAPAN' AS region_code, v.title, MAX(v.likes) AS max_likes
FROM [dbo].[JPvideos$] v
GROUP BY v.title
ORDER BY max_likes DESC;

