class CreateAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :assets do |t|
      t.float :amount
      t.string :coin_ticker
      t.references :wallet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
