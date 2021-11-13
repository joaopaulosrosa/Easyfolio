class WatchlistsController < ApplicationController
  def show
    @watchlist = Watchlist.where(user: current_user)
    authorize @watchlist
  end
end
