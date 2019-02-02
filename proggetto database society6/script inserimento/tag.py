
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



def randlist(k):
    list =[]
    for i in range(k):
        list.append(''.join(random.choice(string.ascii_uppercase ) for _ in range(6)))
    return list


cur = db.cursor()
i=  1
stri = "INSERT into tag(artID,nome) values "
#188055
#100000
#50000
while i< 50000:
    k=random.randint(0,20)
    list= randlist(k)
    for x in list:
        stri= stri+"('{}','{}'),".format(i,x)
    i=i+1
stri=stri[:-1]+';'
cur.execute(stri)
db.commit()

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

    
    

db.close()


