class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:dashboard]
  before_action :get_wallet, :call_coin_gecko, only: [:dashboard]

  def home
    @markers = [{
      lat: 25.21637624420233,
      lng: 55.275519286827105
    }]
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

  def dashboard
    @data = call_coin_gecko
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

  def get_coin(id_query)
    api_json("https://api.coingecko.com/api/v3/coins/#{id_query.first["id"]}")
  end

  def call_coin_gecko
    api_json('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd')
  end

  def api_json(url)
    data = HTTParty.get(url).body
    @data = JSON.parse(data)
  end

  def get_wallet
    @wallets = current_user.wallets
  end
end
