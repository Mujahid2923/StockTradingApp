# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    describe Api::V1::BusinessesController, type: :request do # rubocop:disable Metrics/BlockLength
      let_it_be(:user1) { create(:user, :owner, with_permissions: { business: :create }) }
      let_it_be(:user2) { create(:user, :buyer) }

      context 'with permissions' do # rubocop:disable Metrics/BlockLength
        let_it_be(:token) { user_token(user1) }

        context 'with valid params' do
          let(:params) do
            {
              name: 'Desktop',
              shares_available: 15,
              user_id: user1.id
            }
          end

          it 'creates business' do
            post api_v1_businesses_path, params: params, headers: header_params(token: token)

            expect(status).to eq(200)
            expect(json['message']).to eq(t('create.business.success'))
          end
        end

        context 'with invalid params' do
          let(:params) do
            {
              name: 'Desktop',
              shares_available: 15,
              user_id: nil
            }
          end

          it 'shows error' do
            post api_v1_businesses_path, params: params, headers: header_params(token: token)

            expect(status).to eq(422)
            expect(json['errors']).to eq(t('create.business.errors'))
          end
        end
      end

      context 'without permissions' do
        let_it_be(:token) { user_token(user2) }
        let(:params) do
          {
            name: 'Desktop',
            shares_available: 15,
            user_id: user2.id
          }
        end

        it 'generates unauthorization error' do
          post api_v1_businesses_path, params: params, headers: header_params(token: token)

          expect(status).to eq(400)
          expect(json['errors'][0]).to eq('Not Authorized')
        end
      end
    end
  end
end
