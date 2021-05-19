# Import the Flask module that has been installed.
from flask import Flask, jsonify, request
import pymongo
from bson.json_util import dumps, loads
import json

from pymongo import MongoClient
uri = "mongodb://root:example@mongo-srv:27017/default_db?authSource=admin"
myclient = MongoClient(uri)

base_de_donnees = myclient["docker"]
donnees_users = base_de_donnees["users"]

# Creating a new "app" by using the Flask constructor. Passes __name__ as a parameter.
app = Flask(__name__)
    
@app.route("/", methods=["GET"])
def get_users():
    return '<form action="http://localhost:80" method="POST"><label for="fname">First name: </label><input type="text" id="fname" name="fname"><br><br><input type="submit" value="Submit"></form> '
    
@app.route("/", methods=["POST"])
def add_user():
    usr = request.form['fname']
    donnees_users.insert_one({"name": usr })
    return "User " + usr + " ajoute"
