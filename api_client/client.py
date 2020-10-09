#!/usr/bin/python

from flask import Flask
import json
import api_client_lib
import os

app = Flask(__name__)

dbHost = os.environ['MYSQL_HOST']
dblUser = os.environ['MYSQL_USER']
dbPassword = os.environ['MYSQL_PASSWORD']
dbDatabase = os.environ['MYSQL_DATABASE']
client = None

def getClient():
    global client
    if client == None:
        client = api_client_lib.ApiClient(host=dbHost, user=dblUser, password=dbPassword, db=dbDatabase)
    return client

@app.route('/hello')
def hello_world():
    return 'Hello from api-client!\n'

@app.route('/all')
def get_all():
    
    client = getClient()
  
    try:
        client.connect()
        result = client.fetchAll()
    finally:
        client.close_connection()
    
    return json.dumps(result)

@app.route('/name/<name>')
def get_by_name(name):

    client = getClient()
  
    try:
        client.connect()
        result = client.fetchByName(name)
    finally:
        client.close_connection()
    
    return json.dumps(result)

# An alias for get_by_name
@app.route('/n/<name>')
def get_n(name):
    return get_by_name(name)

@app.route('/movie_name/<name>')
def get_by_movie_name(name):

    client = getClient()
  
    try:
        client.connect()
        result = client.fetchByMovieName(name)
    finally:
        client.close_connection()
    
    return json.dumps(result)

if __name__ == '__main__':
    app.run(host='0.0.0.0')