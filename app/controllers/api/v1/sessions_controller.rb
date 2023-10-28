# frozen_string_literal: true

# app/controllers/sessions_controller.rb

module Api
  module V1
    # Overriding Session Controller
    class SessionsController < Devise::SessionsController
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
