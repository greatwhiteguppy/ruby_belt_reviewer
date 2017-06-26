class UsersController < ApplicationController
  before_action :require_login, except: [:index, :create]
  def index
    #serves the purpose of the new function, too
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome"
      redirect_to "/events"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/"
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user != :current_user #requires a helper method in application controller
      redirect_to "/users/#{current_user.id}"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user != :current_user
      redirect_to "/users/#{current_user.id}"
    elsif @user == :current_user
      @user.update user_params
    if @user.valid?
      @user.save
      redirect_to "/events"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}"
    end
  end
  end

  def destroy
    @user = User.find(params[:id])
    if @user != :current_user
      redirect_to "/users/#{current_user.id}"
    elsif @user = :current_user && @user.destroy
      reset_session
      redirect_to "/"
    else
      redirect_to "/users/#{@user.id}"
    end
  end

private
def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
end
end
