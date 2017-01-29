class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def account
    # if session[:user_id].nil?
    #   redirect_to '/login'
    # else
    #
    # end
  end

  def login
    @user = User.new
    # session[:user_id] = @user.id
    # redirect_to 'application#home'
  end

  def logout
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
