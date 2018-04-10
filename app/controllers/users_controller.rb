class UsersController < ApplicationController

  def new
    @user = User.new
    p 'new'
  end

  def account
    if session[:user]
      @user = User.find_by(id: session[:user])
    else
      flash[:notice] = 'Please Sign In'
      redirect_to '/login'
    end
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
