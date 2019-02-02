import MySQLdb
import csv

import string
import random

db = MySQLdb.connect(host="localhost",    # your host, usually localhost
                     user="root",         # your username
                     passwd="toor",  # your password
                     db="society6")        # name of the data base

cur = db.cursor()
des ="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
i=1
stri="insert into collection(titolo,utenteID,descrizione) values "
count=i
while i<20000:
    for x in range(1,random.randint(1,10)):
        stri= stri+"('{}','{}','{}'),".format('collection numero'+str(count),i,des)
        count=count+1
    i=i+5
stri=stri[:-1]+';'
cur.execute(stri)
db.commit()
db.close()


