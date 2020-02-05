class Product < ApplicationRecord
  has_many :prices, dependent: :destroy
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
    if prices.last.nil?
      return "-"
    else
      return "$#{prices.last.value}"
    end
  end

  def max_price
    if prices.max.nil?
      return "-"
    else
      return "$#{prices.maximum(:value)}"
    end
  end

  def min_price
    if prices.min.nil?
      return "-"
    else
      return "$#{prices.minimum(:value)}"
    end
  end

  def scrape_price
    # Creates an instance of the appropriate html price scraper and retrieves an immediate price
    begin
      if self.domain == "hotels"
        return ProductScraper::HotelsScraper.new(self.url).scrape
      elsif self.domain == "amazon"
        return ProductScraper::AmazonScraper.new(self.url).scrape
      end
    rescue
      return 0.00
    end
  end
end
