#!/bin/python3

from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
import os

user = os.environ.get('MYSQL_USER')
password = os.environ.get('MYSQL_PASSWORD')
host =  os.environ.get('MYSQL_HOST')
port = os.environ.get('MYSQL_PORT')
db = os.environ.get('MYSQL_DATABASE')

mysql_string = 'mysql+mysqlconnector://' + user + ':' + password + '@' + host + ':' + port  + '/' + db

engine = create_engine(mysql_string, pool_pre_ping=True)

Session = sessionmaker(bind=engine, expire_on_commit=False)

Base = declarative_base()

Base.metadata.create_all(engine)

print("Engine: {}\nSession: {}".format(engine, Session))
