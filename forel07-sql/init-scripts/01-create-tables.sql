-- Lage tabell for brukere
CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,      -- Unik identifikator for hver bruker
    name VARCHAR(100) NOT NULL,      -- Fullt navn til brukeren
    email VARCHAR(100) NOT NULL UNIQUE -- Brukerens epost (må være unik)
);

-- Lage tabell for sanger
CREATE TABLE IF NOT EXISTS songs (
    song_id SERIAL PRIMARY KEY,      -- Unik identifikator for sang
    title VARCHAR(100) NOT NULL,     -- Sangtittel
    artist VARCHAR(100) NOT NULL,    -- Artist/Band navn
    genre VARCHAR(100)               -- Musikgenre
);

-- Lage tabell for avspillinger (bruker hører på en sang)
CREATE TABLE IF NOT EXISTS listenings (
    listen_id SERIAL PRIMARY KEY,    -- Unik identifikator for listening hendelse
    user_id INTEGER NOT NULL REFERENCES users(user_id), -- Forhold til users
    song_id INTEGER NOT NULL REFERENCES songs(song_id), -- Forhold til songs
    rating FLOAT,                    -- Brukerevaluering (ikke påkrevd)
    listen_time TIMESTAMP            -- Når ble sangen spilt
);

-- Lage en tabell for anbefalinger
CREATE TABLE IF NOT EXISTS recommendations (
    user_id INTEGER NOT NULL REFERENCES users(user_id), -- Forhold til users
    song_id INTEGER NOT NULL REFERENCES songs(song_id), -- Forhold til songs
    recommendation_id SERIAL PRIMARY KEY,               -- Unik identifikator for anbefaling
    recommendation_time TIMESTAMP                       -- Når var anbefaling generert
);

INSERT INTO users (user_id, name, email)
VALUES
    (1, 'Mickey', 'mickey@example.com'),
    (2, 'Minnie', 'minnie@example.com'),
    (3, 'Daffy', 'daffy@example.com'),
    (4, 'Pluto', 'pluto@example.com');

INSERT INTO songs (song_id, title, artist, genre)
VALUES
    (1, 'Evermore', 'Taylor Swift', 'Pop'),
    (2, 'Willow', 'Taylor Swift', 'Pop'),
    (3, 'Shape of You', 'Ed Sheeran', 'Rock'),
    (4, 'Photograph', 'Ed Sheeran', 'Rock'),
    (5, 'Shivers', 'Ed Sheeran', 'Rock'),
    (6, 'Yesterday', 'Beatles', 'Classic'),
    (7, 'Yellow Submarine', 'Beatles', 'Classic'),
    (8, 'Hey Jude', 'Beatles', 'Classic'),
    (9, 'Bad Blood', 'Taylor Swift', 'Rock'),
    (10, 'DJ Mix', 'DJ', NULL);

INSERT INTO listenings (listen_id, user_id, song_id, rating, listen_time)
VALUES
    (1, 1, 1, 4.5, '2024-08-30 14:35:00'),
    (2, 1, 2, 4.2, NULL),
    (3, 1, 6, 3.9, '2024-08-29 10:15:00'),
    (4, 2, 2, 4.7, NULL),
    (5, 2, 7, 4.6, '2024-08-28 09:20:00'),
    (6, 2, 8, 3.9, '2024-08-27 16:45:00'),
    (7, 3, 1, 2.9, NULL),
    (8, 3, 2, 4.9, '2024-08-26 12:30:00'),
    (9, 3, 6, NULL, NULL);

SELECT setval('users_user_id_seq', (SELECT MAX(user_id) FROM users));
SELECT setval('songs_song_id_seq', (SELECT MAX(song_id) FROM songs));
SELECT setval('listenings_listen_id_seq', (SELECT MAX(listen_id) FROM listenings));