class CoinSharesController < ApplicationController
  def new
    @coin_share = CoinShare.new()
    authorize @coin_share
  end

  def create
    @coin_share = CoinShare.new(coin_params)
    @coin_share.strategy = Strategy.find(params[:strategy_id])
    authorize @coin_share
    if @coin_share.save
      redirect_to edit_wallet_strategy_path(@coin_share.strategy.wallet, @coin_share.strategy)
    end
  end

  def update
    @coin_share = CoinShare.find(params[:id])
    @coin_share.update(coin_params)
    authorize @coin_share
  end

  def destroy
    @coin_share = CoinShare.find(params[:id])
    @coin_share.destroy
    authorize @coin_share
    redirect_back(fallback_location: root_path)
  end
  private

  def coin_params
    params.require(:coin_share).permit(:coin_ticker, :coin_share)
  end
end
