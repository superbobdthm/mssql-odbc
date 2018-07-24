#!/usr/bin/env python3
from sqlalchemy import create_engine

conn_str = 'mssql+pyodbc://user:password@testserver.testdb/?charset=latin1,driver=ODBC+Driver+17+for+SQL+Server'
engine = create_engine(conn_str, echo=True)
conn = engine.connect()