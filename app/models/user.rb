class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  has_many :user_trades
  has_many :trades, through: :user_trades

  has_many :stocks
end
