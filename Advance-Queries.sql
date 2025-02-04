-- Combine song titles and artist names using UNION
SELECT title AS song_or_artist
FROM songs
UNION
SELECT name AS song_or_artist
FROM artists;

-- Combine song titles and genre names using UNION
SELECT title AS song_or_genre
FROM songs
UNION
SELECT genre_name AS song_or_genre
FROM genres;