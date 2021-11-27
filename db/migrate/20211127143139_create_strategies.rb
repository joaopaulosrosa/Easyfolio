class CreateStrategies < ActiveRecord::Migration[6.0]
  def change
    create_table :strategies do |t|
      t.references :wallet

      t.timestamps
    end
  end
end
