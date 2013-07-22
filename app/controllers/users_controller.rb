class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user_params])
    @user.save!

    redirect_to :root
  end
end
