# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    describe Api::V1::BusinessesController, type: :request do # rubocop:disable Metrics/BlockLength
      let_it_be(:user) { create(:user, :owner) }
      let_it_be(:business) { create(:business, user: user) }
      let_it_be(:token) { user_token(user) }

      context 'with valid params' do
        let!(:params) do
          {
            name: 'Laptop'
          }
        end

        it 'creates business' do
          put api_v1_business_path(business.id), params: params, headers: header_params(token: token)

          expect(status).to eq(200)
          expect(json['message']).to eq('Business Updated Successfully')
        end
      end

      context 'with invalid params' do
        let!(:params) do
          {
            name: nil
          }
        end

        it 'shows error' do
          put api_v1_business_path(business.id), params: params, headers: header_params(token: token)

          expect(status).to eq(422)
          expect(json['errors']).to eq('Business Update Failed')
        end
      end
    end
  end
end
