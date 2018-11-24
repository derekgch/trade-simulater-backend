class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_many :trades
  has_many :stocks

  def executeTrade(trade)
    #{sym:aapl, quantity:100, price:100, action:buy}
    #create trades
    #do not allow short
    # return error if there's a selling less than 0
    #update balance
    #update stocks
    #trade[:sym], trade[:action], trade[:quantity],trade[:price]
    # byebug
    validTrade = false;
    if(trade[:action] == "BUY")
      newBalance = self.balance - trade[:price].to_f*trade[:quantity].to_i;
      # byebug

      if newBalance > 0
        validTrade = true;
      end

    elsif (trade[:action]== "SELL")
      newBalance = self.balance + trade[:price].to_f*trade[:quantity].to_i;
      foundStock = self.stocks.find{|item| item.stock_symbol == trade[:sym]};
      # byebug
      if(foundStock)
        if foundStock.quantity >= trade[:quantity]
          validTrade = true;
        end
      end
    end
    newTrade = Trade.new(user:self, stock_symbol:trade[:sym].upcase, quantity:trade[:quantity], price:trade[:price], action:trade[:action])
    if(newTrade && validTrade)

      newTrade.save;
      self.update_attribute(:balance, newBalance)
      # byebug

      puts "executed trade!"
      self.updateStocks(newTrade)
      puts self.balance
      return true;
    else
      return false;
    end
  

  end

  def updateStocks(trade)
    foundStock = self.stocks.find{|item| item.stock_symbol == trade.stock_symbol};
    # byebug;
    if foundStock
      if(trade[:action] == 'BUY')
        foundStock.quantity = foundStock.quantity + trade[:quantity];
      elsif trade[:action] == 'SELL'
        foundStock.quantity = foundStock.quantity - trade[:quantity];
      end

      foundStock.save;
      if(foundStock.quantity == 0)
        foundStock.delete;
      end

    else
      newStock = Stock.new(user:self, stock_symbol:trade.stock_symbol, quantity:trade.quantity);
      if(newStock)
        newStock.save;
      else
        return false;
      end
    end
    return true;
  end

  


end
