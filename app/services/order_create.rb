# frozen_string_literal: true

# Order Creation
class OrderCreate
  attr_accessor :current_user, :params

  def initialize(current_user:, params:)
    @current_user = current_user
    @params = params
  end

  def call
    @order = Order.new(
      price: params[:price],
      quantity: params[:quantity],
      business_id: params[:business_id],
      user_id: current_user.id
    )

    @order.save ? true : false
  end
end
