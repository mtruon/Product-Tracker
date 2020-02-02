class Product < ApplicationRecord
  has_many :prices
  validates :name, presence: true
  validates :url, presence: true, uniqueness: true
  validate :domain_must_be_processable 

  def domain
    return "#{self.url[/(hotels)|(amazon)/]}"
  end

  def domain_must_be_processable
    unless self.domain.downcase == "amazon" || self.domain.downcase == "hotels"
      errors.add(:url, " cannot be processed")
    end
  end

  def current_price
    # TODO: Call the product scraper service to scrape the current price
    begin
      if self.domain == "hotels"
        return "$#{ProductScraper::HotelsScraper.new(self.url).scrape}"
      elsif self.domain == "amazon"
        return "$#{ProductScraper::AmazonScraper.new(self.url).scrape}"
      end
    rescue
      return "$0.00"
    end
  end
end
