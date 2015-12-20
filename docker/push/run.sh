#!/bin/sh
################################################################################
# MySQL
################################################################################
if [ -d ${SPRING_DATASOURCE_URL} ]; then
    echo "SPRING_DATASOURCE_URL autoconfigured by docker link"
    SPRING_DATASOURCE_URL="jdbc:mysql://${MYSQL_PORT_3306_TCP_ADDR}:${MYSQL_PORT_3306_TCP_PORT}/power?useUnicode=true&characterEncoding=utf8"
else
    echo "SPRING_DATASOURCE_URL init by configuration"
fi
echo "(DEBUG) SPRING_DATASOURCE_URL=${SPRING_DATASOURCE_URL}"
echo "(DEBUG) SPRING_DATA_ELASTICSEARCH_CLUSTER_NODES=${SPRING_DATA_ELASTICSEARCH_CLUSTER_NODES}"
echo "(DEBUG) SPRING_DATA_MONGODB_HOST=${SPRING_DATA_MONGODB_HOST}"
echo "(DEBUG) SPRING_DATA_MONGODB_PORT=${SPRING_DATA_MONGODB_PORT}"
################################################################################
# Start application
################################################################################
if [ -d ${JHIPSTER_SLEEP} ]; then
    JHIPSTER_SLEEP=20
fi
echo "The application will start in ${JHIPSTER_SLEEP}sec..." && sleep ${JHIPSTER_SLEEP}
java -jar /app.war \
    --spring.profiles.active=prod \
    --spring.datasource.url=${SPRING_DATASOURCE_URL}
