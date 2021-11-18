class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :contact ]

  def home
  end

  def explore
    url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'
    if params[:query].present?
      data = HTTParty.get(url).body
      data_json = JSON.parse(data)
      response = data_json.select{ |key| key["symbol"] == params[:query] }.first
      @coin = response.transform_keys(&:to_sym)
    end
  end

  # def explore
  #   @cryptowatch = CoinTools::Cryptowatch.new
  #   if params[:query].present?
  #     @coin = @cryptowatch.get_current_price("binance-us", "#{params[:query]}usd")
  #     @ticker = params[:query]
  #   end
  # end
end
