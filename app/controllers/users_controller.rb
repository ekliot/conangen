class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def account
  end

  def create
    @user = User.new( params[:user] )
    if @user.save
      # create
    else
      render 'new'
    end
  end
end
