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
stri="insert into art_collection(artID,collectionID) values "
for i in range(1,18038):
    k=random.randint(0,50)
    list=random.sample(range(1,188055), k)
    for x in list:
        stri= stri+"('{}','{}'),".format(x,i)
stri=stri[:-1]+';'
cur.execute(stri)
db.commit()
db.close()


