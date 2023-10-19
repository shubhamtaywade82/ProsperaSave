# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate!

  private

  def authenticate!
    if session[:jwt_token]
      begin
        decoded_token = JsonWebToken.decode(session[:jwt_token])
        @current_user = User.find(decoded_token[:user_id])
      rescue JWT::DecodeError
        session.delete(:jwt_token) # Remove invalid token from the session
        flash[:alert] = 'Your session has expired. Please log in.'
        redirect_to new_session_path
      rescue ActiveRecord::RecordNotFound
        session.delete(:jwt_token) # Remove invalid token from the session
        flash[:alert] = 'Your session has expired. Please log in.'
        redirect_to new_session_path
      end
    else
      flash[:alert] = 'Please log in.'
      redirect_to new_session_path
    end
  end

  def current_user
    @current_user ||= User.find
  end

  def signed_in?
    !!@current_user
  end
end
