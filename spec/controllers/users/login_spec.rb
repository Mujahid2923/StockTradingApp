# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe Api::V1::SessionsController, type: :request do
      let_it_be(:user) { create(:user, :owner) }

      context 'with sign in' do
        it 'returns user details' do
          post user_session_path, params: { user: { email: user.email, password: user.password } }

          expect(status).to eq(200)
          expect(json['id']).to eq(user.id)
          expect(json['email']).to eq(user.email)

          token = response.header['Authorization']
          get api_v1_businesses_path, params: {}, headers: header_params(token: token)
          expect(status).to eq(200)
        end
      end

      context 'with sign out' do
        it 'logouts admin' do
          post user_session_path, params: { user: { email: user.email, password: user.password } }
          expect(status).to eq(200)
          expect(json['id']).to eq(user.id)
          expect(json['email']).to eq(user.email)

          delete '/api/v1/users/sign_out', params: { user: { email: user.email, password: user.password } }
          expect(status).to eq(204)
        end
      end
    end
  end
end
