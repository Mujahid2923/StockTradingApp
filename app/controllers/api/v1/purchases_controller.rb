# frozen_string_literal: true

module Api
  module V1
    class PurchasesController < ApplicationController # rubocop:disable Style/Documentation
      def index
        render(
          json: OrderQuery.new(current_user: current_user).run,
          each_serializer: PurchaseSerializer
        )
      end
    end
  end
end
