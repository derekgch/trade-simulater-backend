class SessionsController < ApplicationController
    def create
        @user = User.find_by(email: params[:email])

        if (@user && @user.authenticate(params[:password]))
            render json: {
                username: @user.username,
                id: @user.id,
                token: get_token(payload( @user.email, @user.id ))
            } 
        else
            render json: { err: "Wrong Password/Username" }, status: :unathorized
        end
    end
end
