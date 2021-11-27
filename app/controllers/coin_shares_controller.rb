class CoinSharesController < ApplicationController
  def new
    @coin_share = CoinShare.new()
    authorize @coin_share
  end
end
