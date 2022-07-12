Esta es la práctica de SQL, aquí incluiré los comandos utilizados para crear la base de datos en Docker y los scripts en /scripts

-------------------

Corremos el siguiente comando:

    docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=P4ssw0rd!' -p 1433:1433 -v ${pwd}/data:/var/opt/mssql/data -v ${pwd}/log:/var/opt/mssql/log -v ${pwd}/secrets:/var/opt/mssql/secrets -d mcr.microsoft.com/mssql/server:2019-latest

En SQL Server Management Studio creamos la base de datos 'practicasql' tras habernos auténticado

Para utilizar la base de datos de SQL Server y empezar a trabajar con nuestros scripts...

-------------------

Los scripts se realizaron y deben ser ejecutados en el siguiente orden:
    
    1. create_tables.sql
    2. relate_tables.sql
    3. insert_data.sql
    4. queries.sql
    5. triggers.sql
    6. functions.sql
    7. store_procedures.sql

Estos scripts se encuentran en el directorio /scripts