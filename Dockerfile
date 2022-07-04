FROM tiangolo/uwsgi-nginx-flask:python3.10

RUN pip3 install sqlalchemy mysqlclient

WORKDIR /app

COPY ./sqlalchemy-tester.py /app/sqlalchemy-tester.py

RUN chmod +x /app/sqlalchemy-tester.py

CMD [ "python3", "sqlalchemy-tester.py"]
