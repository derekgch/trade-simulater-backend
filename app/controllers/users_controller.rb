class UsersController < ApplicationController

    #authorized?(params[:id])
    def show
        if(requires_login && authorized?(params[:id]))
            @user = User.find(params[:id])
            render json: {user: @user.username, stocks:@user.stocks, trades:@user.trades}
        else
            render json: {message: "Please login"}
        end
    end

    def create
        user = User.create(username: params[:username], email: params[:email], password: params[:password], balance:5000)
        if user.valid?
            render json: {
                user: user.email,
                token: get_token(payload( user.username, user.id ))
            }
        else
            render json: user.errors
        end    

    end


    def update
        if(requires_login && authorized?(params[:id]))
            
            render json: {update:"yes"}
        else
            render json: {Err: "user.errors"}
        end
    end
end
