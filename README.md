# Docker Mongo Cluster
Implement ansible using docker to start scalable mongo cluster.

## Requisites
You need have docker and ansible installed in yout machine and running using Linux distro (Suggested: Ubuntu).

## Using localy
If is your first time using this, you need create docker network running: 
```sh
./scripts/network.sh
```
After that, run `mongo-keyfile.sh` to create your internal credential and `mongo.sh` for start the cluster.

Now you are ready to start! Run:
```sh
ansible -K provision-example.yml
```

**Important**: This example use hosts alias for docker network simulating the production environment. Example:
```text
127.0.0.1       mongo-01
127.0.0.1       mongo-02
127.0.0.1       mongo-03
```

## Connection URI
The connection URI need to receive all replica **host** and **port**. Like that:

```sh
mongo --host "mongodb://<user>:<pass>@<host-one>:<port-one>,<host-two>:<port-two>/<database>"
```

**Example using the mongo.sh**:
```sh
mongo --host "mongodb://admin:dracarys@mongo-01:30001,mongo-02:30002,mongo-03:30003"
```
