class UsersController < ApplicationController

    #authorized?(params[:id])
    def show
        if(requires_login && authorized?(params[:id]))
            @user = User.find(params[:id])
            render json: {user: @user.username, 
                stocks:@user.stocks, 
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
    #post '/trades/:id'
    def trades
        if(requires_login && authorized?(params[:id]))
            @user = User.find(params[:id])
            if @user.executeTrade(params[:trade])
                # byebug
                @user.reload
                render json: { user:@user.username, 
                    stocks: @user.stocks, 
                    balance:@user.balance, 
                    head:200}
            else
                render json: {ERR: "Aborted! Not enough stocks to sell!", head:500}
            end
        else
            render json: {ERR: "user.errors",:head => 404}
        end

    end

    #get trade history
    #get '/trades/:id'

    def history
        if(requires_login && authorized?(params[:id]))
            @user = User.find(params[:id])
            @trades = @user.trades.order('trades.created_at DESC')
            trades = @trades.page(params[:page] ? params[:page].to_i : 1)
            render json: {trades:trades, meta:pagination_meta(trades) }

        else
            render json: {ERR: "user.errors",:head => 404}
        end
    end

    #for testing only
    # def page
    #     @user = User.find(params[:id])
    #     # render json: {trades:@user.trades}
    #     @trades = @user.trades.order('trades.created_at DESC')
    #     # byebug
    #     trades = @trades.page(params[:page] ? params[:page].to_i : 1)
    #     render json: {trades:trades, meta:pagination_meta(trades) }

    # end


    # def update
    #     if(requires_login && authorized?(params[:id]))
            
    #         render json: {update:"yes"}
    #     else
    #         render json: {ERR: "user.errors"}
    #     end
    # end

    private
    def pagination_meta(object)
        {
        current_page: object.current_page,
        next_page: object.next_page,
        prev_page: object.prev_page,
        total_pages: object.total_pages,
        total_count: object.total_count
        }
    end
end
