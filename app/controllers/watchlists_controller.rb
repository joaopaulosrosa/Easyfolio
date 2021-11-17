class WatchlistsController < ApplicationController

  def show
    @watchlist = Watchlist.where(user: current_user)[0]
    @tickers = generate_tickers
    @cryptowatch = CoinTools::Cryptowatch.new
    authorize @watchlist
  end

  def generate_tickers
    cryptowatch = CoinTools::Cryptowatch.new

    @watchlist.coin_bookmarks.pluck(:coin_ticker).map{|coin| "#{coin}usd" }
  end
end
