class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :require_signin #, except: [:new, :create]


  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.save
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end #if
  end#create

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "#{@user.first_name}'s account has been successfully updated."
    else
      render :edit
    end #if
  end #update

  def destroy
    @user.destroy
    #TODO: make this so a user can delete another user without being signed out
    session[:user_id] = nil
    redirect_to root_url, alert: "#{@user.first_name}'s account has been successfully deleted."
  end #destroy

  private
    def set_user
      @user = User.find_by!(username: params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
    end
end
