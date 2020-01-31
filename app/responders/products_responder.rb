class ProductsResponder < ApplicationResponder
  topic :products

  def respond(product)
    respond_to :products, product
  end
end
