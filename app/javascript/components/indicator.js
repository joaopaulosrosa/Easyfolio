const LoadIndicator = () => {
  let symbol = document.getElementById('chartticker').textContent
  new TradingView.widget(
    {
      "interval": "1D",
      "width": "100%",
      "isTransparent": false,
      "height": "100%",
      "symbol": "BINANCE:" + symbol +"USDT",
      "showIntervalTabs": true,
      "locale": "en",
      "colorTheme": "dark"
    }
  );
}

export { LoadIndicator }
