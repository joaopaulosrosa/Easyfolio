class WatchlistsController < ApplicationController

  def show
    @tickers = generate_tickers
    @data = call_coin_gecko
    @coin_bookmark = CoinBookmark.new
    authorize @watchlist
  end

  def explore
    @top10 = call_coin_gecko[0..9]
    url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'
    if params[:query].present?
      data = HTTParty.get(url).body
      data_json = JSON.parse(data)
      if data_json.select{ |key| key["symbol"] == params[:query] }.empty?
        flash[:alert] = "This coin doesn't exist, type again."
      else
        response = data_json.select{ |key| key["symbol"] == params[:query] }.first
        @coin = response.transform_keys(&:to_sym)
        @btc = get_btc
      end
    end
  end

  def coin

    url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'
    if params[:query].present?
      data = HTTParty.get(url).body
      data_json = JSON.parse(data)
      query = params[:query].present? ? params[:query].downcase : params[:query]
      id_query = data_json.select{ |key| key["symbol"].downcase == query || key["name"].downcase == query}
      if id_query.empty? || query.blank?
        redirect_to coin_explore_path
        flash[:alert] = "This coin doesn't exist, type again."
      else
        @coin = get_coin(id_query)
      end
    else
      redirect_to coin_explore_path
    end

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
