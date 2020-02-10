class PriceManager
  attr_reader :hotel_scraper, :amazon_scraper, :products

  def initialize(products = nil)
    @hotel_scraper = ProductScraper::HotelsScraper.new()
    @amazon_scraper = ProductScraper::AmazonScraper.new()
    @products = []
    
    unless products.nil?
      add_product(products)
    end
  end

  def add_products(products)
    for product_id in products do
      add_product(product_id)
    end
  end

  def add_product(product_id)
    unless products.include?(product_id)
      @products.push(product_id)
    end
  end

  def get_price(product_id, currency)
    scraped_price = 0.0
    product = Product.find(product_id)
    if product.nil?
      return "Bad product ID"
    else
      scraped_price = scrape(product.url)
      if product.current_price != scraped_price
        price = product.prices.create(value: scraped_price, currency: "CAD")
        price.save
      end
    end  
  end

  def scrape(url)
    if product.domain == "hotels"
      return scrape_hotel_using(url)
    elsif product.domain == "amazon"
      return scrape_amazon_using(url)
    else
      return "Bad product URL"
    end
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
