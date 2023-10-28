# frozen_string_literal: true

# app/controllers/orders_controller.rb
module Api
  module V1
    # Implementation of Order Controller
    class OrdersController < ApplicationController
      def index
        render(
          json: OrderQuery.new(current_user: current_user).run,
          each_serializer: OrderSerializer
        )
      end

      def create
        if OrderCreate.new(current_user: current_user, params: order_params).call
          render json: { message: 'Order Created Successfully' }, status: :ok
        else
          render json: { errors: 'Order Creation Failed' }, status: :unprocessable_entity
        end
      end

      def update
        if OrderUpdate.new(id: params[:id], current_user: current_user, params: order_update_params).call
          render json: { message: 'Order Updated Successfully' }, status: :ok
        else
          render json: { errors: 'Order Update Failed' }, status: :unprocessable_entity
        end
      end

      private

      def order_params
        params.permit(:quantity, :price, :business_id)
      end

      def order_update_params
        params.permit(:status)
      end
    end
  end
end
