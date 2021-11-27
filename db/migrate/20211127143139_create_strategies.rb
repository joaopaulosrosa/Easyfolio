class CreateStrategies < ActiveRecord::Migration[6.0]
  def change
    create_table :strategies do |t|
      t.wallet :references

      t.timestamps
    end
  end
end
