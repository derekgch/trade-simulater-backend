class AddActionToTrades < ActiveRecord::Migration[5.2]
  def change
    add_column :trades, :action, :string
  end
end
