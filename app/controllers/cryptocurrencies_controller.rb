class CryptocurrenciesController < ApplicationController
  before_action :set_wallet
  before_action :set_cryptocurrency, only: %i[ show update destroy ]

  def index
    render json: @wallet.cryptocurrencies
  end

  def show
  end

  def create
    @cryptocurrency = @wallet.cryptocurrencies.build(cryptocurrency_params)

    if @cryptocurrency.save
      render json: @cryptocurrency
    else
      render json: @cryptocurrency.errors, status: :unprocessable_entity
    end
  end

  def update
    if @cryptocurrency.update(cryptocurrency_params)
      render json: @cryptocurrency
    else
      render json: @cryptocurrency.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cryptocurrencies/1
  # DELETE /cryptocurrencies/1.json
  def destroy
    @cryptocurrency.destroy
  end

  private
    def set_wallet 
      @wallet = Wallet.find(params[:wallet_id])
    end

    def set_cryptocurrency
      @cryptocurrency = Cryptocurrency.find(params[:id])
    end

    def cryptocurrency_params
      params.require(:cryptocurrency).permit(:currency, :latest_price, :quantity, :total_worth, :wallet_id)
    end
end
