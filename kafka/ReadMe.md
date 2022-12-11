-- to install kafka
sudo apt update
sudo apt install openjdk-11-jdk
mkdir kafka
mkdir Downloads
curl https://downloads.apache.org/kafka/3.2.1/kafka_2.12-3.2.1.tgz -o Downloads/kafka.tgz
tar -xvzf ~/Downloads/kafka.tgz kafka

-- to lacunch kafka server
cd kafka
bin/zookeeper-server-start.sh config/zookeeper.properties
bin/kafka-server-start.sh config/server.properties

-- create topics
bin/kafka-topics.sh  --create --bootstrap-server localhost:9092 --topic cities


-- list topics
bin/kafka-topics.sh  --list --bootstrap-server localhost:9092

-- describe a topic
bin/kafka-topics.sh  --describe --bootstrap-server localhost:9092 --topic cities

-- kafka producers , produce data
bin/kafka-console-producer.sh --broker-list localhost:9092 --topic cities

-- kafka consumer, consume data
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic cities

-- consumer all data from begin
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic cities --from-beginning
