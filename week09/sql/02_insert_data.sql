INSERT INTO users (name, email)
VALUES
    ('Mickey', 'mickey@example.com'),
    ('Minnie', 'minnie@example.com'),
    ('Daffy', 'daffy@example.com');


INSERT INTO songs (title, artist, genre)
VALUES
    ('Evermore', 'Taylor Swift', 'Pop'),
    ('Shape of You', 'Ed Sheeran', 'Rock'),
    ('Yesterday', 'Beatles', 'Classic'),
    ('DJ Mix', 'DJ', NULL);     

INSERT INTO listenings (user_id, song_id, rating, listen_time)      
VALUES 
  (1, 1, 5, '2026-03-10 10:00:00'),
  (1, 3, 4, '2026-03-10 11:00:00'),
  (2, 1, 5, '2026-03-10 12:00:00'),
  (2, 2, NULL, '2026-03-10 13:00:00'),
  (3, 4, 3, '2026-03-10 14:00:00');

INSERT INTO recommendations (user_id, song_id, recommendation_time)
VALUES
  (1, 2, '2026-03-11 09:00:00'),
  (2, 3, '2026-03-11 09:30:00'),
  (3, 1, '2026-03-11 10:00:00');
      