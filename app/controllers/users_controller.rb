class UsersController < ApplicationController
  before_filter :require_params, only:[:create]

  def index
  end

  def new
    @user = User.new(params[:user])
  end

  def create
    @user = User.new(params[:user])
    @user.save!

    @user_all = User.all
  end

protected
  def require_params
    unless params[:login] != nil || params[:password_digest]
      render :inline => 'Login/Password cannot remain blank!', :status => 404 and return false
    end
  end

  def user_require
    params.require(:user).permit(:login, :password_digest)
  end
end



