class UsersController < ApplicationController
before_action :find_user, only: [:show, :edit, :update, :destroy]

def index
    @users = User.all
    render json: @users, include: '**'
end



def create
    @user = User.create(user_params)
    if @user.valid?
        render json: {token: create_token(@user.id)}, status: :created
    else
        render json: {error: @user.errors.full_messages}, status: :not_acceptable
    end
end

def show
    user_id = params[:id]
    if logged_in_user_decoded == @user.id
        render json: @user, include: '**'
    else
        render json: {error: 'Go Away!'}
    end
end

private
def find_user
    @user = User.find(params[:id])
end

def user_params
    params.permit(:name, :email, :password)
end

end
