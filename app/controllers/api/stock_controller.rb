class Api::StockController < ApplicationController

    def search
        result = Stock.getStock(params[:id], 'quote')
        # byebug
        render json: result
    end
end