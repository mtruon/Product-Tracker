# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Initializing the product scraper with all tracked products in the database
begin
  p Product.all
  aVar = "TESTING?"
rescue
  p "Didn't work"
end
