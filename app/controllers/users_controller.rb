class UsersController < ApplicationController

  def index

    @users = User.all
    end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path, notice: 'User was successfully created.'
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end