# frozen_string_literal: true

# app/controllers/application_controller.rb
class BaseController < ApplicationController
  before_action :authenticate_user!
end
