module ApplicationHelper
  def coin(data, asset)
    data.select{ |key| key["symbol"] == asset.coin_ticker }.first.transform_keys(&:to_sym)
  end

  def market_cap
    url = 'https://api.coingecko.com/api/v3/global'
    data = HTTParty.get(url).body
    json = JSON.parse(data)
    json['data']['total_market_cap']['usd'].round(2)
  end

  def btc_data
    url = 'https://api.coingecko.com/api/v3/coins/bitcoin'
    data = HTTParty.get(url).body
    JSON.parse(data)
  end

  def btc_dominance
    btc_d = ((btc_data['market_data']['market_cap']['usd']) / market_cap) * 100
    btc_d.round(2)
  end
end
