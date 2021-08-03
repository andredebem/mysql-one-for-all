DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans(
plan_id INT PRIMARY KEY AUTO_INCREMENT,
plan_name VARCHAR(20) UNIQUE NOT NULL,
price decimal(3,2)
) engine = InnoDB;

CREATE TABLE users(
user_id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(25) NOT NULL,
age INT NOT NULL,
selected_plan INT NOT NULL,
FOREIGN KEY (selected_plan) REFERENCES plans(plan_id)
) engine = InnoDB;

CREATE TABLE artists(
artist_id INT PRIMARY KEY AUTO_INCREMENT,
artist_name VARCHAR(40) NOT NULL
) engine = InnoDB;

CREATE TABLE albuns(
album_id INT PRIMARY KEY AUTO_INCREMENT,
album_name VARCHAR(60) NOT NULL,
artist_id INT NOT NULL,
FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) engine = InnoDB;

CREATE TABLE songs(
song_id INT PRIMARY KEY AUTO_INCREMENT,
song_name VARCHAR(60) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) engine = InnoDB;

CREATE TABLE history_of_plays(
user_id INT NOT NULL,
song_id INT NOT NULL,
CONSTRAINT PRIMARY KEY(user_id, song_id),
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (song_id) REFERENCES songs(song_id)
) engine = InnoDB;

CREATE TABLE follows_list(
artist_id INT NOT NULL,
user_id INT NOT NULL,
CONSTRAINT PRIMARY KEY(artist_id, user_id),
FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
FOREIGN KEY (user_id) REFERENCES users(user_id)
) engine = InnoDB;

INSERT INTO plans (plan_name, price)
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);
    
INSERT INTO users (username, age, selected_plan)
VALUES
('Thati', 23, (
SELECT plan_id FROM plans WHERE plan_name = 'gratuito'
)),
('Cintia', 35, (
SELECT plan_id FROM plans WHERE plan_name = 'familiar'
)),
('Bill', 20, (
SELECT plan_id FROM plans WHERE plan_name = 'universitário'
)),
('Roger', 45, (
SELECT plan_id FROM plans WHERE plan_name = 'gratuito'
));
    
INSERT INTO artists (artist_name)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');
    
INSERT INTO albuns (album_name, artist_id)
VALUES
('Envious', (
SELECT artist_id FROM artists WHERE artist_name = 'Walter Phoenix'
)),
('Exuberant', (
SELECT artist_id FROM artists WHERE artist_name = 'Walter Phoenix'
)),
('Hallowed Steam', (
SELECT artist_id FROM artists WHERE artist_name = 'Peter Strong'
)),
('Incandescent', (
SELECT artist_id FROM artists WHERE artist_name = 'Lance Day'
)),
('Temporary Culture', (
SELECT artist_id FROM artists WHERE artist_name = 'Freedie Shannon'
));
    
INSERT INTO songs (song_name, album_id)
VALUES
('Soul For Us', (
SELECT album_id FROM albuns WHERE album_name = 'Envious'
)),
('Reflections Of Magic', (
SELECT album_id FROM albuns WHERE album_name = 'Envious'
)),
('Dance With Her Own', (
SELECT album_id FROM albuns WHERE album_name = 'Envious'
)),
('Troubles Of My Inner Fire', (
SELECT album_id FROM albuns WHERE album_name = 'Exuberant'
)),
('Time Fireworks', (
SELECT album_id FROM albuns WHERE album_name = 'Exuberant'
)),
('Magic Circus', (
SELECT album_id FROM albuns WHERE album_name = 'Hallowed Steam'
)),
('Honey, So Do I', (
SELECT album_id FROM albuns WHERE album_name = 'Hallowed Steam'
)),
("Sweetie, Let's Go Wild", (
SELECT album_id FROM albuns WHERE album_name = 'Hallowed Steam'
)),
('She Knows', (
SELECT album_id FROM albuns WHERE album_name = 'Hallowed Steam'
)),
('Fantasy For Me', (
SELECT album_id FROM albuns WHERE album_name = 'Incandescent'
)),
('Celebration Of More', (
SELECT album_id FROM albuns WHERE album_name = 'Incandescent'
)),
('Rock His Everything', (
SELECT album_id FROM albuns WHERE album_name = 'Incandescent'
)),
('Home Forever', (
SELECT album_id FROM albuns WHERE album_name = 'Incandescent'
)),
('Diamond Power', (
SELECT album_id FROM albuns WHERE album_name = 'Incandescent'
)),
("Honey, Let's Be Silly", (
SELECT album_id FROM albuns WHERE album_name = 'Incandescent'
)),
('Thang Of Thunder', (
SELECT album_id FROM albuns WHERE album_name = 'Temporary Culture'
)),
('Words Of Her Life', (
SELECT album_id FROM albuns WHERE album_name = 'Temporary Culture'
)),
('Without My Streets', (
SELECT album_id FROM albuns WHERE album_name = 'Temporary Culture'
));

INSERT INTO history_of_plays (user_id, song_id)
VALUES
((
SELECT user_id FROM users WHERE username = 'Thati'
), (
SELECT song_id FROM songs WHERE song_name = 'Soul For Us'
)),
((
SELECT user_id FROM users WHERE username = 'Thati'
), (
SELECT song_id FROM songs WHERE song_name = 'Magic Circus'
)),
((
SELECT user_id FROM users WHERE username = 'Thati'
), (
SELECT song_id FROM songs WHERE song_name = 'Diamond Power'
)),
((
SELECT user_id FROM users WHERE username = 'Thati'
), (
SELECT song_id FROM songs WHERE song_name = 'Thang Of Thunder'
)),
((
SELECT user_id FROM users WHERE username = 'Cintia'
), (
SELECT song_id FROM songs WHERE song_name = 'Home Forever'
)),
((
SELECT user_id FROM users WHERE username = 'Cintia'
), (
SELECT song_id FROM songs WHERE song_name = 'Words Of Her Life'
)),
((
SELECT user_id FROM users WHERE username = 'Cintia'
), (
SELECT song_id FROM songs WHERE song_name = 'Reflections Of Magic'
)),
((
SELECT user_id FROM users WHERE username = 'Cintia'
), (
SELECT song_id FROM songs WHERE song_name = "Honey, Let's Be Silly"
)),
((
SELECT user_id FROM users WHERE username = 'Bill'
), (
SELECT song_id FROM songs WHERE song_name = 'Troubles Of My Inner Fire'
)),
((
SELECT user_id FROM users WHERE username = 'Bill'
), (
SELECT song_id FROM songs WHERE song_name = 'Thang Of Thunder'
)),
((
SELECT user_id FROM users WHERE username = 'Bill'
), (
SELECT song_id FROM songs WHERE song_name = 'Magic Circus'
)),
((
SELECT user_id FROM users WHERE username = 'Roger'
), (
SELECT song_id FROM songs WHERE song_name = 'Dance With Her Own'
)),
((
SELECT user_id FROM users WHERE username = 'Roger'
), (
SELECT song_id FROM songs WHERE song_name = 'Without My Streets'
)),
((
SELECT user_id FROM users WHERE username = 'Roger'
), (
SELECT song_id FROM songs WHERE song_name = 'Celebration Of More'
));

INSERT INTO follows_list (artist_id, user_id)
VALUES
((
SELECT artist_id FROM artists WHERE artist_name = 'Walter Phoenix'
), (
SELECT user_id FROM users WHERE username = 'Thati'
)),
((
SELECT artist_id FROM artists WHERE artist_name = 'Freedie Shannon'
), (
SELECT user_id FROM users WHERE username = 'Thati'
)),
((
SELECT artist_id FROM artists WHERE artist_name = 'Lance Day'
), (
SELECT user_id FROM users WHERE username = 'Thati'
)),
((
SELECT artist_id FROM artists WHERE artist_name = 'Walter Phoenix'
), (
SELECT user_id FROM users WHERE username = 'Cintia'
)),
((
SELECT artist_id FROM artists WHERE artist_name = 'Lance Day'
), (
SELECT user_id FROM users WHERE username = 'Cintia'
)),
((
SELECT artist_id FROM artists WHERE artist_name = 'Peter Strong'
), (
SELECT user_id FROM users WHERE username = 'Bill'
)),
((
SELECT artist_id FROM artists WHERE artist_name = 'Walter Phoenix'
), (
SELECT user_id FROM users WHERE username = 'Bill'
)),
((
SELECT artist_id FROM artists WHERE artist_name = 'Freedie Shannon'
), (
SELECT user_id FROM users WHERE username = 'Roger'
));
