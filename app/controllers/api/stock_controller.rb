class Api::StockController < ApplicationController

    def search
        # byebug
        result = Stock.getStock(params[:id], 'quote')
        # byebug
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
end