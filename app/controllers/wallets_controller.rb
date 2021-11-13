class WalletsController < ApplicationController

  def show
    authorize @wallet
  end

  def index
    if params[:query].present?
      @wallet = wallet.search_by_name_and_description(params[:query])
    else
      @wallet = policy_scope(wallet)
    end
  end

  def new
    @wallet = Wallet.new
    authorize @wallet
  end

  def create
    @wallet = Wallet.new(wallet_params)
    @wallet.user = current_user
    authorize @nft
    if @wallet.save
      redirect_to @wallet, notice: 'Wallet has been created'
    else
      render :new
    end
  end

  def destroy
    @wallet.destroy
    authorize @nft
    redirect_to wallets_path
  end

  private

  def get_wallet
    @wallet = Wallet.find(params[:id])
  end
end
