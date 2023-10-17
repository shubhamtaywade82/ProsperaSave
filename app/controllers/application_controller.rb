# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      @decoded = JwtService.decode(token)
      @current_user = User.find(@decoded[:user_id])
    rescue JWT::DecodeError
      redirect_to new_session_path, alert: 'You need to sign in to access this page' unless signed_in?
    end
  end

  def signed_in?
    !!@current_user
  end
end
