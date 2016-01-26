class SessionsController < ApplicationController
  def new
    @background_image = "grass-1383426-1599x1066.jpg"
  end #new

  def create
     user = User.find_by(email: params[:email])
     if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       flash[:notice] = "Welcome back, #{user.first_name}!"
       redirect_to(session[:intended_url] || user)
       session[:intended_url] = nil
     else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new
     end #if
   end #create

   def destroy
     session[:user_id] = nil 
     redirect_to root_url, notice: "You're now signed out!"
   end #destroy
     
end #SessionsController
