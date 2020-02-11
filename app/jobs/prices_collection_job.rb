class PricesCollectionJob
  @queue = :prices_collection_job
  def self.perform
    $price_manager.get_prices
  end
end
