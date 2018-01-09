class SessionsController < ApplicationController
  protect_from_forgery with: :exception
  include SessionsHelper

  def new
    @title = "Log In"
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user # log_in defined in sessions_helper.rb
      redirect_to user
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
