# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    describe Api::V1::BusinessesController, type: :request do # rubocop:disable Metrics/BlockLength
      let_it_be(:user) { create(:user, :owner) }
      let_it_be(:token) { user_token(user) }

      context 'with valid params' do
        let!(:params) do
          {
            name: 'Desktop',
            shares_available: 15,
            user_id: user.id
          }
        end

        it 'creates business' do
          post api_v1_businesses_path, params: params, headers: header_params(token: token)

          expect(status).to eq(200)
          expect(json['message']).to eq('Business Created Successfully')
        end
      end

      context 'with invalid params' do
        let!(:params) do
          {
            name: 'Desktop',
            shares_available: 15,
            user_id: nil
          }
        end

        it 'shows error' do
          post api_v1_businesses_path, params: params, headers: header_params(token: token)

          expect(status).to eq(422)
          expect(json['errors']).to eq('Business Created Failed')
        end
      end
    end
  end
end
