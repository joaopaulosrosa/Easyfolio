
========= Watch EasyFolio's Pitch at Le Wagon's DEMO day: https://bit.ly/320xNmO =========

EasyFolio is an intuitive cryptocurrency management solution that both assists in managing your portfolio and discovering new opportunities. 

We all know what cryptocurrency is, but how do we properly manage an investment portfolio of various coins, sometimes in different exchanges, as well as analyze new opportunities.

EasyFolio allows you to do this with ease!

DASHBOARD

![dashboard](https://user-images.githubusercontent.com/86244401/146270352-8a78c2d4-9f70-4c1c-bc29-4af190944b4a.JPG)

Creating a wallet in your Dashboard allows you to connect with the coins that you hold on different exchanges, giving you insights in an easy-to-understand format. All you have to do is add your coins and the amount you own of each.

![create wallet](https://user-images.githubusercontent.com/86244401/146270430-388ef913-ff62-42df-af35-9aa26e7bc8a0.JPG)

![add coin](https://user-images.githubusercontent.com/86244401/146270440-253b9519-d771-4b2f-977d-f959ef347ccd.JPG)

Once your wallets are created, you have easy access to them, as well as to relevant information on each coin. Things such as the amount that you own, the current price (real-time updated), the value (USD), and the 24h price movement.  You will also have the total balance of each wallet in USD and BTC.

![dashboard 1](https://user-images.githubusercontent.com/86244401/146271803-1e00015d-12e8-4c38-9764-63d26d759fa6.JPG)



COIN EXPLORE

If you want to discover new opportunities, just head over to Coin Explore. Here you can see the current top 10 coins of the market, these are the ones with more money invested in. In the search bar, you can just type the name or ticker of the coin you are interested in to investigate further.

![top 10](https://user-images.githubusercontent.com/86244401/146272556-35db6ecc-988f-41eb-a502-07c9ad59397e.JPG)



COIN PAGE

Here you can have a look at current data about the coin's market. EasyFolio also provides you:

  ~ a Trading View technical analysis indicator, letting you know whats the signal for each time frame;
  
  ~ and the price charts for the coin, that allows you to investigate the price movement history, as well as navigate through different chart indicators.
  
![coin page](https://user-images.githubusercontent.com/86244401/146274804-1de25755-e7ee-41a3-adc8-871cdb3d2de6.JPG)

![coin page 2](https://user-images.githubusercontent.com/86244401/146273337-8bbd8e1c-05a6-4f10-94e7-655d9cba618c.JPG)

You can also have a quick link to trade the coin in the main exchanges.

![trade](https://user-images.githubusercontent.com/86244401/146275057-261b719d-87b8-4020-9923-c0469f39c9a8.JPG)


WATCHLIST

In the Watchlist you will add the coins that you dont necessarly own, but want to keep an eye on. 
You can come back here from time to time and check if you see any interesting price movement. 

![watchlist](https://user-images.githubusercontent.com/86244401/146275709-267dc80e-9778-49de-919c-fd6f5703ca36.JPG)



- EasyFolio was an MVP project made during the course of Le Wagon's Web Development Bootcamp;
- The project was wrinten in Ruby on Rails;
- Javascript was used for some of the front-end features (such as the wallets tabs, the chart and indicator);
- All of the market data is being fetched for CoinGecko's API;
- Devise was used for users authentication and Pundit for authorizations.

Next Steps:

- Clean up the code;
- Exchange's API Key for wallet creation and assets update;
- Reballance Feature: lets the user set the ideal allocation of the assets. Shows the current allocation, the desired, and gives you the amount you should by or sell of each to reballance your portfolio;
- Better validations on the forms;
- Keep working on the front-end. 
