CREATE TABLE IF NOT EXISTS participants (
    participant_id SERIAL PRIMARY KEY,      
    age INT,             -- NULL tillatt
    score FLOAT,         -- NULL tillatt
    qualified boolean    -- NULL tillatt
);

INSERT INTO participants (age, score, qualified)
VALUES
    (23,NULL,FALSE),
    (NULL,NULL,NULL),
    (28, 6.0, TRUE),
    (23,NULL,FALSE),
    (30,4.0,TRUE);
    