-- Show songs ranked from highest to lowest based on song_rank
SELECT s.title, a.name AS artist, g.genre_name, pc.song_rank, pc.play_count
FROM play_counts pc
JOIN songs s ON pc.song_id = s.song_id
JOIN artists a ON s.artist_id = a.artist_id
JOIN genres g ON s.genre_id = g.genre_id
ORDER BY pc.song_rank ASC;

-- Show all Pop songs
SELECT s.title, a.name AS artist, g.genre_name, pc.song_rank, pc.play_count
FROM play_counts pc
JOIN songs s ON pc.song_id = s.song_id
JOIN artists a ON s.artist_id = a.artist_id
JOIN genres g ON s.genre_id = g.genre_id
WHERE g.genre_name = 'Pop';

-- Show all songs by Taylor Swift
SELECT s.title, a.name AS artist, g.genre_name, pc.song_rank, pc.play_count
FROM play_counts pc
JOIN songs s ON pc.song_id = s.song_id
JOIN artists a ON s.artist_id = a.artist_id
JOIN genres g ON s.genre_id = g.genre_id
WHERE a.name = 'Taylor Swift';

-- Classify songs by play count into High, Medium, Low
SELECT s.title, a.name AS artist, g.genre_name, pc.play_count,
    CASE
        WHEN pc.play_count > 1000000000 THEN 'High'
        WHEN pc.play_count BETWEEN 500000000 AND 1000000000 THEN 'Medium'
        ELSE 'Low'
    END AS play_count_category
FROM play_counts pc
JOIN songs s ON pc.song_id = s.song_id
JOIN artists a ON s.artist_id = a.artist_id
JOIN genres g ON s.genre_id = g.genre_id;

-- Display a custom message based on song rank
SELECT s.title, a.name AS artist, pc.song_rank,
    CASE
        WHEN pc.song_rank = 1 THEN 'The top song!'
        WHEN pc.song_rank <= 5 THEN 'Top 5 hit!'
        WHEN pc.song_rank <= 10 THEN 'Popular song'
        ELSE 'Ranked below top 10'
    END AS song_message
FROM play_counts pc
JOIN songs s ON pc.song_id = s.song_id
JOIN artists a ON s.artist_id = a.artist_id;