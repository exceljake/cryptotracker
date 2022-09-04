class WalletsController < ApplicationController
  before_action :set_wallet, only: %i[ show update destroy ]
  before_action :authenticate_user!

  def index
    render json: Wallet.where(user_id: current_user.id)
  end

  def show
    render json: @wallet
  end

  def create
    @wallet = Wallet.new(wallet_params)
    @wallet.user_id = current_user.id
    # puts current_user.inspect
    # puts wallet_params
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

    def set_wallet
      @wallet = Wallet.find(params[:id])
      @wallet.update(overall_worth: compute_overall_worth(@wallet))
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
end
