FROM mysql:8
RUN echo '[mysqld]\n\
sql_mode = "STRICT_TRANS_TABLES"\n\
collation-server = utf8mb4_unicode_ci\n\
init-connect='SET NAMES utf8mb4'\n\
character-set-server = utf8mb4\n\
mysql_native_password=ON'
>> /etc/mysql/conf.d/my.cf
EXPOSE 3306 33060
CMD ["mysqld"]
