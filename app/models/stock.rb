class Stock < ApplicationRecord
  belongs_to :user


  # API_URL='https://api.iextrading.com/1.0/'
  API_URL='https://cloud.iexapis.com/stable/'
  # https://cloud.iexapis.com/stable/stock/aapl/quote?token=

  def self.getStock(symbol, api_endpoint)
      url = "#{API_URL}stock/#{symbol}/#{api_endpoint}?token="
      RestClient.get(url, headers= { :accept => :json, content_type: :json }){ |response|
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
