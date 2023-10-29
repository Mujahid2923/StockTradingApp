# frozen_string_literal: true

# Order Creation
class OrderCreate < Base
  def call
    authorize! Order, to: :create?

    order = Order.new(
      price: params[:price],
      quantity: params[:quantity],
      business_id: params[:business_id],
      user_id: current_user.id
    )

    order.save ? true : false
  end
end
