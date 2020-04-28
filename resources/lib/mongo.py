from pymongo import MongoClient

# Host: ds155903.mlab.com
# Port: 55903
# User: qaninja
# Pwd: qaninja123
# Database: bikelovdb

# "mongodb://usuario:senha@servidor:porta/bancodedados"

client = MongoClient("mongodb://qaninja:qaninja123@ds155903.mlab.com:55903/bikelovdb")
db = client['bikelovdb']

def remove_bike(name):
    bikes = db['bikes']
    bikes.delete_many({'name': name})
