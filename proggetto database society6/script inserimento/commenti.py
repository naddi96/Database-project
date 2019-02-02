


#oggetto
import MySQLdb
import csv
import csv
import string
import random
import time


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

    

db = MySQLdb.connect(host="localhost",    # your host, usually localhost
                     user="root",         # your username
                     passwd="toor",  # your password
                     db="society6")        # name of the data base
cur = db.cursor()

stri= "insert into commenti(utenteID,artID,commento) values "

utente=4
while utente < 100000:

    for i in range(1,random.randint(1,10)):
        art = random.randint(4,100000)
        commento = 'commento '+''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(11))
        stri = stri +  "('{}','{}','{}'),".format(utente,art,commento)
    utente=utente+5
stri=stri[:-1]+';'
#print(stri)
cur.execute(stri)
print(utente)
db.commit()
db.close()

