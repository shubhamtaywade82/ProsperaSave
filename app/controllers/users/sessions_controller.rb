# frozen_string_literal: true

class Users::SessionsController < ApplicationController
  skip_before_action :authenticate!

  def new; end

  def create
    user = User.find_by(email: session_params[:email])

    if authenticate_user(user)
      log_user_in(user)
    else
      handle_failed_login
    end
  end

  def destroy
    session.delete(:jwt_token)
    redirect_to new_session_path, notice: 'Logged out successfully!'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def authenticate_user(user)
    user&.authenticate(session_params[:password])
  end

  def log_user_in(user)
    payload = { user_id: user.id }
    token = JsonWebToken.encode(payload)
    session[:jwt_token] = token
    redirect_to root_path, notice: 'Logged in successfully!'
  end

  def handle_failed_login
    flash.now[:alert] = 'Invalid credentials'
    render :new
  end
end
