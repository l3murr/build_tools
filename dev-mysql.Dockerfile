FROM mysql:8
RUN echo '[mysqld]\n\
sql_mode = "STRICT_TRANS_TABLES"\n\
collation-server = utf8mb4_unicode_ci\n\
init-connect="SET NAMES utf8mb4"\n\
character-set-server = utf8mb4\n\
mysql_native_password=ON' >> /etc/mysql/conf.d/my.cf
RUN echo 'CREATE DATABASE IF NOT EXISTS c45d86012a4e470091d7e186397a55a0;\n\
CREATE DATABASE IF NOT EXISTS c45d86012a4e470091d7e186397a55a0_warehouse;' >> /docker-entrypoint-initdb.d/01-databases.sql
EXPOSE 3306 33060
CMD ["mysqld"]
