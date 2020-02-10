require "kafka"

$kafka = Kafka.new(["localhost:9092"], client_id: "fast-track-app")

# Asynchronous producers delivers buffered messages every 10seconds
$kafka_producer = $kafka.async_producer(
  delivery_interval: 10
)

at_exit {
  $kafka_producer.shutdown
}
