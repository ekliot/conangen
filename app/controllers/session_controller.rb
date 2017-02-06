class SessionController < ApplicationController
  include SessionHelper

  def login
    @user = User.new
  end

  def session_create
    user = User.find_by( email: params[:session][:email] )
    if user && user.authenticate( params[:session][:password] )
      log_in user
      redirect_to '/account'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      @user = User.new
      redirect_to '/login'
    end
  end

  def session_delete
    session[:user] = nil
    redirect_to root_url
  end

end
