
puts 'creating 2 bookmarks'

CoinBookmark.create!(
  watchlist_id: 1,
  coin_ticker: 'btc'
)

CoinBookmark.create!(
  watchlist_id: 1,
  coin_ticker: 'eth'
)

puts 'created 2 bookmarks'
