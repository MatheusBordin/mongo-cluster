# Docker Mongo Cluster
Implement shell-scripts using docker to start scalable mongo cluster.

## Requisites
You need have docker installed in yout machine and running using Linux distro (I suggest Ubuntu)

## Using localy
First, you need run the `network.sh` file, he create docker network to be used in all mongo containers. After that, run `mongo-keyfile.sh` to create your internal credential and `mongo.sh` for start the cluster.

## Connection URI
The connection URI need to receive all replica **host** and **port**. Like that:

```sh
mongo --host "mongodb://<user>:<pass>@<host-one>:<port-one>,<host-two>:<port-two>/<database>"
```

**Example using the mongo.sh**:
```sh
mongo --host "mongodb://admin:dracarys@localhost:30001,localhost:30002,localhost:30003,localhost:30004"
```
