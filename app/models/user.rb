class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true

  has_many :trades
  has_many :stocks

  def executeTrade(trade)
    #create trades
    #do not allow short
    # return error if there's a selling less than 0
    #update balance
    #update stocks
    #
    puts trade
    return false;
  end



end
