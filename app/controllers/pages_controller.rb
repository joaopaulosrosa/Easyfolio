class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :contact ]
  before_action :get_wallet, only: [:dashboard]

  def home
    @markers = [{
      lat: 25.21637624420233,
      lng: 55.275519286827105
    }]
  end

  def explore
    url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'
    if params[:query].present?
      data = HTTParty.get(url).body
      data_json = JSON.parse(data)
      response = data_json.select{ |key| key["symbol"] == params[:query] }.first
      @coin = response.transform_keys(&:to_sym)
      @btc = get_btc
    end
  end

  def dashboard
    @data = call_coin_gecko
  end

  private

  def call_coin_gecko
    url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'
    data = HTTParty.get(url).body
    JSON.parse(data)
  end

  def get_wallet
    @wallets = current_user.wallets
  end

  def get_btc
    url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'
    data = HTTParty.get(url).body
    data_json = JSON.parse(data)
    response = data_json.select{ |key| key["symbol"] == 'btc' }.first
    response.transform_keys(&:to_sym)
  end

  # def explore
  #   @cryptowatch = CoinTools::Cryptowatch.new
  #   if params[:query].present?
  #     @coin = @cryptowatch.get_current_price("binance-us", "#{params[:query]}usd")
  #     @ticker = params[:query]
  #   end
  # end
end
