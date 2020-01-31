# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Query the database for all Product records
begin
  products = Product.all
  price_manager = PriceManager.new(products)
  price_manager.scrape_hotel_prices()
rescue
  p "Failed"
end
