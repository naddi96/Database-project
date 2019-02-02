import MySQLdb
import csv
import csv
import string
import random

db = MySQLdb.connect(host="localhost",    # your host, usually localhost
                     user="root",         # your username
                     passwd="toor",  # your password
                     db="society6")        # name of the data base

cur = db.cursor()
for i in range(1,22):
    if(i==1 or i==3 or i==4 or i==13 or i==14 or i==20 or i==21 or i==22):
        cur.execute("insert into taglia_oggetto(tagliaID,oggettoID,prezzo) values ({},{},{});".format(10,i,random.randint(10, 100)))
        db.commit()
    elif(i==2 or i==5 or i==6 ):
        for x in range(1,7):
            cur.execute("insert into taglia_oggetto(tagliaID,oggettoID,prezzo) values ({},{},{});".format(x,i,random.randint(10, 100)))
            db.commit()
    else:
        for x in range(8,10):
            cur.execute("insert into taglia_oggetto(tagliaID,oggettoID,prezzo) values ({},{},{});".format(x,i,random.randint(10, 100)))
            db.commit()
db.close()


