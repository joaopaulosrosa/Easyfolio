class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:dashboard]
  before_action :get_wallet, only: [:dashboard]

  def dashboard
    @data = call_coin_gecko
  end

  def explore
    @top10 = call_coin_gecko[0..9]
  end

  def coin
    @coin = get_coin
  end

  private

  def get_coin
    api_json("https://api.coingecko.com/api/v3/coins/#{params[:query]}")
  end

  def call_coin_gecko
    api_json('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd')
  end

  def api_json(url)
    data = HTTParty.get(url).body
    JSON.parse(data)
  end

  def get_wallet
    @wallets = current_user.wallets
  end
end
