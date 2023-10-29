# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    describe Api::V1::OrdersController, type: :request do # rubocop:disable Metrics/BlockLength
      let_it_be(:user1) { create(:user, :owner, with_permissions: { order: :update }) }
      let_it_be(:user2) { create(:user, :buyer) }
      let_it_be(:business) { create(:business, user: user1) }
      let_it_be(:order) { create(:order, user: user2, business: business) }

      context 'with permissions' do
        let_it_be(:token) { user_token(user1) }

        context 'with valid params' do
          let(:params) { { status: 'approved' } }

          it 'updates order' do
            put api_v1_order_path(order.id), params: params, headers: header_params(token: token)

            expect(status).to eq(200)
            expect(json['message']).to eq(t('update.order.success'))
          end
        end

        context 'with invalid params' do
          let(:params) { { status: nil } }

          it 'shows error' do
            put api_v1_order_path(order.id), params: params, headers: header_params(token: token)

            expect(status).to eq(422)
            expect(json['errors']).to eq(t('update.order.errors'))
          end
        end
      end

      context 'without permissions' do
        let_it_be(:token) { user_token(user2) }
        let(:params) { { status: 'approved' } }

        it 'generates unauthorization error' do
          put api_v1_order_path(order.id), params: params, headers: header_params(token: token)

          expect(status).to eq(400)
          expect(json['errors'][0]).to eq('Not Authorized')
        end
      end
    end
  end
end
