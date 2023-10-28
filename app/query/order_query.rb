# frozen_string_literal: true

# app/serializers/order_serializer.rb
class OrderQuery
  attr_accessor(
    :current_user
  )

  def initialize(current_user:)
    @current_user = current_user
  end

  def run
    preload_orderes.where(status: 0)
  end

  private

  def preload_orderes
    if current_user.owner?
      Order.all
    else
      Order.where(user_id: current_user.id)
    end
  end
end
