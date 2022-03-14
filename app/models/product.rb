class Product < ApplicationRecord
  belongs_to :shop
  has_many :variants, dependent: :destroy
  has_many :images, as: :owner
  has_many :offers, dependent: :destroy

  accepts_nested_attributes_for :variants
end
