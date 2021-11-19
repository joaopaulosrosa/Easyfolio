class WatchlistsController < ApplicationController

  def show
    @watchlist = Watchlist.where(user: current_user)[0]
    @tickers = generate_tickers
    @data = call_coin_gecko
    authorize @watchlist
  end

  def generate_tickers
    @watchlist.coin_bookmarks.pluck(:coin_ticker).map{|coin| "#{coin}" }
  end

  private

  def call_coin_gecko
    url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'
    data = HTTParty.get(url).body
    JSON.parse(data)
  end
end
