# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = GuaranteedUser.find_by(email: params[:email])

    if user.authenticate(params[:password])
      create_user_session(user)
    else
      display_error(user)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You're now signed out!"
  end

  private

  def create_user_session(user)
    session[:user_id] = user.id
    flash[:notice] = "Welcome back, #{user.first_name}!"
    redirect_to(session[:intended_url] || user)
    session[:intended_url] = nil
  end

  def display_error
    flash.now[:alert] = 'Invalid email/password combination!'
    render :new
  end
end
