class Product < ApplicationRecord
  validates :name, prescence: true
  validates :url, prescence: true
end
