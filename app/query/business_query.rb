# frozen_string_literal: true

# app/serializers/business_serializer.rb
class BusinessQuery
  attr_accessor(
    :current_user
  )

  def initialize(current_user:)
    @current_user = current_user
  end

  def run
    businesses
  end

  private

  def businesses
    if current_user.buyer?
      Business.all
    else
      Business.where(user_id: current_user.id)
    end
  end
end
