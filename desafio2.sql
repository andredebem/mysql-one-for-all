CREATE VIEW estatisticas_musicais AS
SELECT COUNT(*) AS 'cancoes',

  (SELECT COUNT(*)
    FROM SpotifyClone.artists) AS 'artistas',

  (SELECT COUNT(*)
    FROM SpotifyClone.albuns) AS 'albuns'
FROM SpotifyClone.songs;
