class CreateCoinShares < ActiveRecord::Migration[6.0]
  def change
    create_table :coin_shares do |t|
      t.references :strategy, null: false, foreign_key: true
      t.float :coin_share
      t.string :coin_ticker
      t.timestamps
    end
  end
end
