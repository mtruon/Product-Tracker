class PricesController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @price = @product.prices.create(price_params)
  end

  private
    def price_params
      params.require(:price).permit(:value, :currency)
    end
end
