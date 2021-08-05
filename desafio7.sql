CREATE VIEW perfil_artistas AS
SELECT a.artist_name AS 'artista',
        b.album_name AS 'album',
        COUNT(*) AS 'seguidores'
FROM SpotifyClone.artists a
INNER JOIN SpotifyClone.albuns b ON a.artist_id = b.artist_id
INNER JOIN SpotifyClone.follows_list l ON b.artist_id = l.artist_id
GROUP BY album,
          artista
ORDER BY seguidores DESC,
          artista,
          album;
