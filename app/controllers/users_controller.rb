class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Deu Bom!"
      redirect_to users_path
    else
      flash[:error] = "Deu Ruim!"
      render :new
    end
  end

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def user_params
    params.require( :user ).permit(
      :name, preferences: {}
    )
  end
end
