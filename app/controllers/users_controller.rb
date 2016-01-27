class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :require_signin, except: [:new, :create]


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
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
    session[:user_id] = nil
    redirect_to root_url, alert: "#{@user.first_name}'s account has been successfully deleted."
  end #destroy

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by!(username: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
    end
end
