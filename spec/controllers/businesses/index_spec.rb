# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    describe Api::V1::BusinessesController, type: :request do # rubocop:disable Metrics/BlockLength
      let_it_be(:user1) { create(:user, :owner) }
      let_it_be(:user2) { create(:user, :buyer) }
      let_it_be(:business1) { create(:business, user: user1) }
      let_it_be(:business2) { create(:business, user: user1) }
      let_it_be(:business3) { create(:business, user: user1) }
      let_it_be(:business4) { create(:business, user: user1) }
      let_it_be(:business5) { create(:business, user: user2) }

      context 'while Buyer wants to see list of Business' do
        let_it_be(:token) { user_token(user2) }

        it 'lists all businesses' do
          get api_v1_businesses_path, params: {}, headers: header_params(token: token)
          expect(status).to eq(200)

          expect(json.size).to eq(5)
          expect(json.pluck('name')).to match_array(
            [
              business1.name,
              business2.name,
              business3.name,
              business4.name,
              business5.name
            ]
          )
          expect(json.pluck('owner_name').uniq).to match_array([user1.name, user2.name])
        end
      end

      context 'while Owner wants to see list of Business' do
        let_it_be(:token) { user_token(user1) }

        it 'lists businesses that belongs to him' do
          get api_v1_businesses_path, params: {}, headers: header_params(token: token)
          expect(status).to eq(200)

          expect(json.size).to eq(4)
          expect(json.pluck('name')).to match_array([business1.name, business2.name, business3.name, business4.name])
          expect(json.pluck('owner_name').uniq).to match_array([user1.name])
        end
      end
    end
  end
end
