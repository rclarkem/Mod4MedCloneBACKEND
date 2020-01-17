class LoginController < ApplicationController

    def create
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            render json: {message: "Valid Login"}
        else
            render json: {error: ["That does not match anyone"]}, status: :not_acceptable
        end
    end

end
