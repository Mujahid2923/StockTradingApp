# frozen_string_literal: true

# app/controllers/orders_controller.rb
module Api
  module V1
    # Implementation of Order Controller
    class PurchasesController < ApplicationController
      def index
        render(
          json: OrderQuery.new(current_user: current_user).run,
          each_serializer: PurchaseSerializer
        )
      end
    end
  end
end
