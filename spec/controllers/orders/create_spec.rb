# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    describe Api::V1::OrdersController, type: :request do # rubocop:disable Metrics/BlockLength
      let_it_be(:user1) { create(:user, :owner) }
      let_it_be(:user2) { create(:user, :buyer, with_permissions: { order: :create }) }
      let_it_be(:business1) { create(:business, user: user1) }

      context 'with permissions' do # rubocop:disable Metrics/BlockLength
        let_it_be(:token) { user_token(user2) }

        context 'with valid params' do
          let(:params) do
            {
              price: 120,
              quantity: 15,
              business_id: business1.id
            }
          end

          it 'creates order' do
            post api_v1_orders_path, params: params, headers: header_params(token: token)

            expect(status).to eq(200)
            expect(json['message']).to eq(t('create.order.success'))
          end
        end

        context 'with invalid params' do
          let(:params) do
            {
              price: 120,
              quantity: -1,
              business_id: business1.id
            }
          end

          it 'shows error' do
            post api_v1_orders_path, params: params, headers: header_params(token: token)

            expect(status).to eq(422)
            expect(json['errors']).to eq(t('create.order.errors'))
          end
        end
      end

      context 'without permissions' do
        let_it_be(:token) { user_token(user1) }
        let!(:params) do
          {
            price: 120,
            quantity: 15,
            business_id: business1.id
          }
        end

        it 'generates unauthorization error' do
          post api_v1_orders_path, params: params, headers: header_params(token: token)

          expect(status).to eq(400)
          expect(json['errors'][0]).to eq('Not Authorized')
        end
      end
    end
  end
end
