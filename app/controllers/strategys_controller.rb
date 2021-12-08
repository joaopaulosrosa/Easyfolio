class StrategysController < ApplicationController
  def edit
    @strategy = Strategy.find(params[:id])
    @coin_share = CoinShare.new()
    authorize @strategy
    authorize @coin_share
  end
end
