require 'rest-client'

COINGECKO_URL = 'https://api.coingecko.com/api/v3'

class WalletsController < ApplicationController
  before_action :set_wallet, only: %i[ show update destroy ]
  before_action :authenticate_user!

  def index
    @wallets = Wallet.where(user_id: current_user.id)
    @wallets.each do |wallet|
      wallet.cryptocurrencies.each do |cryptocurrency|
        cryptocurrency.update(price: price(cryptocurrency.coingecko_id))
      end
      wallet.update(overall_worth: compute_overall_worth(wallet), overall_pnl: compute_overall_pnl(wallet))
    end
    render json: @wallets
  end

  def show
    render json: @wallet
  end

  def create
    @wallet = Wallet.new(wallet_params)
    @wallet.user_id = current_user.id

    if @wallet.save
      render json: @wallet
    else
      render json: @wallet.errors, status: :unprocessable_entity
    end
  end

  def update
    if @wallet.update(wallet_params)
      render json: @wallet
    else
      render json: @wallet.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @wallet.destroy
  end

  private

  def price(name)
    url = "#{COINGECKO_URL}/simple/price?ids=#{name}&vs_currencies=usd"
    JSON.parse(RestClient.get(url).body)[name]['usd']
  end

    def set_wallet
      @wallet = Wallet.find(params[:id])
      @wallet.update(overall_worth: compute_overall_worth(@wallet), overall_pnl: compute_overall_pnl(@wallet))
    end

    def wallet_params
      params.require(:wallet).permit(:wallet_type)
    end

    def compute_overall_worth(wallet)
      overall_worth = 0 
      wallet.cryptocurrencies.each do |cryptocurrency| 
        overall_worth += cryptocurrency.quantity * cryptocurrency.price 
      end 
      overall_worth
    end

    def compute_overall_pnl(wallet)
      overall_pnl = 0 
      wallet.cryptocurrencies.each do |cryptocurrency| 
        overall_pnl += cryptocurrency.quantity * cryptocurrency.price - cryptocurrency.quantity * cryptocurrency.buy_price
      end 
      overall_pnl
    end
end
