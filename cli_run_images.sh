#!/bin/bash

echo "-------------------------------------------------------------------------"
echo "WARNING: Running Docker containers directly via 'docker run' (as in this script)"
echo "         is generally NOT recommended for multi-service applications."
echo "         It is highly advised to use 'docker compose up -d' instead."
echo "         Docker Compose provides easier management, networking, and setup."
echo "-------------------------------------------------------------------------"
echo ""

read -p "Do you still want to proceed with 'docker run' commands? (y/N): " -n 1 -r
echo # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Aborting 'docker run' commands. Please consider using 'docker compose up -d'."
    exit 1
fi

MSYS_NO_PATHCONV=1 docker run -d \
  --name service-hosts \
  -v 'volume_service_hosts_py:/app/data' \
  -e 'DB=/app/data/hosts.db' \
  -p 8001:8000 \
  service_hosts_py:latest

MSYS_NO_PATHCONV=1 docker run -d \
  --name service-auth \
  -v 'volume_service_auth_py:/app/data' \
  -e 'DB=/app/data/auth.db' \
  -p 8002:8000 \
  service_auth_py:latest

docker run -d \
  --name service-gateway \
  -e "HOSTS_URL=http://localhost:8001" \
  -e "AUTH_URL=http://localhost:8002" \
  -e "SYNC_OUTLET_URL=http://localhost:8765" \
  -e "SYNC_MAIN_URL=http://localhost:8766" \
  -p 8000:8000 \
  service_gateway_py:latest

docker run -d \
  --name web-client-dashboard \
  -p 8080:8000 \
  host-dashboard:latest

