class CoinBookmarksController < ApplicationController
  def new
    @watchlist = Watchlist.find(params[:watchlist_id])
    @coin_bookmark = CoinBookmark.new
    authorize @coin_bookmark
  end

  def create
    @coin_bookmark = CoinBookmark.new(bookmark_params)
    @watchlist = Watchlist.find(params[:watchlist_id])
    @coin_bookmark.watchlist = @watchlist
    if @coin_bookmark.save
      redirect_to watchlist_path
    end
    authorize @coin_bookmark
  end

  def destroy
    @coin_bookmark = CoinBookmark.find(params[:id])
    authorize @coin_bookmark
    @coin_bookmark.destroy
    redirect_to watchlist_path
  end

  private

  def bookmark_params
    params.require(:coin_bookmark).permit(:coin_ticker)
  end
end
