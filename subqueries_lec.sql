use fortran_db;

#Get all players for a specific team by team name
SELECT CONCAT(p.first_name, ' ', p.last_name)
FROM players as p
#SO this makes it where the team_id is equal to the id from the table teams
WHERE team_id IN (
    SELECT id
    FROM teams
    WHERE name LIKE '%Rangers%'
);

#Get all players for a specific position
SELECT CONCAT(p.first_name, ' ', p.last_name)
FROM players as p
WHERE id IN (
    SELECT player_id
    FROM player_position
    WHERE position_id IN (
        SELECT id
        FROM positions
        WHERE position = 'P'
        )
    );

INSERT INTO players (first_name, last_name, jersey_number, is_active, team_id)
VALUES ('Codey', 'Duck', 13, 1,
        (SELECT id FROM teams WHERE name = 'Astros'));

UPDATE players
SET team_id = (SELECT id FROM teams WHERE name = 'Nationals')
WHERE first_name = 'Codey';