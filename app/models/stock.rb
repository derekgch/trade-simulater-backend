class Stock < ApplicationRecord
  belongs_to :user


  API_URL='https://api.iextrading.com/1.0/'

  def self.getStock(symbol, api_endpoint)
      
      RestClient.get("#{API_URL}tops?symbols=#{symbol}", headers= { :accept => :json, content_type: :json }){ |response|
        case response.code
        when 200
          puts "Found!"
          return data = JSON.parse(response.body)
        else
          return {status:"NOT FOUND", head:404}
        end
      }    
  end


  #https://api.iextrading.com/1.0/stock/market/batch?symbols=aapl,fb&types=quote
  def self.getBatch(symbols, endpoint)
    RestClient.get("#{API_URL}stock/market/batch?symbols=#{symbols}&types=#{endpoint}", headers= { :accept => :json, content_type: :json }){ |response|
      case response.code
      when 200
        puts "Found!"
        return data = JSON.parse(response.body)
      else
        return {status:"NOT FOUND", head:404}
      end
    }    

  end


end
