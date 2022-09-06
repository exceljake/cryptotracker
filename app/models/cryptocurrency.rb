class Cryptocurrency < ApplicationRecord
  belongs_to :wallet

  validates :symbol, presence: true
  validates :buy_price, presence: true
  validates :quantity, presence: true
end
