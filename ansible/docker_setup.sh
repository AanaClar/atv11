#!/bin/bash

REPO_URL="https://github.com/joaomarceloalencar/devops.git"
REPO_DIR="devops"
TARGET_DIR="$HOME/todolist_postgres"
END_POINT=$(aws rds describe-db-instances --query "DBInstances[0].[Endpoint.Address]" --output text)

git clone $REPO_URL

echo "Copiando arquivos para $TARGET_DIR..."
mkdir -p $TARGET_DIR
cp -R $REPO_DIR/Laboratorios/02_Docker/todolist_postgres/* $TARGET_DIR

echo "services:
  nginx:
    image: nginx:latest
    ports:
      - "80:80"
    volumes:
      - ./default.conf:/etc/nginx/conf.d/default.conf   
    depends_on:
      - app
    networks:
      - todolist 

  db:
    image: postgres:latest
    volumes: 
      - ./instance:/var/lib/postgresql/data
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=220279lucas12435
      - POSTGRES_DB=todolist
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"] # Verifica se o PostgreSQL está pronto
      interval: 10s
      timeout: 5s
      retries: 5
    networks:
      - todolist

  app:
    image: todolist:postgrescontainer 
    volumes:
      - ./instance:/app/instance
    depends_on:
      db:
        condition: service_healthy
    networks:
      - todolist

networks:
  todolist:
" > $TARGET_DIR/docker-compose.yml

touch $TARGET_DIR/instance

rm -rf $REPO_DIR

sudo apt install postgresql-client-16

docker build -t todolist_postgres .

docker run -d --name todolist_postgres_container -p 5432:5432 todolist_postgres
