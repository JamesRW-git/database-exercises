USE codeup_test_db;

#Returns the album name from the albums table where the artist's name is Pink Floyd
SELECT name
FROM albums
WHERE artist = 'Pink Floyd';

#Returns the release date from the albums table where the album's name
#is Sgt. Peppers's Lonely Hearts CLub Band
SELECT release_date
FROM albums
WHERE name = 'Sgt. Peppers''s Lonely Hearts CLub Band';

#Returns the genre from the albums table where the album's name is Nevermind
SELECT genre
FROM albums
WHERE name = 'Nevermind';

#Returns the album name, corresponding artist name, and corresponding release year for
#all albums where the release date is >= 1990 and <= 1999
SELECT artist, name, release_date
FROM albums
WHERE release_date >= '1990'
AND release_date<= '1999';

#Returns the album name and corresponding artist name where the sales were less than 20M
SELECT artist, name
FROM albums
WHERE sales < '20';

SELECT artist, name
FROM albums
WHERE genre = 'Rock';