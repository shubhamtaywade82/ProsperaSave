# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users' do
  describe 'GET /users' do
    context 'when the user is authenticated' do
      it 'renders the index page' do
        user1, user2 = create_list(:user, 2)
        jwt_token = JsonWebToken.encode(user_id: user1.id)
        @request.session[:jwt_token] = jwt_token

        get users_path, headers: { 'Authorization' => "Bearer #{jwt_token}" }

        expect(response).to have_http_status(:found)
        expect(assigns(:users)).to eq [user1, user2]
      end
    end

    context 'when the user is not authenticated' do
      it 'redirects to the login page' do
        get users_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(new_session_path)
      end
    end
  end
end
