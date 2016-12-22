# blockchainbox-docker
Docker images for blockchainbox

## Run Docker

Run commands below

```
git clone https://github.com/PhyrexTsai/blockchainbox-docker
cd blockchainbox-docker
docker-compose up
```

## Tech Stack

- Ethereum & Web3.js
    - https://github.com/Kunstmaan/docker-ethereum/tree/master/geth-testnet
- PostgreSQL
    - https://github.com/docker-library/postgres/tree/master/9.4/alpine
- ZooKeeper
    - https://github.com/wurstmeister/zookeeper-docker
- Kafka
    - https://github.com/wurstmeister/kafka-docker
    
## TODO

#### PostgreSQL

- Setup table
- Design Database schema

#### Kafka 

- Property settings

#####finished:
- Add topic(V)
Add new two topics KAFKA_CREATE_TOPICS: "InsertQueue:1:3,ReadQueue:1:3" in docker-compose.yml
each 1 master and 3 replicas

#### Ethereum & Web3.js

- Implement Event listener, Kafka consumer and producer
- Smart contract deploy script
- Setup private ethereum blockchain

## Memo

Modify `Dockerfile` to build a new image
```
-- rebuild docker image
docker build - < Dockerfile

-- start docker 
docker run {hash}
