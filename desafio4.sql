CREATE VIEW top_3_artistas AS
SELECT
  (SELECT artist_name
    FROM SpotifyClone.artists a
    WHERE l.artist_id = a.artist_id) AS 'artista',
        COUNT(user_id) AS 'seguidores'
FROM SpotifyClone.follows_list l
GROUP BY artist_id
ORDER BY seguidores DESC,
          artista
LIMIT 3;
