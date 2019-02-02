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
    if(i==5 or i==6 or i==9 or i==13 or i==11 ):
      for x in range(1,6):
        cur.execute('insert into oggetto_colore(coloreID,oggettoID) values ({},{});'.format(x,i))
        db.commit()
        print(3)
    else:
        cur.execute('insert into oggetto_colore(coloreID,oggettoID) values ({},{});'.format(7,i))
        db.commit()

  
db.close()



        
            
