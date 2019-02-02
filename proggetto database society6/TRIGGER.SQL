

INSERT INTO tabella (campo1,campo2) values (values1,values2),(values3,values3),......,(valuesN,valuesM);

DELIMITER $$
create trigger trig_segue before insert on segue
FOR EACH ROW
BEGIN
    IF( NEW.utente1 = NEW.utente2 ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'self following not allowed';
    END IF;
END$$   
DELIMITER;


DELIMITER //
create trigger trig_compravendite before insert on compravendite
FOR EACH ROW
    BEGIN
    if not exists(select 1 from utenti where NEW.compratore =utenti.id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'errore';
    END IF;

    if not exists(select 1 from art where NEW.artID = art.id and NEW.venditore = art.utenteID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'errore';
    END IF;

    if not exists(select 1 from prodotto where NEW.artID = prodotto.artID and NEW.oggettoID = prodotto.oggettoID ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'prodotto non disponibile';
    END IF;


    if not exists(select 1 from taglia_oggetto where NEW.tagliaID = taglia_oggetto.tagliaID and NEW.oggettoID = taglia_oggetto.oggettoID ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'taglia non disponibile';
    END IF;

    if not exists(select 1 from colore_abilitato where NEW.coloreID = colore_abilitato.coloreID and NEW.oggettoID = colore_abilitato.oggettoID ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'colore non disponibile';
    END IF;
END//



DELIMITER $$
create trigger trig_aggiungiProd after insert on art
FOR EACH ROW
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE oggID int;
    DECLARE oggCursor CURSOR FOR SELECT id FROM oggetto;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN oggCursor;
    mLoop: LOOP 
    FETCH oggCursor INTO oggID;
    IF done THEN
      LEAVE mLoop;
    END IF;
    insert into prodotto(oggettoID,artID) values (oggID,NEW.id);
    END LOOP;
    CLOSE oggCursor;
END $$   
DELIMITER;

    


DELIMITER $$
create trigger trig_aggiungiColore after insert on prodotto
FOR EACH ROW
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE col int;
    DECLARE cursor1 CURSOR FOR select coloreID from oggetto_colore where oggettoID = NEW.oggettoID;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cursor1;
    mLoop: LOOP 
    FETCH cursor1 INTO col;
    IF done THEN
      LEAVE mLoop;
    END IF;
    insert into colore_abilitato(oggettoID,artID,coloreID) values (NEW.oggettoID,NEW.artID,col);
    END LOOP;
    CLOSE cursor1;
END$$
DELIMITER;









DELIMITER $$ 
create trigger trig_du BEFORE DELETE ON utenti 
FOR EACH ROW
BEGIN 
     delete from art where utenteID=OLD.id;
     delete from collection where utenteID=OLD.id;
     delete from post where utenteID=OLD.id;
     delete from piace_post where utenteID=OLD.id;
     delete from piace_art where utenteID=OLD.id;
     delete from commenti where utenteID=OLD.id;
     delete from segue where utente1=OLD.id;
     delete from segue where utente2=OLD.id;   
END $$
DELIMITER;



DELIMITER $$ 
create trigger trig_artDel BEFORE DELETE ON art
FOR EACH ROW
BEGIN 
    delete from artInCat where artID=OLD.id;
    delete from tag where artID=OLD.id;
    delete from piace_art where artID=OLD.id;
    delete from commenti where artID=OLD.id;
    delete from art_collection where artID=OLD.id;
    delete from prodotto where artID=OLD.id;
END$$


DELIMITER $$ 
create trigger trig_prodottoDel BEFORE DELETE ON prodotto
FOR EACH ROW
BEGIN 
    delete from colore_abilitato where artID=OLD.artID and oggettoID= OLD.oggettoID;
    delete from carrello where artID=OLD.artID and oggettoID = OLD.oggettoID;
END $$


DELIMITER $$ 
create trigger trig_postDel BEFORE DELETE ON post
FOR EACH ROW
BEGIN 
    delete from  piace_post where postID = OLD.id;
END $$
DELIMITER;









