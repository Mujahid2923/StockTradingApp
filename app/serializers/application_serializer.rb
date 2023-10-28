# frozen_string_literal: true

# app/serializers/application_serializer.rb
class ApplicationSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
end
