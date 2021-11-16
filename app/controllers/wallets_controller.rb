class WalletsController < ApplicationController
before_action :get_wallet, only: [:show, :destroy]

  def show
    authorize @wallet
  end

  def index
    @wallets = policy_scope(Wallet)
  end

  def new
    @wallet = Wallet.new
    authorize @wallet
  end

  def create
    @wallet = Wallet.new(wallet_params)
    @wallet.user = current_user
    authorize @wallet
    if @wallet.save
      redirect_to user_wallet_path(current_user, @wallet), notice: 'Wallet has been created'
    else
      render :new
    end
  end

  def destroy
    @wallet.destroy
    authorize @wallet
    redirect_to user_wallet_path
  end

  private

  def get_wallet
    @wallet = Wallet.find(params[:id])
  end

  def wallet_params
    params.require(:wallet).permit(:name)
  end

end
