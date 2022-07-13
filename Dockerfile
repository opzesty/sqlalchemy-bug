FROM tiangolo/uwsgi-nginx-flask:python3.10

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29 \
    && echo "deb http://repo.mysql.com/apt/debian/ buster mysql-8.0" > /etc/apt/sources.list.d/mysql.list  \ 
    #&& echo "deb http://repo.mysql.com/apt/debian/ buster connector-python-8.0" > /etc/apt/sources.list.d/mysql.list  \ 
    && apt-get update \ 
    && apt install python3-dev build-essential \
    && pip3 install sqlalchemy mysqlclient

WORKDIR /app

COPY ./sqlalchemy-tester.py /app/sqlalchemy-tester.py

RUN chmod +x /app/sqlalchemy-tester.py

CMD [ "python3", "sqlalchemy-tester.py"]
