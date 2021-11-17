class CreateCoinBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :coin_bookmarks do |t|
      t.references :watchlist, null: false, foreign_key: true
      t.string :coin_ticker

      t.timestamps
    end
  end
end
