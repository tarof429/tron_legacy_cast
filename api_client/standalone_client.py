#!/usr/bin/python

import json
import pymysql
import api_client_lib

if __name__ == '__main__':
    print('standalone_client starting...')

    try:
        client = api_client_lib.ApiClient(host='db', user='tron', password='secret', db='movie')
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