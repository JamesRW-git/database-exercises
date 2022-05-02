USE codeup_test_db;

SELECT name as 'All Albums in Table', sales
from albums;

UPDATE albums
SET sales = (sales * 10);

SELECT name, sales
from albums;

SELECT name as 'Albums Released Before 1980', release_date
from albums
WHERE release_date < '1980';

UPDATE albums
SET release_date = (release_date - 100)
WHERE release_date < '1980';

SELECT name as 'Albums Released Before 1900', release_date
from albums
WHERE release_date < '1900';

SELECT name as 'Michael Jackson Albums', release_date
from albums
WHERE artist = 'Michael Jackson';

UPDATE albums
SET artist = 'Peter Jackson'
WHERE artist = 'Michael Jackson';

SELECT name as 'Previously Michael Jackson Albums', release_date
from albums
WHERE artist = 'Peter Jackson';
