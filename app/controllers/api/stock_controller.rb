class Api::StockController < ApplicationController

    def search
        result = Stock.getStock(params[:id], 'quote')
        render json: result
    end

    def price
        result = Stock.getBatch(params[:id], 'price')
        render json: result
    end


    def batch
        result = Stock.getBatch(params[:id], 'quote')
        render json: result
    end

    def chart
        result = Stock.getChart(params[:id], params[:range])
        render json: result
    end

    def active
        result = Stock.getActive()
        render json: result
    end
end