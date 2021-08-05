DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
	AFTER DELETE ON SpotifyClone.users
	FOR EACH ROW
BEGIN

DELETE FROM SpotifyClone.follows_list l WHERE OLD.user_id = l.user_id;
DELETE FROM SpotifyClone.history_of_plays h WHERE OLD.user_id = h.user_id;

END $$

DELIMITER ;