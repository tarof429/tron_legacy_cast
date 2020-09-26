#!/usr/bin/python

import json
import pymysql
import api_client_lib
import os

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

if __name__ == '__main__':
    print('standalone_client starting...')

    try:
        client = getClient()

        client.connect()
        
        print(25 * '*')

        result = client.fetchAll()
        print (json.dumps(result))

        print(25 * '*')
        
        result = client.fetchByName('Daft Punk')
        print (json.dumps(result))

        print(25 * '*')

        result = client.fetchByMovieName('Jarvis')
        print (json.dumps(result))

    finally:
        client.close_connection()