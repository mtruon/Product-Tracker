class ProductConsumer < Racecar::Consumer
  subscribes_to "products", start_from_beginning: false

  def process(message)
    product_id = JSON.parse(message.value)
    product = Product.find(product_id)
    puts "Received #{product}"
  end
end
