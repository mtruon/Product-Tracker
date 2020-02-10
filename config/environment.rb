# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Initialize the price component
begin
  products = Product.all
  $price_manager = PriceManager.new(products)
  puts "[Prices] SUCCESS! Prices component successfully initialized"
rescue
  puts "[Prices] ERROR!  Failed to initialize the Prices component"
end
