# frozen_string_literal: true

# app/controllers/businesses_controller.rb
module Api
  module V1
    # Implementation of Business Controller
    class BusinessesController < ApplicationController
      def index
        render(
          json: BusinessQuery.new(current_user: current_user).run,
          each_serializer: BusinessSerializer
        )
      end

      def create
        if BusinessCreate.new(current_user: current_user, params: business_params).call
          render json: { message: 'Business Created Successfully' }, status: :ok
        else
          render json: { errors: 'Business Created Failed' }, status: :unprocessable_entity
        end
      end

      def update
        if BusinessUpdate.new(id: params[:id], current_user: current_user, params: business_params).call
          render json: { message: 'Business Updated Successfully' }, status: :ok
        else
          render json: { errors: 'Business Update Failed' }, status: :unprocessable_entity
        end
      end

      private

      def business_params
        params.permit(:name, :shares_available, :user_id)
      end
    end
  end
end
