FROM ubuntu:16.04

RUN apt-get update && apt-get -y install python3-pip curl apt-transport-https

RUN curl -s https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
curl -s https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
apt-get update && ACCEPT_EULA=Y apt-get -y install msodbcsql17 && apt install -y unixodbc-dev

RUN pip3 install sqlalchemy pyodbc

COPY odbc.ini /etc/

RUN mkdir /opt/test
COPY testSQL.py /opt/test/
RUN chmod +x /opt/test/testSQL.py

CMD [ "/opt/test/testSQL.py" ]