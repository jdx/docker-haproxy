echo "Stopping haproxy and removing container..."
docker stop haproxy
docker rm haproxy

set -e

echo "Building haproxy from Dockerfile..."
docker build -t haproxy_image .

echo "Running image..."
docker run -d -p 80:8081 -p 443:8082 -p 22002:22002 -name haproxy haproxy_image

echo "Stopping image so it can be run by systemd..."
docker stop haproxy

echo "Resetting systemd conf for haproxy..."
sudo cp haproxy.service /media/state/units/haproxy.service
sudo systemctl restart local-enable.service
sudo systemctl daemon-reload
sudo systemctl restart haproxy
