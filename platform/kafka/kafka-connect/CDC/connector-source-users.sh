#!/bin/bash

docker compose exec debezium curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '
{
    "name": "mysql-users-connector",
    "config": {
        "connector.class": "io.debezium.connector.mysql.MySqlConnector",
        "tasks.max": "1",
        "database.hostname": "host.docker.internal",
        "database.port": "4000",
        "database.user": "root",
        "database.password": "root_password",
        "database.server.name": "user_db",
        "database.name": "user_management",
        "topic.prefix": "dbz",
        "database.include.list": "user_management",
        "schema.history.internal.kafka.bootstrap.servers": "redpanda-0:9092,redpanda-1:9092,redpanda-2:9092",
        "schema.history.internal.kafka.topic": "schemahistory.dbz.users",
        "database.server.id": "1234"
    }
}'