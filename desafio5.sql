CREATE VIEW top_2_hits_do_momento AS
SELECT
  (SELECT song_name
   FROM SpotifyClone.songs s
   WHERE h.song_id = s.song_id) AS 'cancao',
       COUNT(user_id) AS 'reproducoes'
FROM SpotifyClone.history_of_plays h
GROUP BY song_id
ORDER BY reproducoes DESC,
         cancao
LIMIT 2;
