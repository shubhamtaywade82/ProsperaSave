# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    debugger
    @users = User.all
  end
end
