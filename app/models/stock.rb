class Stock < ApplicationRecord
  belongs_to :user

  # puts 'API TOKEN IS :'
  # puts ENV['API_TOKEN']


  # API_URL='https://api.iextrading.com/1.0/'
  API_URL='https://cloud.iexapis.com/stable/'
  # https://cloud.iexapis.com/stable/stock/aapl/quote?token=
  API_KEY = ENV['API_TOKEN']

  def self.getStock(symbol, api_endpoint)
      url = "#{API_URL}stock/#{symbol}/#{api_endpoint}?token=#{API_KEY}"
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


  #https://cloud.iexapis.com/stable/stock/market/batch?symbols=aapl,fb&types=quote
  def self.getBatch(symbols, endpoint)
    url = "#{API_URL}stock/market/batch?symbols=#{symbols}&types=quote&token=#{API_KEY}"
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


  def self.getChart(symbol)
    url = "#{API_URL}stock/market/batch?symbols=#{symbol}&types=chart&range=1m&token=#{API_KEY}"
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

end
