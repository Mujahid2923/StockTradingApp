# frozen_string_literal: true

# app/serializers/order_serializer.rb
class OrderSerializer < ApplicationSerializer
  attributes(
    :quantity,
    :price,
    :buyer_name
  )

  def buyer_name
    object.user.name
  end
end
