class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.string :stock_symbol
      t.integer :quantity
      t.string :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
