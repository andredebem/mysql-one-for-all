DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
AFTER DELETE ON SpotifyClone.users
FOR EACH ROW
BEGIN

DELETE FROM SpotifyClone.follows_list WHERE OLD.user_id = SpotifyClone.follows_list.user_id;
DELETE FROM SpotifyClone.history_of_plays WHERE OLD.user_id = SpotifyClone.history_of_plays.user_id;

END $$

DELIMITER ;
