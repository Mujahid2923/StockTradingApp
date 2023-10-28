# frozen_string_literal: true

# app/serializers/order_serializer.rb
class PurchaseQuery
  attr_accessor(
    :current_user
  )

  def initialize(current_user:)
    @current_user = current_user
  end

  def run
    purchases
  end

  private

  def purchases
    return unless current_user.buyer?

    Purchase.all
  end
end
