class StrategysController < ApplicationController
  def edit
    @strategy = Strategy.find(params[:id])
    @asset = Asset.new()
    authorize @strategy
    authorize @asset
  end
end
