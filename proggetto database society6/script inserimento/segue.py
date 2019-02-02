import MySQLdb
import csv
import csv
import string
import random
import time

def segue(x,y):
    try:
        cur.execute("INSERT INTO segue(utente1,utente2) VALUES('{}','{}');".format(x,y))
    except:
        print(x,y)


db = MySQLdb.connect(host="localhost",    # your host, usually localhost
                     user="root",         # your username
                     passwd="toor",  # your password
                     db="society6")        # name of the data base
cur = db.cursor()
i=205
x=3
while (i < 103262):
    f=open('file.txt','w+')
    stri= "INSERT INTO segue(utente1,utente2) VALUES"
    while(x <103262):
        stri = stri +"({},{}),".format(x,i)
        x=x+1
    x=3
    f.write(' dd '+str(i)+' dd ')
    f.close()
    stri=stri[:-1]+';'
    i=i+1
    cur.execute(stri)
    db.commit()
db.close()
'''
for x in range(i,103260):
    stri= "INSERT INTO segue(utente1,utente2) VALUES"
    for i in range(x,103260):    
        if(x!=i and x != 2 and i !=2):
            stri = stri +"({},{}),".format(x,i)
    
    stri=stri[:-1]+';'
    cur.execute(stri)
    db.commit()
   ''' 

    
    




