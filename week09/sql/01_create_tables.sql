CREATE TABLE IF NOT EXISTS users(
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS songs (
    song_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    artist VARCHAR(100) NOT NULL,
    genre VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS listenings (
    listen_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    song_id INT NOT NULL REFERENCES songs(song_id),
    rating INT,
    listen_time TIMESTAMP NOT NULL
);
CREATE TABLE IF NOT EXISTS recommendations (
    recommendation_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    song_id INT NOT NULL REFERENCES songs(song_id),
    recommendation_time TIMESTAMP NOT NULL
);