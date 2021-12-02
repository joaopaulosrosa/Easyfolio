const LoadChart = () => {
  let symbol = document.getElementById('chartticker')
  if (symbol) {
    symbol = symbol.textContent
    new TradingView.widget(
      {
        "width": 865,
        "height": 400,
        "symbol": "BINANCE:" + symbol + "USDT",
        // "symbol": "BINANCE:BTCUSDT",
        "interval": "D",
        "timezone": "Etc/UTC",
        "theme": "light",
        "style": "1",
        "locale": "br",
        "toolbar_bg": "#f1f3f6",
        "enable_publishing": false,
        // "hide_top_toolbar": true,
        "hide_legend": true,
        "save_image": false,
        "container_id": "tvchart"
      }
    );

  }
}

export { LoadChart }
