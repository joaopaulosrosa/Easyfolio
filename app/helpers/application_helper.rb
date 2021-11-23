module ApplicationHelper
  def coin(data, asset)
    data.select{ |key| key["symbol"] == asset.coin_ticker }.first.transform_keys(&:to_sym)
  end
end
