class WatchlistsController < ApplicationController
  def show
    @watchlist = Watchlist.where(user: current_user)[0]
    authorize @watchlist
  end
end
