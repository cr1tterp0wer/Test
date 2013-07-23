class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new(params[:user])
  end

  def create  
    @user = User.new(params[:user])
  
    unless @user.save
      render :action => :new and return
      @users = User.all
    else
      @users = User.all
      redirect_to root_path
    end

  end

protected
  def user_require
    params.require(:user).permit(:login, :password_digest)
  end
end



