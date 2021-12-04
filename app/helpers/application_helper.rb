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

  def coin_data(coin_name)
    url = "https://api.coingecko.com/api/v3/coins/#{coin_name}"
    data = HTTParty.get(url).body
    JSON.parse(data)
  end

  def total_allocated(strategy)
    total = []
    strategy.coin_shares.each do |coin_share|
      total << coin_share.coin_share
    end
    if total.sum == 100
      total.sum
    else
      total.sum.to_s + ' You need to allocate 100%'
    end
  end

  # def binance_api
  #   api_header = {
  #     API_KEY: 'UWQQv1qTI5XQ4Dxn6SXP9eoE559o0tUBQ6GsNdURD6Hc1pef1hzCldxwwRQ4hhAL',
  #     SECRET: 'oxrUANTILzmSjbxvptCsi3appQlzS6iv7HHnd7JOC6sJBvUJXACsJHvbOBUzSc5X',
  #     URL: 'https://api.binance.com'
  #   }
  #   data = {
  #     type
  #   timestamp =
  #   mac = OpenSSL::HMAC.hexdigest("SHA256", api_header[:SECRET], data)
  # end
end
