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
cur = db.cursor()

i= 80000
stri = "INSERT into post(titolo,testo,utenteID) values "
while (i < 20000+20000+20000+20000+20000):
    

    for k in range(1,random.randint(1,5)):
        art='art'+''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(6))
        stri=stri+"('{}','{}',{}),".format(art,art+" Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip",i)
    i=i+1
stri=stri[:-1]+';'
print('inserimento')
cur.execute(stri)
print('commit')
db.commit()
print(i)
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

    
    

db.close()


