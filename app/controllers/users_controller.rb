class UsersController < ApplicationController

  before_action :ensure_logged_in

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
    if current_user.id != @user.id
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404 and return
    end
  end
  def update
    @user = User.find(params[:id])
    if current_user.admin
     @user.update(admin_user_params)
    else
      @user.update(user_params)
    end
    @user.save
    redirect_to users_path, notice: 'User was successfully updated'
  end

  def create
    if current_user.admin
      @user = User.new(admin_user_params)
    else
      @user = User.new(user_params)
    end
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
    params.require(:user).permit(:first_name,:password,:last_name, :email,:password_confirmation, :pivotal_tracker_token)
  end
  def admin_user_params
    params.require(:user).permit(:first_name,:password,:last_name, :email,:password_confirmation, :pivotal_tracker_token, :admin)
  end
end
