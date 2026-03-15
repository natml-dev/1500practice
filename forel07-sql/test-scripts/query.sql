SELECT genre, COUNT(genre) 
FROM songs
GROUP BY genre
ORDER BY COUNT(genre); 
-- this doesn't show NULL genre because COUNT ignores NULL
-- if we want to see amount of songes with NULL value in the genre column, we have to COUNT(*)

SELECT COALESCE(genre,'Genre is not specified'), COUNT(*)
FROM songs
GROUP BY genre
ORDER BY COUNT(*);

-- inner join
SELECT name, artist, title, genre
FROM listenings l 
LEFT JOIN songs s 
ON l.song_id = s.song_id
LEFT JOIN users u
ON u.user_id = l.user_id;



--R:bruker 
--UC:05 
--Finn sangens id, tittel, artist og rating for alle sangene som har høyere rating enn 4.5:

SELECT s.song_id, title, artist, rating
FROM songs s 
INNER JOIN listenings l 
ON s.song_id = l.song_id
WHERE rating > 4.5;

-- R:bruker 
-- UC:06 
-- Finn sangens id, tittel, artisk og gjennonsnittsrating for hver sang:

SELECT s.song_id, title, artist, AVG(rating) AS average_rating
FROM songs s 
INNER JOIN listenings l 
ON s.song_id = l.song_id
GROUP BY s.song_id
ORDER BY average_rating;

-- 1. UC: Show all songs listened to by each user.

SELECT u.name, u.email, s.title, s.artist, l.listen_time
FROM users u JOIN listenings l
ON u.user_id = l.user_id
JOIN songs s 
ON l.song_id = s.song_id;

-- 2. UC: Show the rating each user gave to each song.
SELECT u.name, s.title, s.artist, l.rating
FROM users u JOIN listenings l
ON u.user_id = l.user_id
JOIN songs s 
ON l.song_id = s.song_id;

-- 3. UC: List all listening events with full details.

SELECT l.listen_id, u.name, s.title, s.genre, l.rating, l.listen_time
FROM listenings l JOIN users u
ON l.user_id = u.user_id
JOIN songs s 
ON l.song_id = s.song_id;

--4. UC: Find all songs listened to by a specific user - Daffy

SELECT u.name, s.title, s.artist, l.listen_time
FROM users u INNER JOIN listenings l
ON u.user_id = l.user_id
JOIN songs s
ON l.song_id = s.song_id
WHERE u.name = 'Daffy';

-- 5. Show all users who listened to songs in the genre 'Pop'.
SELECT u.name, u.email, s.title, s.genre
FROM users u JOIN listenings l 
ON u.user_id = l.user_id
JOIN songs s 
ON l.song_id = s.song_id
WHERE genre = 'Pop';

-- 6. UC: Show all recommendations received by users.

SELECT u.name, s.title, s.artist, r.recommendation_time
FROM users u JOIN recommendations r 
ON u.user_id = r.user_id
JOIN songs s
ON r.song_id = s.song_id; 

-- 7 UC: Find all songs recommended to a specific user.

SELECT u.name, s.title, s.artist, r.recommendation_time
FROM users u JOIN recommendations r 
ON u.user_id = r.user_id
JOIN songs s
ON r.song_id = s.song_id
WHERE u.name = 'Daffy';

-- 8. UC: Show which users received recommendations in the genre 'Rock'.
SELECT u.name, u.email, s.title, s.genre, r.recommendation_time
FROM users u JOIN recommendations r
ON u.user_id = r.user_id
JOIN songs s
ON s.song_id = r.song_id
WHERE s.genre = 'Rock';

-- 9. UC: Show all songs that were both listened to and rated by users
SELECT u.name, s.title, l.rating, l.listen_time
FROM users u JOIN listenings l
ON u.user_id = l.user_id
JOIN songs s 
ON l.song_id = s.song_id
WHERE l.rating IS NOT NULL;

-- 10 List all listening records sorted by most recent first.
SELECT u.name, s.title, l.rating, l.listen_time
FROM users u JOIN  listenings l 
ON u.user_id = l.user_id
JOIN songs s 
ON l.song_id = s.song_id
ORDER BY l.listen_time DESC;

-- 11. Find all users who gave a rating higher than 4 to a song
SELECT u.name, s.title, s.artist, l.rating 
FROM users u JOIN listenings l
ON u.user_id = l.user_id
JOIN songs s 
ON l.song_id = s.song_id
WHERE l.rating > 4;

-- 12. Show all recommendations made after a certain date.
SELECT u.name, s.title, s.artist, r.recommendation_time
FROM users u JOIN recommendations r 
ON u.user_id = r.user_id
JOIN songs s 
ON r.song_id = s.song_id
WHERE r.recommendation_time > '2024-08-28';

--13. List all users and the songs they listened to, but only songs by a specific artist
SELECT u.name, s.title, s.artist, l.rating
FROM users u JOIN listenings l 
ON u.user_id = l.user_id
JOIN songs s
ON l.song_id = s.song_id
WHERE s.artist = 'Adele';

-- 14. Find all listening records where the song genre is 'Jazz'.
SELECT u.name, s.title, s.genre, l.rating, l.listen_time
FROM users u JOIN listenings l 
ON u.user_id = l.user_id
JOIN songs s 
ON l.song_id = s.song_id
WHERE genre = 'Jazz';

-- 15. Show all recommendations with full details, ordered by newest first
SELECT r.recommendation_id, u.name, s.title, s.genre, r.recommendation_time
FROM users u JOIN recommendations r 
ON u.user_id = r.user_id
JOIN songs s 
ON r.song_id = s.song_id
ORDER BY r.recommendation_time DESC;

-- 16. Top 10 most popular songs
SELECT s.title, s.artist, COUNT(l.listen_id) AS times_played
FROM listenings l JOIN songs s 
ON l.song_id = s.song_id
GROUP BY s.title, s.artist
ORDER BY times_played DESC
LIMIT 10;

-- average rating per song
SELECT s.title, ROUND(AVG(l.rating):: numeric, 2) AS average_rating
FROM  songs s JOIN listenings l
ON s.song_id = l.song_id
GROUP BY s.title
ORDER BY average_rating DESC;
