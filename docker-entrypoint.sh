#!/bin/sh

echo "spring.datasource.url= jdbc:mysql://${KONGX_MYSQL_HOST:=kongx_db}:${KONGX_MYSQL_PORT:=3306}/${KONGX_MYSQL_DATABASE:=kongx_serve}?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true
spring.datasource.username=${KONGX_MYSQL_USERNAME:=root}
spring.datasource.password=${KONGX_MYSQL_PASSWORD}"  > /kongx-serve/config/application.properties

exec /kongx-serve/scripts/startup.sh
