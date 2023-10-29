# frozen_string_literal: true

module Api
  module V1
    class BusinessesController < ApplicationController # rubocop:disable Style/Documentation
      def index
        render(
          json: BusinessQuery.new(current_user: current_user).run,
          each_serializer: BusinessSerializer
        )
      end

      def create
        if BusinessCreate.new(current_user: current_user, params: business_params).call
          render json: { message: I18n.t('create.business.success') }, status: :ok
        else
          render json: { errors: I18n.t('create.business.errors') }, status: :unprocessable_entity
        end
      end

      def update
        if BusinessUpdate.new(id: params[:id], current_user: current_user, params: business_params).call
          render json: { message: I18n.t('update.business.success') }, status: :ok
        else
          render json: { errors: I18n.t('update.business.errors') }, status: :unprocessable_entity
        end
      end

      private

      def business_params
        params.permit(:name, :shares_available, :user_id)
      end
    end
  end
end
