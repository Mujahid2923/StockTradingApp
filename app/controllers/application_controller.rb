# frozen_string_literal: true

# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  include ApiErrors::ErrorHandler
  include HttpAcceptLanguage::AutoLocale
  include ActiveStorage::SetCurrent

  before_action :set_current_user
  before_action :authenticate_user!

  respond_to :json

  def set_current_user
    User.current_user = current_user if current_user
  end

  after_action -> { request.session_options[:skip] = true }

  def route_not_found
    render json: { errors: ['Page not found.'] }, status: :not_found
  end
end
