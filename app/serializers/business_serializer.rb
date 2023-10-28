# frozen_string_literal: true

# app/serializers/business_serializer.rb
class BusinessSerializer < ApplicationSerializer
  attributes(
    :name,
    :shares_available,
    :owner_name
  )

  def owner_name
    object.user.name
  end
end
