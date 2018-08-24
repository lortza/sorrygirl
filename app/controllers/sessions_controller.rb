# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
       session[:user_id] = user.id
       flash[:notice] = "Welcome back, #{user.first_name}!"
       redirect_to(session[:intended_url] || user)
       session[:intended_url] = nil
     else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new
     end #if
   end #create
    user = GuaranteedUser.find_by(email: params[:email])

    if user.authenticate(params[:password])

   def destroy
     session[:user_id] = nil 
     redirect_to root_url, notice: "You're now signed out!"
   end #destroy
     
end #SessionsController
