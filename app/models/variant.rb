class Variant < ApplicationRecord
  belongs_to :product
  has_many :images, as: :owner
end
