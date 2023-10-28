# frozen_string_literal: true

# app/serializers/purchase_serializer.rb
class PurchaseSerializer < ApplicationSerializer
  attributes(
    :quantity,
    :price,
    :business_name
  )

  def business_name
    object.business.name
  end
end
