const LoadChart = () => {
  let symbol = document.getElementById('query')
  if (symbol) {
    new TradingView.widget(
      {
        "width": 600,
        "height": 400,
        "symbol": "BINANCE:" + symbol.value + "USDT",
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
