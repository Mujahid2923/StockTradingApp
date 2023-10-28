# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    describe Api::V1::OrdersController, type: :request do # rubocop:disable Metrics/BlockLength
      let_it_be(:user1) { create(:user, :owner) }
      let_it_be(:user2) { create(:user, :buyer) }

      let_it_be(:business1) { create(:business, user: user1) }

      let_it_be(:token) { user_token(user2) }

      context 'with valid params' do
        let!(:params) do
          {
            price: 120,
            quantity: 15,
            business_id: business1.id
          }
        end

        it 'creates order' do
          post api_v1_orders_path, params: params, headers: header_params(token: token)

          expect(status).to eq(200)
          expect(json['message']).to eq('Order Created Successfully')
        end
      end

      context 'with invalid params' do
        let!(:params) do
          {
            price: 120,
            quantity: -1,
            business_id: business1.id
          }
        end

        it 'shows error' do
          post api_v1_orders_path, params: params, headers: header_params(token: token)

          expect(status).to eq(422)
          expect(json['errors']).to eq('Order Creation Failed')
        end
      end
    end
  end
end
