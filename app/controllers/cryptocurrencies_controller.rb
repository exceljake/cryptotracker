require 'rest-client'

COINGECKO_URL = 'https://api.coingecko.com/api/v3'

class CryptocurrenciesController < ApplicationController
  before_action :set_wallet
  before_action :set_cryptocurrency, only: %i[ show update destroy ]

  def index
    render json: @wallet.cryptocurrencies
  end

  def show
    render json: @cryptocurrency
  end

  def create
    cryptocurrency = search(params[:cryptocurrency][:symbol])
    if cryptocurrency['symbol'] == (params[:cryptocurrency][:symbol])
      @cryptocurrency = @wallet.cryptocurrencies.build(
          symbol: cryptocurrency['symbol'].downcase,
          price: price(cryptocurrency['id']),
          coingecko_id: cryptocurrency['id'],
          buy_price: (params[:cryptocurrency][:buy_price]), 
          quantity: (params[:cryptocurrency][:quantity])
        )
      if @cryptocurrency.save
        render json: @cryptocurrency
      else
        render json: @cryptocurrency.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    if @cryptocurrency.update(cryptocurrency_params)
      render json: @cryptocurrency
    else
      render json: @cryptocurrency.errors, status: :unprocessable_entity
    end
  end
 
  def destroy
    @cryptocurrency.destroy
  end

  private
    def search(query)
      url = "#{COINGECKO_URL}/search?query=#{query}"
      JSON.parse(RestClient.get(url).body)['coins'].first
    end

    def price(name)
      url = "#{COINGECKO_URL}/simple/price?ids=#{name}&vs_currencies=usd"
      JSON.parse(RestClient.get(url).body)[name]['usd']
    end

    def set_wallet 
      @wallet = Wallet.find(params[:wallet_id])
    end

    def set_cryptocurrency
      @cryptocurrency = Cryptocurrency.find(params[:id])
      @cryptocurrency.update(price: price(@cryptocurrency.coingecko_id))
    end

    def cryptocurrency_params
      params.require(:cryptocurrency).permit(:coingecko_id, :symbol, :price, :buy_price, :quantity)
    end
end