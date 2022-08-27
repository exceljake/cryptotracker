class WalletsController < ApplicationController
  before_action :set_wallet, only: %i[ show update destroy ]
  before_action :authenticate_user!

  # GET /wallets
  # GET /wallets.json
  def index
    @wallets = Wallet.all
  end

  # GET /wallets/1
  # GET /wallets/1.json
  def show
  end

  # POST /wallets
  # POST /wallets.json
  def create
    @wallet = Wallet.new(wallet_params)

    if @wallet.save
      render :show, status: :created, location: @wallet
    else
      render json: @wallet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wallets/1
  # PATCH/PUT /wallets/1.json
  def update
    if @wallet.update(wallet_params)
      render :show, status: :ok, location: @wallet
    else
      render json: @wallet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wallets/1
  # DELETE /wallets/1.json
  def destroy
    @wallet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wallet
      @wallet = Wallet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wallet_params
      params.require(:wallet).permit(:overall_worth, :wallet_type)
    end
end
