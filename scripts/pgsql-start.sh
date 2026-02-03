#!/bin/bash
docker rm -f silos-postgres 2>/dev/null || true
docker run --rm --name silos-postgres \
  -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
  -p 5432:5432 \
  postgres
