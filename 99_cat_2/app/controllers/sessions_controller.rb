class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = ["Invalid Login!"]
      redirect_to user_url
    end
  end

  def destroy
    if @current_user
      @current_user.session[:session_token] = nil
      @current_user.reset_session_token!
    end
  end
end
