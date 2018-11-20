class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true

  has_many :trades
  has_many :stocks

  def executeTrade(trade)
    #{sym:aapl, quantity:100, price:100, action:buy}
    #create trades
    #do not allow short
    # return error if there's a selling less than 0
    #update balance
    #update stocks
    #
    
    byebug
    # result = JSON.parse(trade)
    puts "executed trade!"
    puts trade
    return true;
  end



end
