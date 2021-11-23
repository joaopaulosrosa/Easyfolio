class WatchlistsController < ApplicationController

  def show
    @tickers = generate_tickers
    @data = call_coin_gecko
    @coin_bookmark = CoinBookmark.new
    authorize @watchlist
  end


  private

  def generate_tickers
    @watchlist = Watchlist.where(user: current_user)[0]
    @watchlist.coin_bookmarks.pluck(:coin_ticker).map{|coin| "#{coin}" }
  end

  def call_coin_gecko
    url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'
    data = HTTParty.get(url).body
    JSON.parse(data)
  end
end
