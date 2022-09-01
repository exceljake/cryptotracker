class CryptocurrenciesController < ApplicationController
  before_action :set_cryptocurrency, only: %i[ show update destroy ]

  # GET /cryptocurrencies
  # GET /cryptocurrencies.json
  def index
    @cryptocurrencies = Cryptocurrency.all
  end

  # GET /cryptocurrencies/1
  # GET /cryptocurrencies/1.json
  def show
  end

  # POST /cryptocurrencies
  # POST /cryptocurrencies.json
  def create
    @cryptocurrency = Cryptocurrency.new(cryptocurrency_params)

    if @cryptocurrency.save
      render json: @cryptocurrency
    else
      render json: @cryptocurrency.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cryptocurrencies/1
  # PATCH/PUT /cryptocurrencies/1.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_cryptocurrency
      @cryptocurrency = Cryptocurrency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cryptocurrency_params
      params.require(:cryptocurrency).permit(:currency, :latest_price, :quantity, :total_worth, :wallet_id)
    end
end
