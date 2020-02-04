class PriceManager
  attr_reader :hotel_scraper, :hotel_products
  def initialize(products = nil)
    @hotel_products = []
    @amazon_products = []
    if products.nil?
      @hotel_scraper = ProductScraper::HotelsScraper.new()
    else
      add_products(products)
      @hotel_scraper = ProductScraper::HotelsScraper.new(products)
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

  def scrape_hotel_prices()
    for hotel in @hotel_products do
      @hotel_scraper.url = hotel.url
      p "$#{@hotel_scraper.scrape}"
    end
  end
end
