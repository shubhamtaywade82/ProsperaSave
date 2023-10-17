# frozen_string_literal: true

class Users::SessionsController < ApplicationController
  def new; end

  def create
    # Authenticate the user here
    # If authentication is successful, generate a JWT token
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      payload = { user_id: user.id }
      token = JwtService.encode(payload)

      render json: { token: }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  def destroy; end
end
