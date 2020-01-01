class UsersController < ApplicationController
before_action :find_user, only: [:show, :edit, :update, :destroy]

def index
    @users = User.all
    render json: @users
end




def show
    render json: @user
end

private
def find_user
    @user = User.find(params[:id])
end

def user_params
    params.require(:user).permit(:name, :email, :password, :avatar, :bio)
end

end
