INSERT INTO utenti(nome,email,password) VALUES('tizio','tizio@as.it','blaba');
INSERT INTO utenti(nome,email,password) VALUES('caglio','caglio@as.it','bsaaba');
INSERT INTO utenti(nome,email,password) VALUES(2,'pippo','pippo@as.it','bsaaba');

INSERT INTO segue(utente1,utente2) VALUES('103200','100123');
INSERT INTO segue(utente1,utente2) VALUES('102210','103200');




INSERT into categorieOggetto(nome,descrizione) VALUES ('vestiti','abigliamento vestiario magliette ecc..')
INSERT into categorieOggetto(nome,descrizione) VALUES ('tecnologia','cover per iphon telefoni ecc..')
INSERT into categorieOggetto(nome,descrizione) VALUES ('quadri','quadri porttraoit ecc ecc ');
INSERT into categorieOggetto(nome,descrizione) VALUES ('bagno','bagno tappetini ecc ecc');
INSERT into categorieOggetto(nome,descrizione) VALUES ('mobili','mobili per la casa');
INSERT into categorieOggetto(nome,descrizione) VALUES ('tazze','tazze bichieri ecc');
INSERT into categorieOggetto(nome,descrizione) VALUES ('borse',' zaini borse ecc ecc');
INSERT into categorieOggetto(nome,descrizione) VALUES ('cuscini e lenzuola','bagno tappetini ecc ecc');
INSERT into categorieOggetto(nome,descrizione) VALUES ('stikers','stikers pellicole protezione ecc ecc');
INSERT into categorieOggetto(nome,descrizione) VALUES ('decorazioni','tende ecc');




INSERT into  oggetto(nome,descrizione,categoriaID) values ('cover iphone','cover per iphone',1);
INSERT into  oggetto(nome,descrizione,categoriaID) values ('cover laptop','cover per laptop',1);

INSERT into  oggetto(nome,descrizione,categoriaID) values ('maglietta uomo','maglietta uomo larga',2);
INSERT into  oggetto(nome,descrizione,categoriaID) values ('leggins','leggins per donna',2);

INSERT into  oggetto(nome,descrizione,categoriaID) values ('wall art','arte da muro',3);
INSERT into  oggetto(nome,descrizione,categoriaID) values ('canvas print','canvas',3);

INSERT into  oggetto(nome,descrizione,categoriaID) values ('tappetino','tappetino da bagno',4);
INSERT into  oggetto(nome,descrizione,categoriaID) values ('tenda da doccia','cover per laptop',4);

INSERT into  oggetto(nome,descrizione,categoriaID) values ('tavolo','tavolo con art',5);
INSERT into  oggetto(nome,descrizione,categoriaID) values ('sgabello','sgabello con art',5);

INSERT into  oggetto(nome,descrizione,categoriaID) values ('coffe mug','tazza da caffe',6);
INSERT into  oggetto(nome,descrizione,categoriaID) values ('borraccia','borraccia per liquidi',6);

INSERT into  oggetto(nome,descrizione,categoriaID) values ('zaino','zaiono classico',7);
INSERT into  oggetto(nome,descrizione,categoriaID) values ('borsa','borsa da donna',7);

INSERT into  oggetto(nome,descrizione,categoriaID) values ('piumone','piumone da letto',8);
INSERT into  oggetto(nome,descrizione,categoriaID) values ('cuscino quadrato',' cusciono di forma qadrata',8);

INSERT into  oggetto(nome,descrizione,categoriaID) values ('adesivo','adesivo classico',9);
INSERT into  oggetto(nome,descrizione,categoriaID) values ('adesivo per pc','fsadfdsfsdfco',9);

INSERT into  oggetto(nome,descrizione,categoriaID) values ('tenda per finestra','tenda molto bella',10);
INSERT into  oggetto(nome,descrizione,categoriaID) values ('tenda per porta','moltasdsad',10);



insert into categorieArt(nome,descrizione) values (categoria 1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et');
INSERT into art(titolo,testo,utenteID) values ('ceci ne pas une pipe','qualcosa',1);

insert into colore(colore) values ('rosso');
insert into colore(colore) values ('unico');
insert into colore(colore) values ('bianco');



insert into oggetto_colore(coloreID,oggettoID) values (1,2);
insert into oggetto_colore(coloreID,oggettoID) values (2,2);
insert into oggetto_colore(coloreID,oggettoID) values (3,2);
insert into oggetto_colore(coloreID,oggettoID) values (4,2);
insert into oggetto_colore(coloreID,oggettoID) values (5,2);
insert into oggetto_colore(coloreID,oggettoID) values (6,2);
insert into oggetto_colore(coloreID,oggettoID) values (7,1);

insert into taglia(taglia) values ('XXS'),('XS'),('S'),('M'),('L'),('XL'),('XXL'),('GRANDE'),('MEDIO'),('PICCOLO');
insert into taglia(taglia) values ('UNICA')




select oggetto.nome,colore.colore from oggetto,colore,oggetto_colore where colore.id = oggetto_colore.coloreID and oggetto_colore.oggettoID = oggetto.id;
select distinct utenti.id,utenti.nome,utenti.email,count(utenti.nome) from  utenti JOIN art ON utenti.id = art.utenteID  GROUP BY utenti.nome order by count(utenti.nome) ;

insert into compravendite(compratore,venditore,artID,oggettoID,tagliaID,coloreID) values(1,3,6,1,10,7)
insert into carrello(utenteID,artID,oggettoID,tagliaID,coloreID) va
delete from prodotto where  oggettoID=1 and artID=1;
insert into prodotto(oggettoID,artID) values (1,1)


