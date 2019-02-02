create database society6;
use society6

create table utenti (
    id bigint auto_increment NOT NULL,
    nome varchar(30) NOT NULL UNIQUE,
    email varchar(50) NOT NULL UNIQUE,
    password varchar(100) not null,
    data TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    primary key(id)
);


create table post(
    id bigint auto_increment NOT NULL,
    testo varchar(500) not null,
    titolo varchar(50) not null,
    utenteID bigint not null,
    data TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    primary key(id),
    foreign key (utenteID) references utenti(id)
);

create table piace_post(
    utenteID bigint not null,
    postID bigint not null,
    foreign key (utenteID) references utenti(id),
    foreign key (postID) references post(id),
    primary key(postID,utenteID)
);


--utente1 segue utente2
create table segue(
    utente1 bigint not null,
    utente2 bigint not null,
    foreign key (utente1) references utenti(id),
    foreign key (utente2) references utenti(id),
    primary key(utente1,utente2)
--not working  CONSTRAINT ck_segue CHECK (utente1 != utente2)
);

create table art(
    id bigint auto_increment NOT NULL,
    titolo varchar(50) not null,
    testo varchar(500) not null,
    utenteID bigint not null,
    data TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    primary key(id),
    foreign key (utenteID) references utenti(id)
);

create table piace_art(
    utenteID bigint not null,
    artID bigint not null,
    foreign key (utenteID) references utenti(id),
    foreign key (artID) references art(id),
    primary key(artID,utenteID)
);

create table tag(
    artID bigint not null,
    nome varchar(10) not null,
    foreign key (artID) references art(id),
    primary key(artID,nome)
);

create table categorieArt(
    id int auto_increment,
    nome varchar(20) not null,
    descrizione varchar(200) not null,
    primary key(id) 
);

create table artInCat(
    categoriaID int not null,
    artID bigint,
    primary key(categoriaID,artID),
    foreign key (artID) references art(id),
    foreign key (categoriaID) references categorieArt(id)
);

create table commenti(
    id int auto_increment,
    commento varchar(500) not null,
    data TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    utenteID bigint not null,
    artID bigint not null,
    foreign key (artID) references art(id),
    foreign key (utenteID) references utenti(id),
    primary key(id)
);

create table collection(
    id bigint auto_increment,
    titolo varchar(30) not null, 
    utenteID bigint not null,
    descrizione varchar(20) not null,
    data TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    foreign key (utenteID) references utenti(id),
    primary key(id),
    unique(utenteID,titolo)
);


create table art_collection(
    collectionID bigint not null,
    artID bigint not null,
    foreign key (artID) references art(id),
    foreign key (collectionID) references collection(id),
    primary key(collectionID,artID) 
);
ALTER TABLE art_collection ADD  primary key (collectionID,artID);



create table categorieOggetto(
    id int auto_increment,
    nome varchar(20) not null,
    descrizione varchar(200) not null,
    primary key(id) 
);

create table oggetto(
    id int auto_increment,
    nome varchar(20) not null,
    descrizione varchar(200) not null,
    categoriaID int not null,
    foreign key (categoriaID) references categorieOggetto(id),
    primary key (id)
);




create table colore(
    id int auto_increment,
    colore varchar(20) not null,
    primary key(id)
);

create table oggetto_colore(
    coloreID int not null,
    oggettoID int not null,
    foreign key (oggettoID) references oggetto(id),
    foreign key (coloreID) references colore(id),
    primary key(coloreID,oggettoID)
);

create table prodotto(
    oggettoID int not null,
    artID bigint not null,
    foreign key (oggettoID) references oggetto(id),
    foreign key (artID) references art(id),
    primary key(oggettoID,artID) 
);

create table colore_abilitato(
    oggettoID int not null,
    artID bigint not null,
    coloreID int not null,
    foreign key (oggettoID) references oggetto(id),
    foreign key (artID) references art(id),
    foreign key (coloreID) references colore(id),
    primary key(oggettoID,artID,coloreID) 
);



create table taglia(
    id int auto_increment,
    taglia varchar(20) not null,
    primary key(id)
);




create table taglia_oggetto(
    tagliaID int not null,
    oggettoID int not null,
    prezzo int not null,
    primary key(oggettoID,tagliaID),
    foreign key(tagliaID) references taglia(id),
    foreign key (oggettoID) references oggetto(id)
);


create table carrello(
    id bigint auto_increment not null,
    utenteID bigint not null,
    artID bigint not null,
    oggettoID int not null,
    tagliaID int not null,
    coloreID int not null,
    primary key(id),
    foreign key(oggettoID,tagliaID)  references taglia_oggetto(oggettoID,tagliaID) ,
    foreign key (artID,oggettoID) references prodotto(artID,oggettoID),
    foreign key (coloreID,oggettoID) references oggetto_colore(coloreID,oggettoID),
    foreign key (utenteID) references utenti(id)
);

create table carrello(
    id bigint auto_increment not null,
    utenteID bigint not null,
    artID bigint not null,
    oggettoID int not null,
    tagliaID int not null,
    coloreID int not null,
    primary key(id),
    foreign key(oggettoID,tagliaID)  references taglia_oggetto(oggettoID,tagliaID),
    foreign key (artID,oggettoID) references prodotto(artID,oggettoID),
    foreign key (coloreID,oggettoID,artID) references colore_abilitato(artID,coloreID,oggettoID),
    foreign key (utenteID) references utenti(id)
);

ALTER TABLE carrello ADD  foreign key (coloreID,oggettoID,artID) references colore_abilitato(artID,coloreID,oggettoID);


create table compravendite(
    id bigint auto_increment not null,
    compratore bigint not null,
    venditore bigint not null,
    artID bigint not null,
    oggettoID int not null,
    tagliaID int not null,
    coloreID int not null,  
    primary key(id)
);


create table logs(
    id bigint auto_increment,
    aint int,
    bint int,
    cbig int,
    primary key(id)
);







