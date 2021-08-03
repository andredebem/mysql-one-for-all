CREATE VIEW historico_reproducao_usuarios AS
SELECT u.username AS 'usuario',
        s.song_name AS 'nome'
FROM SpotifyClone.users u
INNER JOIN SpotifyClone.songs s
WHERE EXISTS
    (SELECT *
      FROM SpotifyClone.history_of_plays h
      WHERE h.user_id = u.user_id
        AND h.song_id = s.song_id)
ORDER BY usuario,
          nome;
