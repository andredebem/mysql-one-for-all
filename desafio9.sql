DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artist_name_in VARCHAR(30))
BEGIN

SELECT a.artist_name AS 'artista', b.album_name AS 'album' FROM SpotifyClone.artists a INNER JOIN SpotifyClone.albuns b ON a.artist_id = b.artist_id WHERE a.artist_name = artist_name_in
ORDER BY album;

END $$
DELIMITER ;
