
---------------------------------------------------------------------------------------
1
selezionare tutti gli oggetti e i possibili colori che possono avere
select oggetto.nome,colore.colore from oggetto,colore,oggetto_colore where colore.id = oggetto_colore.coloreID and oggetto_colore.oggettoID=oggetto.id order by oggetto.nome;
41 rows in set (0.01 sec)
-----------------------------------------------------------------------------------------------------------------------
seleziona tutti gli utenti con nome email e quante art hanno pubblicato rdinato per il numero di art
select distinct utenti.nome,utenti.email,count(utenti.nome) from  utenti JOIN art ON utenti.id = art.utenteID  GROUP BY utenti.nome order by count(utenti.nome) desc;
67361 rows in set (0.32 sec)
-----------------------------------------------------------------------------------------------------
selezionare tutti gli utenti che hanno comprato un prodotto di colore rosso con where 
select utenti.nome from utenti,compravendite,colore where utenti.id = compravendite.compratore and compravendite.coloreID = colore.id and colore.colore = 'rosso';
9579 rows in set (0.05 sec)
--------------------------------------------------------------------------------------------------------------------------
selezionare tutti gli utenti che hanno venduto un prodotto di colore rosso con JOIN
select utenti.nome from utenti join compravendite inner join colore ON utenti.id = compravendite.compratore and compravendite.coloreID = colore.id and colore.colore = 'rosso';
9579 rows in set (0.05 sec)


------------------------------------------------------------------------------------------------------------------------------------------------------------------
selezionare rispettivamente id art il titolo dell'art' e quante volte è stata venduta e quanti mipiace gli sono stati messi 
select art.id,art.titolo,count(art.id) ,piace from (select art.id as idartP,count(piace_art.artID) as piace from art,piace_art where art.id =piace_art.artID GROUP BY piace_art.artID) as pic,art,compravendite where art.id = compravendite.artID and pic.idartP = art.id GROUP BY art.id;
86563 rows in set (6.11 sec)
86563 rows in set (1.98 sec)
86563 rows in set (1.94 sec)
86563 rows in set (1.95 sec)


select straight_join art.id,art.titolo,count(art.id) ,piace from compravendite,(select straight_join art.id as idartP,count(piace_art.artID) as piace from piace_art,art where art.id =piace_art.artID GROUP BY piace_art.artID) as pic,art where art.id = compravendite.artID and pic.idartP = art.id GROUP BY art.id;
86563 rows in set (5.21 sec)
86563 rows in set (1.50 sec)
86563 rows in set (1.43 sec)
86563 rows in set (1.43 sec)

create index 


------------------------------------------------------------------------------------------------------------------------------------------------------
selezionare rispettivamente gli utenti che hanno venduto e il totale di quanto hanno venduto
select utenti.nome,sum(taglia_oggetto.prezzo) from utenti,compravendite,taglia_oggetto where utenti.id = compravendite.venditore and compravendite.oggettoID = taglia_oggetto.oggettoID and compravendite.tagliaID GROUP by utenti.id;
38375 rows in set (0.99 sec)


-------------------------------------------------------------------------------------------------------------------

selezionare tutti i colori e quanti prodotti sono stati venduti con quel colore
select colore.colore,count(colore.id) from colore,compravendite where colore.id = compravendite.coloreID GROUP by colore.id;

--------------------------------------------------------------------------------------------------------------------------------------------------
selezionare i primi 10 utenti con più follower e quanti follower hanno 
select utenti.nome,count(kk.id) from segue,utenti,utenti as kk where utenti.id = segue.utente1 and kk.id = segue.utente2  GROUP by utenti.id limit 10
10 rows in set (0.04 sec)
--------------------------------------------------------------------------------------------------------------
    selezionare i primi 10 utenti cche seguono più utenti e quanti utenti seguono
    select utenti.nome,count(kk.id) from utenti,segue,utenti as kk where utenti.id = segue.utente2 and kk.id = segue.utente1  GROUP by utenti.id limit 10

create index utenteNome on utenti(nome);
10 rows in set (1 min 26.43 sec)
create index segueee on segue(utente2)
ALTER TABLE segue DROP INDEX segueee;
---------------------------------------------------------------------------------------------

drop index nomeUtete;

ALTER TABLE utenti DROP INDEX nomeUtete;


------------------------------------------------------------------------------------------------------
selezionare  tutte le art con le collection di cui fa parte 
senza group_concat
select art.id,art.titolo,collection.titolo from art,collection,art_collection where collection.id = art_collection.collectionID  and art.id = art_collection.artID
450287 rows in set (6.16 sec)

con group_concat
select art.id,art.titolo,group_concat(collection.titolo) from art,collection,art_collection where collection.id = art_collection.collectionID  and art.id = art_collection.artID GROUP by art.id
170834 rows in set (3.12 sec)
170834 rows in set (2.27 sec)
170834 rows in set (2.11 sec)
170834 rows in set (2.20 sec)
170834 rows in set (2.11 sec)


select straight_join art.id,art.titolo,group_concat(collection.titolo) from art_collection ,collection,art where collection.id = art_collection.collectionID  and art.id = art_collection.artID GROUP by art.id
170834 rows in set (4.33 sec)
170834 rows in set (1.32 sec)
170834 rows in set (1.29 sec)
170834 rows in set (1.20 sec)
170834 rows in set (1.20 sec)



create index titolo on art(titolo);
create index tit on collection(titolo)


--------------------------------------------------------------------------------
selezionare tutti i prodotti con il nome dell art e dell ogetto
select art.titolo,oggetto.nome from art,prodotto,oggetto where oggetto.id = prodotto.oggettoID and art.id = prodotto.artID;
4215540 rows in set (1 min 4.34 sec)

select straight_join art.titolo,oggetto.nome from art,oggetto,prodotto where oggetto.id = prodotto.oggettoID and art.id = prodotto.artID
4215540 rows in set (8 min 8.46 sec)

select straight_join art.titolo,oggetto.nome from prodotto,oggetto,art where oggetto.id = prodotto.oggettoID and art.id = prodotto.artID
4215540 rows in set (12.12 sec)

----------------------------------------------------------------------------------------------------------------
selezionare gli utenti  ciccioni 
select utenti.nome from utenti,compravendite,taglia where utenti.id = compravendite.compratore and compravendite.tagliaID = taglia.id and taglia.taglia = 'XL';
4917 rows in set (0.08 sec)
-----------------------------------------------------------------------------------------------

selezionare tutti gli utenti che hanno comprato lo stesso prodotto

con alias 
select utenti.nome from utenti,compravendite as ven,compravendite,utenti as com where utenti.id = compravendite.compratore and  com.id = ven.compratore and utenti.id != com.id and compravendite.artID = ven.artID and compravendite.oggettoID= ven.oggettoID limit 1000;
1000 rows in set (1 min 44.02 sec)

con select nitificata
select utenti.nome from utenti,compravendite,(select utenti.id as id1,compravendite.oggettoID as oggID,compravendite.artID as arID from utenti,compravendite  where utenti.id = compravendite.compratore) as comp where utenti.id = compravendite.compratore and utenti.id != comp.id1 and compravendite.oggettoID = comp.oggID and compravendite.artID = comp.arID limit 1000; 
1000 rows in set (2 min 10.84 sec)

--------------------------------------------------------------------------------------------------
 selezionare tutte le art di un utenti che hanno 'mar' contenuto nel nome 

select art.id,art.titolo,utenti.nome from art,utenti where art.utenteID = utenti.id and utenti.nome  LIKE '%mar%'
6759 rows in set (0.19 sec)
--------------------------------------------------------------------------------
selezinare le art che hanno almeno 70 mipiace ,che sono state vendute almeno 5 volte e che sono presenti almeno 6 volte nel carrello
select straight_join art.id,art.titolo from compravendite,art,carrello,piace_art where art.id = piace_art.artID and art.id = carrello.artID and compravendite.artID= art.id GROUP by art.id having count(piace_art.artID) > 70 and count(compravendite.artID)>5 and count(carrello.artID)>6 
8844 rows in set (11.98 sec)

select  art.id,art.titolo from compravendite,art,carrello,piace_art where art.id = piace_art.artID and art.id = carrello.artID and compravendite.artID= art.id GROUP by art.id having count(piace_art.artID) > 70 and count(compravendite.artID)>5 and count(carrello.artID)>6 
8844 rows in set (4.73 sec)

create index artTit on art(titolo)

create index compr on art(titolo)
8844 rows in set (5.19 sec)


-----------------------------------------------------------------------------------

selezionare il nome di tutte le categorieArt che in cui vi sono almeno 3 art
select categorieArt.nome from categorieArt,art,artInCat where art.id = artInCat.artID and artInCat.categoriaID = categorieArt.id GROUP by categorieArt.id having count(art.id) >3;
26 rows in set (11.86 sec)
26 rows in set (2.18 sec)
26 rows in set (2.18 sec)
26 rows in set (2.25 sec)
select straight_join categorieArt.nome from artInCat,categorieArt,art where art.id = artInCat.artID and artInCat.categoriaID = categorieArt.id GROUP by categorieArt.id having count(art.id) >3;
26 rows in set (2.89 sec)
26 rows in set (0.81 sec)
26 rows in set (0.81 sec)
26 rows in set (0.80 sec)
------------------------------------------------------------------------------------------
selezionare il nome della categoria ,id categoria, e quante art ci sono nella categoria e il titolo delle art nella categoria
select categorieArt.id,categorieArt.nome,count(art.id),group_concat(art.titolo) from categorieArt,art,artInCat where art.id = artInCat.artID and artInCat.categoriaID = categorieArt.id GROUP by categorieArt.id;
26 rows in set, 26 warnings (12.39 sec)
26 rows in set, 26 warnings (1.41 sec)
26 rows in set, 26 warnings (2.71 sec)


select straight_join categorieArt.id,categorieArt.nome,count(art.id),group_concat(art.titolo) from artInCat,categorieArt,art where art.id = artInCat.artID and artInCat.categoriaID = categorieArt.id GROUP by categorieArt.id;
26 rows in set, 26 warnings (5.95 sec)
26 rows in set, 26 warnings (1.87 sec)
26 rows in set, 26 warnings (1.76 sec)

select categorieArt.id,categorieArt.nome,count(art.id) from categorieArt,art,artInCat where art.id = artInCat.artID and artInCat.categoriaID = categorieArt.id GROUP by categorieArt.id;
26 rows in set (2.64 sec)
--------------------------------------------------------------------------------------------------------------------
selezionare tutte le art degli utenti seguiti di uno specifico utente 

select art.id,art.titolo from utenti,segue,art,utenti as kk where  kk.id= segue.utente1 and utenti.id = segue.utente2 and kk.id = art.utenteID and utenti.nome = 'Adelina0';
200739 rows in set (4.74 sec)


select star art.id,art.titolo from utenti,segue,art,utenti as kk where  kk.id= segue.utente1 and utenti.id = segue.utente2 and kk.id = art.utenteID and utenti.nome = 'Adelina0';
infinito 

select straight_join art.id,art.titolo from art,utenti,segue,utenti as kk where  kk.id= segue.utente1 and utenti.id = segue.utente2 and kk.id = art.utenteID and utenti.nome = 'Adelina0';
200739 rows in set (4.77 sec)

------------------------------------------------------------------------------------------------------
selezionare tutti gli utenti seguiti da uno specifico utente

103259 rows in set (47.73 sec)
SELECT straight_join kk.nome from  utenti as kk,utenti,segue where kk.nome != utenti.nome and kk.id= segue.utente1 and utenti.id = segue.utente2 and utenti.nome = 'Adam0';
103259 rows in set (47.73 sec)

SELECT kk.nome from  utenti as kk,utenti,segue where  utenti.id= segue.utente1 and kk.id = segue.utente2 and utenti.nome = 'Adam0';


ALTER TABLE utenti  DROP INDEX utenteNome;
create index utenteNome on utenti(nome);
26 rows in set (2.64 sec)
var inizio = new Date()
db.utentiSegue.find({nome:'caglio'})
var fine= new Date()
var risultato = fine - inizio
risultato/1000

var inizio = new Date()
db.utentiSegue.find({segue:'Adam0'},{_id:0,id:0,email:0,password:0,segue:0})
var fine= new Date()
var risultato = fine - inizio
risultato/1000


var inizio = new Date()
db.utentiSegue.find({nome:'Adam0'},{_id:0,id:0,email:0,password:0})
var fine= new Date()
var risultato = fine - inizio
risultato/1000





risultato/1000


var inizio = new Date()
db.utentiSegue.find({nome:'Adam0'},{_id:0,id:0,email:0,password:0,nome:0})
var fine= new Date()
var risultato = fine - inizio
risultato/1000 + ' secondi'



-------------------------------------------------------------------------
dati due nomi utenti determinare se si seguono

select utenti.nome,ut.nome from segue,utenti,utenti as ut where utenti.id = segue.utente1 and ut.id = segue.utente2 and utenti.nome="Adelina1" and ut.nome="Adelina0";

------------------------------------------------------------------

selezionare i followers di uno specifico utente
select utenti.nome from utenti,segue, utenti as kk where   kk.nome != utenti.nome and kk.id= segue.utente1 and utenti.id = segue.utente2 and kk.nome = 'Sonia0';

803 rows in set (0.03 sec)
-------------------------------------------------------------------------------------------------------------------------

selezionare tutte le art che hanno il nome del tag che contine 'PORC'
select art.titolo,tag.nome from art,tag where art.id = tag.artID and tag.nome  LIKE '%PORC%';

-------------------------------------------------------------------------------------------------------------------------------
selezionare il titolo di tutte le categorie,art e tutte le collection con almeno una art in comune con titlo dell'art' che contiene la parola 'artx' eche è stata venduta di meno di 7 volte
e quante volte ha venduto

select  art.titolo,count(art.id), collection.titolo,categorieArt.nome from compravendite,collection,categorieArt,art_collection,artInCat,art where 
categorieArt.id = artInCat.categoriaID and collection.id = art_collection.collectionID and art.id = artInCat.artID and art.id = art_collection.artID 
and art.titolo like '%artx%' and compravendite.artID = art.id  GROUP by art.id having count(art.id) <7;

 -----------------------------------------

selezionare nomi degli oggetti e per ognuno determinare quante volte è stato venduto e da quanti utenti è stato comprato 
select oggetto.nome ,count(oggetto.id) from oggetto,compravendite where oggetto.id = compravendite.oggettoID  GROUP by(oggetto.id);




-
-----------------------------------------------------------------------
selezionare il nome dell'oggetto' e il colore con il quale è stato venduto e quanti oggetti sono stati venduti con quel colore 
select oggetto.nome,colore.colore, count(colore.colore) from compravendite,colore,oggetto where oggetto.id = compravendite.oggettoID and colore.id = compravendite.coloreID GROUP by oggetto.id,colore.id;



----------------------------------------------------------------------------
selezionare il nome dell'oggetto' e il colore con il quale è stato venduto di più e quanti oggetti sono stati venduti con quel colore 

select tab.ogg, max( tab.kk ), tab.cc from
(select oggetto.nome as ogg,colore.colore as cc, count(colore.colore) as kk from compravendite,colore,oggetto where oggetto.id = compravendite.oggettoID and colore.id = compravendite.coloreID GROUP by oggetto.id,colore.id order by kk desc)as tab
GROUP by tab.ogg; 



select oggetto.nome,count(oggetto.id),colore.colore from compravendite,oggetto,colore where oggetto.id= compravendite.oggettoID and colore.id=compravendite.coloreID and oggetto.nome='coffe mug' and colore.colore= 'rosso';                                             


select  oggetto.nome, colore.colore from compravendite,oggetto,colore, 
select compravendite.oggettoID as ogg,count(utenti.id) as co from compravendite,utenti where utenti.id=compravendite.compratore GROUP by (oggettoID);


SELECT nome,email,password,utente2 as segue FROM utenti,segue where utente1 = utente1.id
SELECT utenti.id,utenti.nome,utenti.email,utenti.password,segueU.nome as segue FROM utenti,utenti as segueU,segue where segue.utente1 = utenti.id and segue.utente2 = segueU.id into outfile '/mnt/c/Users/naddi/Documents/database society6/utentiSegue.csv' fields enclosed by '"' terminated by ',' lines terminated by '\n'

create index artcol on art_collection(artID);
ALTER TABLE art_collection  DROP INDEX artcol;
create index utenteNome on utenti(nome);
create index titolo on art(titolo);
create index tit on collection(titolo)
create index artTit on art(titolo)



ALTER TABLE utenti  DROP INDEX utenteNome;
alter table art drop index titolo;
alter table collection drop index tit;
alter table art drop index artTit;


var inizio = new Date()
db.utentiSegue.find({segue:'Adam0'})
var fine= new Date()
var risultato = fine - inizio
risultato/1000





mongoimport -d society6 -c utentiSegue --type csv --file utentiSegue.csv --fields "id","nome","email","password","segue"