class Wallet < ApplicationRecord
    belongs_to :user
    has_many :cryptocurrencies, dependent: :destroy

    validates :overall_worth, presence:true 
    validates :wallet_type, presence:true 
end
