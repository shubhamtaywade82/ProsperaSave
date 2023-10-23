# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users::Registrations' do
  describe 'GET #new' do
    it 'renders the registration form' do
      get new_registration_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:user_params) { attributes_for(:user) }

    it 'creates a new user when valid parameters are provided' do
      user_params.merge!(password_confirmation: user_params[:password])

      post registrations_path, params: { user: user_params }
      expect(response).to have_http_status(:found)

      follow_redirect!
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template with errors when invalid parameters are provided' do
      user_params.merge!(password_confirmation: 'wrong_password')

      post registrations_path, params: { user: user_params }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
