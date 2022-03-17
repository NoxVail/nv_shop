class Funnel < ApplicationRecord
  belongs_to :shop
  has_many :offers, dependent: :destroy

  validates :name, presence: true
end
