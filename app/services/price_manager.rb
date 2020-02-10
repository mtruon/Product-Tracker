class PriceManager
  attr_reader :hotel_scraper, :hotel_products
  def initialize(products = nil)
    @hotel_products = []
    @amazon_products = []
    if products.nil?
      @hotel_scraper = ProductScraper::HotelsScraper.new()
      @amazon_scraper = ProductsScraper::AmazonScraper.new()
    else
      add_products(products)
      @hotel_scraper = ProductScraper::HotelsScraper.new(products)
      @amazon_scraper = ProductScraper::AmazonScraper.new(products)
    end
  end

  def add_product(product)
    @hotel_products.push(product)
  end

  def add_products(products)
    for product in products do
      if product.domain == "hotels"
        @hotel_products.push(product)
      elsif product.domain == "amazon"
        @amazon_products.push(product)
      else
        # Invalid product
        # TODO: Do something about this
      end
    end
  end

  def publish_message
    $kafka_producer.produce("HELLO!!", topic: "test_topic", partition_key: "hello?")
  end

  def publish(product)

  end

  def old_publish(products)
    scraped_value = 0.00
    for product in products do
      if product.domain == "hotels"
        scraped_value = scrape_hotel_using(product.url)
        # Prices that have not changed are not saved 
        if product.current_price != scraped_value
          price = product.prices.create(value: scraped_value, currency: "CAD")
          price.save
        end
      else
        scraped_value = scrape_amazon_using(product.url)
        # Prices that have not changed are not saved
        if product.current_price != scraped_value
          price = product.prices.create(value: scraped_value, currency: "CAD")
          price.save
        end
      end
      #$kafka_producer.produce(price.to_json, topic: "price", parition_key: product.id)
    end
  end

  def publish_hotels
    old_publish(@hotel_products)
  end

  def publish_amazon
    old_publish(@amazon_products)
  end

  def scrape_hotel_prices()
    for hotel in @hotel_products do
      p "$#{scrape_hotel_using(hotel.url)}"
    end
  end

  def test
    p "Hello :-)"
  end

  private
    def scrape_hotel_using(url)
      @hotel_scraper.url = url
      return @hotel_scraper.scrape
    end  

    def scrape_amazon_using(url)
      @amazon_scraper.url = url
      return @amazon_scraper.scrape
    end
end
