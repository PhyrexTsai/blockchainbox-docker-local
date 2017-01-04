## Kafka

- Version: 0.10.1

### Commands

```
-- show all topics, localhost should use zookeeper docker ip
./opt/kafka_2.11-0.10.1.0/bin/kafka-topics.sh --list --zookeeper localhost:2181

-- show all data in this topic
./opt/kafka_2.11-0.10.1.0/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic InsertQueue
```