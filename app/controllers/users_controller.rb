class UsersController < ApplicationController
before_action :find_user, only: [:show, :edit, :update, :destroy]

def index
    @users = User.all
    render json: @users, include: '**'
end



def create
    # @user = User.create(user_params)
    # if @user.valid?
    #     render json: {user: UserSerializer.new(@user)}, status: :created
    # else
    #     render json: {error: 'failed to create user'}, status: :not_acceptable
    # end
end

def show
    render json: @user, include: '**'
end

private
def find_user
    @user = User.find(params[:id])
end

def user_params
    params.require(:user).permit(:name, :email, :password, :avatar, :bio, :img)
end

end
