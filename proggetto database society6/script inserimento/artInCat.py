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

des ="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

stri="insert into artInCat(artID,categoriaID) values "
for i in range(1,188054):
    k=random.randint(0,10)
    list=random.sample(range(1,27), k)
    for x in list:
        stri= stri+"('{}','{}'),".format(i,x)
stri=stri[:-1]+';'
cur.execute(stri)
db.commit()
db.close()


