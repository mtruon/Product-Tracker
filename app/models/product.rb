class Product < ApplicationRecord
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
end
