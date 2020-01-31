class ProductsConsumer < ApplicationConsumer
  def consume
    Karafka.logger.info "New [Product] event: #{params}"
  end
end
