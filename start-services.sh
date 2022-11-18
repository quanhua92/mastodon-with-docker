#!/bin/bash
docker-compose -f ./db/docker-compose.yml -f ./redis/docker-compose.yml -f ./es/docker-compose.yml -f ./mastodon/docker-compose.yml up -d --remove-orphans