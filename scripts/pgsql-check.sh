#!/bin/bash
docker exec silos-postgres psql -U postgres -c "SELECT 1"
