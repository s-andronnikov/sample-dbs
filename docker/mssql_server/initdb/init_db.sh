#!/bin/bash

set -e

# SELECT Name from sys.databases WHERE Name='lucasys';
# /opt/mssql-tools18/bin/sqlcmd -S ${MSSQL_SERVER_HOST} -U sa -P ${MSSQL_SERVER_SA_PASSWORD} -C -d "$MSSQL_SERVER_DATABASE" -i sample_data.sql || true
#  --     CREATE USER ${MSSQL_SERVER_USER} FOR LOGIN ${MSSQL_SERVER_USER};
#  --     GRANT SELECT, INSERT, UPDATE, DELETE TO ${MSSQL_SERVER_USER};

/opt/mssql-tools18/bin/sqlcmd -S ${MSSQL_SERVER_HOST} -U sa -P ${MSSQL_SERVER_SA_PASSWORD} -C -Q "
  USE [master];
  GO

  IF NOT EXISTS (SELECT * FROM sys.sql_logins WHERE name = '${MSSQL_SERVER_USER}')
  BEGIN
      CREATE LOGIN [${MSSQL_SERVER_USER}] WITH PASSWORD = '$MSSQL_SERVER_PASSWORD', CHECK_POLICY = OFF;
      ALTER SERVER ROLE [sysadmin] ADD MEMBER [${MSSQL_SERVER_USER}];
      CREATE DATABASE $MSSQL_SERVER_DATABASE;
  END
  GO
"
#/opt/mssql-tools18/bin/sqlcmd -S ${MSSQL_SERVER_HOST} -U sa -P ${MSSQL_SERVER_SA_PASSWORD} -C -d ${MSSQL_SERVER_DATABASE} -i docker-entrypoint-initdb.d/sample_data.sql
echo "Database and table created successfully."