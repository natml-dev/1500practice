SELECT title, artist 
FROM songs
WHERE genre = 'Classic';

SELECT title, artist
FROM songs
WHERE title LIKE 'Y%';

SELECT * 
FROM songs
WHERE genre IS NULL;

SELECT *
FROM listenings
WHERE rating IS NULL;

SELECT *
FROM listenings
WHERE rating IS NOT NULL;
