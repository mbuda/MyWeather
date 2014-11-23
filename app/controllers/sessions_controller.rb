class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_nick(params[:nick])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'You are now logged'
      redirect_to root_url
    else
      flash[:alert] = 'Nick or password is invalid'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You are now logged out'
    redirect_to root_url
  end
end
