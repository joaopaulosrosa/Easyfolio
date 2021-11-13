class Watchlist < ApplicationRecord
  belongs_to :user
  has_many :coin_bookmarks, dependent: :destroy
end
