# frozen_string_literal: true

module Api
  module V1
    class OrdersController < ApplicationController # rubocop:disable Style/Documentation
      def index
        render(
          json: OrderQuery.new(current_user: current_user).run,
          each_serializer: OrderSerializer
        )
      end

      def create
        if OrderCreate.new(current_user: current_user, params: order_params).call
          render json: { message: I18n.t('create.order.success') }, status: :ok
        else
          render json: { errors: I18n.t('create.order.errors') }, status: :unprocessable_entity
        end
      end

      def update
        if OrderUpdate.new(id: params[:id], current_user: current_user, params: order_update_params).call
          render json: { message: I18n.t('update.order.success') }, status: :ok
        else
          render json: { errors: I18n.t('update.order.errors') }, status: :unprocessable_entity
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
