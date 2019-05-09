# Create network
echo "-> Creating mongo network configuration"
docker network create mongo-cluster &> /dev/null || echo "Skip network creation"
echo ""