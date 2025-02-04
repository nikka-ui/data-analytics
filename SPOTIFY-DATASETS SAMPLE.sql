-- Create new database
CREATE DATABASE Spotify_MostPlayed_2024;
USE Spotify_MostPlayed_2024;

-- Create the artists table
CREATE TABLE artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100)
);

-- Create the genres table
CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

-- Create the songs table
CREATE TABLE songs (
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    artist_id INT NOT NULL,
    genre_id INT NOT NULL,
    release_date DATE,
    duration_seconds INT,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

-- Create the play_counts table
CREATE TABLE play_counts (
    play_count_id INT AUTO_INCREMENT PRIMARY KEY,
    song_id INT NOT NULL,
    play_count BIGINT NOT NULL,
    song_rank INT NOT NULL,
    last_updated DATE,
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

-- Insert sample data into the artists table (10 artists)
INSERT INTO artists (name, country)
VALUES 
('Taylor Swift', 'USA'),
('Bad Bunny', 'Puerto Rico'),
('The Weeknd', 'Canada'),
('Drake', 'Canada'),
('Olivia Rodrigo', 'USA'),
('BTS', 'South Korea'),
('Billie Eilish', 'USA'),
('Harry Styles', 'UK'),
('Doja Cat', 'USA'),
('Ed Sheeran', 'UK');

-- Insert sample data into the genres table
INSERT INTO genres (genre_name)
VALUES 
('Pop'),
('Reggaeton'),
('R&B'),
('Hip-Hop'),
('K-Pop'),
('Alternative'),
('Rock');

-- Insert sample data into the songs table
INSERT INTO songs (title, artist_id, genre_id, release_date, duration_seconds)
VALUES 
('Anti-Hero', 1, 1, '2022-10-21', 200),
('Titi Me Preguntó', 2, 2, '2022-05-06', 180),
('Blinding Lights', 3, 3, '2019-11-29', 200),
('Rich Flex', 4, 4, '2022-11-04', 210),
('Vampire', 5, 1, '2023-06-30', 185),
('Dynamite', 6, 5, '2020-08-21', 189),
('Bad Guy', 7, 6, '2019-03-29', 194),
('As It Was', 8, 1, '2022-04-01', 173),
('Paint The Town Red', 9, 4, '2023-08-18', 180),
('Perfect', 10, 7, '2017-09-26', 263);

-- Insert sample data into the play_counts table
INSERT INTO play_counts (song_id, play_count, song_rank, last_updated)
VALUES 
(1, 1200000000, 1, '2024-12-31'),
(2, 950000000, 2, '2024-12-31'),
(3, 850000000, 3, '2024-12-31'),
(4, 750000000, 4, '2024-12-31'),
(5, 730000000, 5, '2024-12-31'),
(6, 710000000, 6, '2024-12-31'),
(7, 680000000, 7, '2024-12-31'),
(8, 650000000, 8, '2024-12-31'),
(9, 640000000, 9, '2024-12-31'),
(10, 620000000, 10, '2024-12-31');

