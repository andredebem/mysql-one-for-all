CREATE VIEW cancoes_premium AS
SELECT s.song_name AS 'nome',
        COUNT(h.song_id) AS 'reproducoes'
FROM SpotifyClone.songs s
INNER JOIN SpotifyClone.history_of_plays h ON s.song_id = h.song_id
WHERE EXISTS
    (SELECT *
      FROM SpotifyClone.users u
      INNER JOIN SpotifyClone.plans p
      WHERE h.user_id = u.user_id
        AND u.selected_plan = p.plan_id
        AND p.plan_name IN ('familiar', 'universitário'))
GROUP BY nome
ORDER BY nome;
