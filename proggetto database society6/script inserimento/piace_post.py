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

stri="insert into piace_post(utenteID,postID) values "
i=40000
while i< 50000:
    k=random.randint(0,100) #200740
    list=random.sample(range(1,10000), k)
    for x in list:
        stri= stri+"('{}','{}'),".format(i,x)
    i=1+i
stri=stri[:-1]+';'

#print(stri)
cur.execute(stri)
print(i)
db.commit()
db.close()


