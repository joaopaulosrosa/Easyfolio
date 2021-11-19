class AssetsController < ApplicationController
  before_action :find_asset, only: [:show]
  def show
    authorize @asset
  end

  private

  def find_asset
    @asset = Asset.find(params[:id])
  end
end
