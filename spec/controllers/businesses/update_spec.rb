# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    describe Api::V1::BusinessesController, type: :request do # rubocop:disable Metrics/BlockLength
      let_it_be(:user1) { create(:user, :owner, with_permissions: { business: :update }) }
      let_it_be(:user2) { create(:user, :buyer) }
      let_it_be(:business) { create(:business, user: user1) }

      context 'with permissions' do
        let_it_be(:token) { user_token(user1) }

        context 'with valid params' do
          let(:params) { { name: 'laptop' } }

          it 'updates business' do
            put api_v1_business_path(business.id), params: params, headers: header_params(token: token)

            expect(status).to eq(200)
            expect(json['message']).to eq(t('update.business.success'))
          end
        end

        context 'with invalid params' do
          let(:params) { { name: nil } }

          it 'shows error' do
            put api_v1_business_path(business.id), params: params, headers: header_params(token: token)

            expect(status).to eq(422)
            expect(json['errors']).to eq(t('update.business.errors'))
          end
        end
      end

      context 'without permissions' do
        let_it_be(:token) { user_token(user2) }
        let(:params) { { name: 'laptop' } }

        it 'generates unauthorization error' do
          put api_v1_business_path(business.id), params: params, headers: header_params(token: token)

          expect(status).to eq(400)
          expect(json['errors'][0]).to eq('Not Authorized')
        end
      end
    end
  end
end
