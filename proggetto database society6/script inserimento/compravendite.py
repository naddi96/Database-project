
#oggetto
import MySQLdb
import csv
import csv
import string
import random
import time



    

db = MySQLdb.connect(host="localhost",    # your host, usually localhost
                     user="root",         # your username
                     passwd="toor",  # your password
                     db="society6")        # name of the data base





def getColTag(ogg):
    taglia = []
    colore=[]
    cur.execute('select * from taglia_oggetto')
    tag =cur.fetchall()
    for i in tag:
        if (i[1] == ogg):
            taglia.append(i[0])
    cur.execute('select * from oggetto_colore')
    col=cur.fetchall()
    for i in col:
        if (i[1] == ogg):
            colore.append(i[0])
    return {'taglia':random.choice(taglia),'colore':random.choice(colore)}

def getProprietaro(artid):
    cur.execute('select utenteID from art where id='+str(artid))
    pro=cur.fetchall()
    return pro[0][0]

cur = db.cursor()
stri="insert into compravendite(compratore,venditore,artID,oggettoID,tagliaID,coloreID) values "
getProprietaro(4)
utente=1
while utente < 100000:

    for i in range(1,random.randint(1,10)):
        ogg = random.randint(1,21)
        art = random.randint(4,100000)
        colTag= getColTag(ogg)
        venditore = getProprietaro(art)
        stri = stri +  "('{}','{}','{}','{}','{}','{}'),".format(utente,venditore,art,ogg,colTag['taglia'],colTag['colore'])
    utente=utente+11
stri=stri[:-1]+';'
#print(stri)
cur.execute(stri)
print(utente)
db.commit()
db.close()

