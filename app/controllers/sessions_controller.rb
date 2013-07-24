class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @temp_pass = params[:password]
    @user = User.find_by_login params[:login]
    
    if @user.password == @temp_pass
      session[:user_id] = @user.id
      
    else
      logged_in = false
      p "false" * 80
    end

    redirect_to root_path
  end

  def destroy
  end

end
