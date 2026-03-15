-- Self JOIN = joining a table with itself.
-- when all the data we need is inside one table - we treat the same table as if it were two tables
SELECT s1.title, s2.title, s1.genre
FROM songs s1
JOIN songs s2
ON s1.genre = s2.genre
WHERE s1.song_id < s2.song_id;


-- condition  s1.song_id < s2.song_id  removes 
-- self matches (song A -> song A ), 
-- duplicate reversed pairs (song A -> song B; song B ->song A)

