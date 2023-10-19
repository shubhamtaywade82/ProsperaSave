# frozen_string_literal: true

class Users::RegistrationsController < ApplicationController
  skip_before_action :authenticate!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to users_path, notice: 'User was successfully created'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
