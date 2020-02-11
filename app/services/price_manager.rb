class PriceManager
  attr_reader :hotel_scraper, :amazon_scraper, :products

  def initialize(products = nil)
    @hotel_scraper = ProductScraper::HotelsScraper.new()
    @amazon_scraper = ProductScraper::AmazonScraper.new()
    @products = []
    
    unless products.nil?
      add_products(products)
    end
  end

  def add_products(products)
    for product in products do
      add_product(product)
    end
  end

  def add_product(product)
    @products.push(product.id)
  end

  def get_prices
    for id in @products
      get_price(id, "CAD")
    end
  end

  def get_price(id, currency)
    scraped_price = 0.0
    product = Product.find(id)
    if product.nil?
      return "Bad product ID"
    else
      scraped_price = scrape(product.domain, product.url)
      if product.current_price != scraped_price
        price = product.prices.create(value: scraped_price, currency: "CAD")
        price.save
      end
    end  
  end

  def scrape(domain, url)
    if domain == "hotels"
      return scrape_hotel_using(url)
    elsif domain == "amazon"
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
