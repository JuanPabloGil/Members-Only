# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user&.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in(user)
      flash[:success] = 'Logged in Successful'
      redirect_to root_path

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    if log_out
      flash[:success] = 'Logged out'
      redirect_to root_url
    else
      render 'new'
    end
  end
end
