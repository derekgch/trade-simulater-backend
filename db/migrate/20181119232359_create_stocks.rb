class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.references :user, foreign_key: true
      t.string :stock_symbol
      t.integer :quantity

      t.timestamps
    end
  end
end
