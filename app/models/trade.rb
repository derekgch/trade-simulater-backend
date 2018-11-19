class Trade < ApplicationRecord
    has_many :user_trades
    has_many :users, through: :user_trades
end
