DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(user_id_in INT)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE quantidade INT;
    SELECT COUNT(*)
    FROM SpotifyClone.history_of_plays h
    WHERE h.user_id = user_id_in INTO quantidade;
    RETURN quantidade;
END $$
DELIMITER ;
