import json
import pymysql
import logging

class ApiClient:

    def __init__(self, host, user, password, db, charset='utf8mb4'):
        self.host = host
        self.user = user
        self.password = password
        self.db = db
        self.charset = charset
        logging.basicConfig(level=logging.DEBUG)

    def connect(self):
        self.conn = pymysql.connect(
            host=self.host, user=self.user, password=self.password, db=self.db, charset=self.charset, cursorclass=pymysql.cursors.DictCursor)

    def fetchAll(self):
        with self.conn.cursor() as cursor:
            sql = "SELECT `name`, `movie_name` FROM `cast`"
            cursor.execute(sql)
            result = cursor.fetchall()
            return json.dumps(result)

    def fetchByName(self, name):
        with self.conn.cursor() as cursor:
            sql = "SELECT `name`, `movie_name` FROM `cast` WHERE `name`=%s"
            logging.debug('Issuing query: {0}'.format(sql))
            cursor.execute(sql, (name))
            result = cursor.fetchall()
            return json.dumps(result) 

    def fetchByMovieName(self, movie_name):
        with self.conn.cursor() as cursor:
            sql = "SELECT `name`, `movie_name` FROM `cast` WHERE `movie_name`=%s"
            cursor.execute(sql, (movie_name))
            result = cursor.fetchall()
            return json.dumps(result) 

    def insert(self, name, movie_name):
        with self.conn.cursor() as cursor:
            sql = "INSERT INTO `cast` (`name`, `movie_name`) VALUES (%s, %s)"
            cursor.execute(sql, (name, movie_name))

    def close_connection(self):
        self.conn.close()

