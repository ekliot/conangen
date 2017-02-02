class UsersController < ApplicationController
  include UsersHelper
  def new
    @user = User.new
    p 'new'
  end

  def account
    if session[:user]
      @user = User.find_by(id: session[:user])
    else
      redirect_to '/login'
    end
  end

  def session_create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      p "found"
      redirect_to '/account'
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      @user = User.new
      render 'login'
    end
  end

  def session_delete
    session[:user] = nil
    redirect_to root_url

  end

  def login
    @user = User.new
    p 'new1'
  end


  def create
    @user = User.new( user_params )
    if @user.save
      flash[:success] = "THIS IS A SUCCESS FLASH"
      session[:user] = @user.id
      redirect_to '/account'
    else
      render 'new'
    end
  end

  def destroy
  end

  def edit
  end

  # ===========================

  private

    def user_params
      params.require( :user ).permit( :name, :email, :password,
                                      :password_confirmation )
    end

end
