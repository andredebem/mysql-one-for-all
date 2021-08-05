DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.users
FOR EACH ROW
BEGIN

DELETE FROM SpotifyClone.follows_list WHERE user_id = OLD.user_id;
DELETE FROM SpotifyClone.history_of_plays WHERE user_id = OLD.user_id;

-- Precisei dar uma estudada pelos códigos dos colegas para compreender onde estava o erro

END $$

DELIMITER ;
