class UsersController < ApplicationController

before_action :ensure_logged_in


def ensure_logged_in
  if session[:user_id].nil?
    redirect_to signin_path, notice: "You must be logged in to access that action"
  end
end

  def index
    @users = User.all
    end

  def new
    @user = User.new
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'User was successfully destroyed'
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save
    redirect_to users_path, notice: 'User was successfully updated'
  end

  def create
    @user = User.new(user_params)
    if @user.save
    redirect_to users_path, notice: 'User was successfully created.'
  else
    render :new
  end
end
  def show
    @user = User.find(params[:id])
  end
private
  def user_params
    params.require(:user).permit(:first_name,:password,:last_name, :email,:password_confirmation)
  end
end
