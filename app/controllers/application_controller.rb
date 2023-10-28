# frozen_string_literal: true

# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  include ApiErrors::ErrorHandler
  include HttpAcceptLanguage::AutoLocale
  include ActiveStorage::SetCurrent

  before_action :set_current_user

  respond_to :json

  binding.pry

  def set_current_user
    User.current_user = current_user if current_user
  end

  def route_not_found
    render json: { errors: ['Page not found.'] }, status: :not_found
  end
end
