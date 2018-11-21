class UsersController < ApplicationController

    #authorized?(params[:id])
    def show
        if(requires_login && authorized?(params[:id]))
            @user = User.find(params[:id])
            render json: {user: @user.username, 
                stocks:@user.stocks, 
                trades:@user.trades, 
                balance: @user.balance,
                head:200}
        else
            render json: {message: "Please login", head:404}
        end
    end

    def create
        user = User.create(username: params[:username], email: params[:email], password: params[:password], balance:5000.00)
        if user.valid?
            render json: {
                ok: true,
                user: user.email,
                token: get_token(payload( user.email, user.id ))
            }
        else
            render json: user.errors
        end    

    end


    #execute trade transactions
    def trades
        if(requires_login && authorized?(params[:id]))
            @user = User.find(params[:id])
            # byebug
            if @user.executeTrade(params[:trade])
                render json: {trades:@user.trades, stocks: @user.stocks , head:200}
            else
                render json: {ERR: "Aborted! Not enough stocks to sell!", head:501}
            end
        else
            render json: {Err: "user.errors",:head => 404}
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
