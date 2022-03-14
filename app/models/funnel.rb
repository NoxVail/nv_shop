class Funnel < ApplicationRecord
  belongs_to :shop, dependent: :destroy
  has_many :offers, dependent: :destroy

  validates :name, presence: true
end
