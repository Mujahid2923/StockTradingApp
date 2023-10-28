# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    describe Api::V1::OrdersController, type: :request do # rubocop:disable Metrics/BlockLength
      let_it_be(:user1) { create(:user, :owner) }
      let_it_be(:user2) { create(:user, :buyer) }
      let_it_be(:user3) { create(:user, :buyer) }

      let_it_be(:business1) { create(:business, user: user1) }
      let_it_be(:business2) { create(:business, user: user1) }

      let_it_be(:order1) { create(:order, user: user2, business: business1) }
      let_it_be(:order2) { create(:order, user: user2, business: business1) }
      let_it_be(:order3) { create(:order, user: user3, business: business2) }
      let_it_be(:order4) { create(:order, status: 1, user: user3, business: business2) }

      context 'while owner wants to see list of pending order' do
        let_it_be(:token) { user_token(user1) }

        it 'lists all orderes' do
          get api_v1_orders_path, params: {}, headers: header_params(token: token)
          expect(status).to eq(200)

          expect(json.size).to eq(3)
          expect(json.pluck('quantity')).to match_array(
            [
              order1.quantity,
              order2.quantity,
              order3.quantity
            ]
          )
          expect(json.pluck('buyer_name').uniq).to match_array([user2.name, user3.name])
        end
      end

      context 'while buyer wants to see list of order' do
        let_it_be(:token) { user_token(user3) }

        it 'lists all orderes which belongs to buyer' do
          get api_v1_orders_path, params: {}, headers: header_params(token: token)
          expect(status).to eq(200)

          expect(json.size).to eq(1)
          expect(json.pluck('quantity')).to match_array([order3.quantity])
          expect(json.pluck('buyer_name').uniq).to match_array([user3.name])
        end
      end
    end
  end
end
