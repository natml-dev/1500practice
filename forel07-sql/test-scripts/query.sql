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
