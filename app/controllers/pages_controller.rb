class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :contact ]

  def home
  end

  def explore
    @cryptowatch = CoinTools::Cryptowatch.new
    if params[:query].present?
      @coin = @cryptowatch.get_current_price("binance-us", "#{params[:query]}usd")
      @ticker = params[:query]
    end
  end
end
