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
gestori = ['@gmail.it','@yahoo.it','@libero.it','@webmail.com','@gestore.it']
file = open('nomi.csv','r')
lines=file.readlines()
for k in range(20):
    for x in lines:
        nome=x[:-2]+str(k)
        email=x[:-2]+str(k)+random.choice(gestori)
        password =''.join([random.choice(string.ascii_letters + string.digits) for n in random.xrange(32)])
        stri = "INSERT INTO utenti(nome,email,password) VALUES('{}','{}','{}')".format(nome,email,password)
        cur.execute(stri)
        db.commit()

db.close()