# class DashboardsController < ApplicationController

#   def wallet
#     Dashboard.new
#     @data = call_coin_gecko
#     get_wallets
#   end

#   private

#   def call_coin_gecko
#     url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'
#     data = HTTParty.get(url).body
#     JSON.parse(data)
#   end

#   def get_wallets
#     @wallets = current_user.wallets
#   end
# end
