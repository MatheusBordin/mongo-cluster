# Create mongo-01
echo "-> Creating mongo-01"
docker rm -f mongo-01 &> /dev/null || echo ""
docker run -d \
  -p 30001:27017 \
  -v /home/bordin/workspace/tests/docker-mongo/db/mongo-01:/data/db \
  -v /home/bordin/workspace/tests/docker-mongo/mongo-keyfile:/opt/mongo-keyfile \
  --name mongo-01 \
  --net mongo-cluster \
  -e "MONGO_INITDB_ROOT_USERNAME=admin" \
  -e "MONGO_INITDB_ROOT_PASSWORD=dracarys" \
  mongo:4.0.9 mongod --replSet repl --auth --keyFile /opt/mongo-keyfile
echo ""

# Create mongo-02
echo "-> Creating mongo-02"
docker rm -f mongo-02 &> /dev/null || echo ""
docker run -d \
  -p 30002:27017 \
  -v /home/bordin/workspace/tests/docker-mongo/db/mongo-02:/data/db \
  -v /home/bordin/workspace/tests/docker-mongo/mongo-keyfile:/opt/mongo-keyfile \
  --name mongo-02 \
  --net mongo-cluster \
  -e "MONGO_INITDB_ROOT_USERNAME=admin" \
  -e "MONGO_INITDB_ROOT_PASSWORD=dracarys" \
  mongo:4.0.9 mongod --replSet repl --auth --keyFile /opt/mongo-keyfile
echo ""

# Create mongo-03
echo "-> Creating mongo-03"
docker rm -f mongo-03 &> /dev/null || echo ""
docker run -d \
  -p 30003:27017 \
  -v /home/bordin/workspace/tests/docker-mongo/db/mongo-03:/data/db \
  -v /home/bordin/workspace/tests/docker-mongo/mongo-keyfile:/opt/mongo-keyfile \
  --name mongo-03 \
  --net mongo-cluster \
  -e "MONGO_INITDB_ROOT_USERNAME=admin" \
  -e "MONGO_INITDB_ROOT_PASSWORD=dracarys" \
  mongo:4.0.9 mongod --replSet repl --auth --keyFile /opt/mongo-keyfile
echo ""

# Create mongo-04
echo "-> Creating mongo-04"
docker rm -f mongo-04 &> /dev/null || echo ""
docker run -d \
  -p 30004:27017 \
  -v /home/bordin/workspace/tests/docker-mongo/db/mongo-04:/data/db \
  -v /home/bordin/workspace/tests/docker-mongo/mongo-keyfile:/opt/mongo-keyfile \
  --name mongo-04 \
  --net mongo-cluster \
  -e "MONGO_INITDB_ROOT_USERNAME=admin" \
  -e "MONGO_INITDB_ROOT_PASSWORD=dracarys" \
  mongo:4.0.9 mongod --replSet repl --auth --keyFile /opt/mongo-keyfile
echo ""

sleep 10
{
  config="{ 
    '_id': 'repl', 
    'members': [
      { '_id': 0, 'host': 'mongo-01:27017' }, 
      { '_id': 1, 'host': 'mongo-02:27017' }, 
      { '_id': 2, 'host': 'mongo-03:27017' },
      { '_id': 3, 'host': 'mongo-04:27017' },
    ] 
  }"

  mongo --host "mongodb://admin:dracarys@localhost:30001" --eval "db.adminCommand({'replSetInitiate' : $config})"
} &> /dev/null || echo "ReplicaSet init error (maybe the repl is already initialized)"