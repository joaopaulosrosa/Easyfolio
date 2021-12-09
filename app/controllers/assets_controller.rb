class AssetsController < ApplicationController
  before_action :find_asset

  def edit
    authorize @asset
    @data = call_coin_gecko
  end

  def update
    authorize @asset
    if @asset.update(asset_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end
  private

  def find_asset
    @asset = Asset.find(params[:id])
  end

  def api_json(url)
    data = HTTParty.get(url).body
    JSON.parse(data)
  end

  def call_coin_gecko
    api_json('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd')
  end

  def asset_params
    params.require(:asset).permit(:amount)
  end
end
