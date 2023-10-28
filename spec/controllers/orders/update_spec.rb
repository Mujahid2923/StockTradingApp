# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    describe Api::V1::OrdersController, type: :request do # rubocop:disable Metrics/BlockLength
      let_it_be(:user1) { create(:user, :owner) }
      let_it_be(:user2) { create(:user, :buyer) }

      let_it_be(:business) { create(:business, user: user1) }

      let_it_be(:order) { create(:order, user: user2, business: business) }
      let_it_be(:token) { user_token(user1) }

      context 'with valid params' do
        let!(:params) do
          {
            status: 'approved'
          }
        end

        it 'creates business' do
          put api_v1_order_path(order.id), params: params, headers: header_params(token: token)

          expect(status).to eq(200)
          expect(json['message']).to eq('Order Updated Successfully')
        end
      end

      context 'with invalid params' do
        let!(:params) do
          {
            status: nil
          }
        end

        it 'shows error' do
          put api_v1_order_path(order.id), params: params, headers: header_params(token: token)

          expect(status).to eq(422)
          expect(json['errors']).to eq('Order Update Failed')
        end
      end
    end
  end
end
