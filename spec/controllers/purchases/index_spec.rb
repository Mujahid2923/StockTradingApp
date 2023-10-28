# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    describe Api::V1::PurchasesController, type: :request do
      let_it_be(:user1) { create(:user, :owner) }
      let_it_be(:user2) { create(:user, :buyer) }

      let_it_be(:business1) { create(:business, user: user1) }

      let_it_be(:purchase1) { create(:order, user: user2, business: business1) }
      let_it_be(:purchase2) { create(:order, user: user2, business: business1) }

      let_it_be(:token) { user_token(user2) }

      it 'lists all purchases' do
        get api_v1_purchases_path, params: {}, headers: header_params(token: token)
        expect(status).to eq(200)

        expect(json.size).to eq(2)
        expect(json.pluck('quantity')).to match_array(
          [
            purchase1.quantity,
            purchase2.quantity
          ]
        )
        expect(json.pluck('business_name').uniq).to match_array([business1.name])
      end
    end
  end
end
