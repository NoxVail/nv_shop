class Product < ApplicationRecord
  belongs_to :shop
  has_many :images, as: :imageable
end
