class ProductConsumer < Racecar::Consumer
  subscribes_to "products", start_from_beginning: false

  def create_price_from(id, currency)
    product = Product.find(id)
    price = product.prices.create(value: product.scrape_price, currency: currency)
    price.save
  end

  def process(message)
    data = JSON.parse(message.value)
    create_price_from(data["id"], data["currency"])
  end
end
