class WalletsController < ApplicationController
before_action :get_wallet, only: [:show, :destroy]

  def show
    @cryptowatch = CoinTools::Cryptowatch.new
    @assets = @wallet.assets
    @data = call_coin_gecko
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
      @strategy = Strategy.new()
      @strategy.wallet = @wallet
      redirect_to '/dashboard'
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

  def call_coin_gecko
    url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'
    data = HTTParty.get(url).body
    JSON.parse(data)
  end

  def wallet_params
    params.require(:wallet).permit(:name)
  end

end
