class Offer < ApplicationRecord
  belongs_to :funnel
  belongs_to :product
  has_one :setting
end
