class CreateUserTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :user_trades do |t|
      t.references :user, foreign_key: true
      t.references :trade, foreign_key: true

      t.timestamps
    end
  end
end
