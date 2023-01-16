#1. Finding the oldest users of the platform.
SELECT DISTINCT
    (username), created_at
FROM
    users
ORDER BY created_at
LIMIT 5;


#2. Finding users who never share a post on platform.
SELECT 
    *
FROM
    users
WHERE
    id NOT IN (SELECT 
            user_id
        FROM
            photos)
ORDER BY id;


#3. Identifying the winner who got the most likes on a single photo. 
SELECT 
    u.username,
    l.user_id,
    photo_id,
    COUNT(l.user_id) AS total_likes
FROM
    users u
        JOIN
        photos p
        on u.id = p.user_id
        join
    likes l ON p.id = l.photo_id
GROUP BY l.photo_id
ORDER BY total_likes DESC
LIMIT 1;

#4. Finding the most used hashtags on platform. 
SELECT 
    tag_name, COUNT(photo_id) AS Total_tags_use
FROM
    photo_tags
        JOIN
    tags ON tags.id = photo_tags.tag_id
GROUP BY tag_id
ORDER BY COUNT(photo_id) DESC
LIMIT 5;   

#5. Finding the most busy day on platform. 
SELECT 
    DAYNAME(created_at) Days,
    COUNT(DAYNAME(created_at)) AS num_days
FROM
    users
GROUP BY Days;