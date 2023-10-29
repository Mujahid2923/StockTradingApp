# frozen_string_literal: true

module Api
  module V1
    class SessionsController < Devise::SessionsController # rubocop:disable Style/Documentation
      def create
        super
      end

      private

      def respond_with(resource, _opts = {})
        render json: resource
      end

      def respond_to_on_destroy
        head :no_content
      end
    end
  end
end
