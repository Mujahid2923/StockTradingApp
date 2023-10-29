# frozen_string_literal: true

class ApplicationController < ActionController::Base # rubocop:disable Style/Documentation
  include ApiErrors::ErrorHandler
  include HttpAcceptLanguage::AutoLocale
  include ActiveStorage::SetCurrent

  before_action :set_current_user
  before_action :authenticate_user!

  respond_to :json

  def set_current_user
    User.current_user = current_user if current_user
  end

  def route_not_found
    render json: { errors: ['Page not found.'] }, status: :not_found
  end
end
