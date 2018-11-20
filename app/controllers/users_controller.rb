class UsersController < ApplicationController

    #authorized?(params[:id])
    def show
        if(true)
            @user = User.find(params[:id])
            render json: {user: @user.username, stocks:@user.stocks, trades:@user.trades}
        else
            render json: {message: "Please login"}
        end
    end
end
