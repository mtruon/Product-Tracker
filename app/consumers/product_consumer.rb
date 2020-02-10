class ProductConsumer < Racecar::Consumer
  subscribes_to "test_topic"

  def process(message)
    puts "Received message: #{message.value}"
  end
end
