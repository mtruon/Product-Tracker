class ApplicationController < ActionController::Base
  def create_prices(product_id, value, currency)
    @product = Product.find(product_id)
    @price = @product.prices.create(value: value, currency: currency)
    @price.save
  end
end
