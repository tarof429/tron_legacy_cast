#!/usr/bin/python

from flask import Flask
import json
import api_client_lib

app = Flask(__name__)

@app.route('/hello')
def hello_world():
    return 'Hello!\n'

@app.route('/all')
def get_all():
    
    client = api_client_lib.ApiClient(host='db', user='tron', password='secret', db='movie')
  
    try:
        client.connect()
        result = client.fetchAll()
    finally:
        client.close_connection()
    
    return json.dumps(result)

@app.route('/name/<name>')
def get_by_name(name):

    client = api_client_lib.ApiClient(host='db', user='tron', password='secret', db='movie')
  
    try:
        client.connect()
        result = client.fetchByName(name)
    finally:
        client.close_connection()
    
    return json.dumps(result)

@app.route('/movie_name/<name>')
def get_by_movie_name(name):

    client = api_client_lib.ApiClient(host='db', user='tron', password='secret', db='movie')
  
    try:
        client.connect()
        result = client.fetchByMovieName(name)
    finally:
        client.close_connection()
    
    return json.dumps(result)

@app.route('/user/<username>')
def show_user_profile(username):
    # show the user profile for that user
    return 'User %s' % escape(username)

if __name__ == '__main__':
    app.run(host='0.0.0.0')