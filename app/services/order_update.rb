# frozen_string_literal: true

# Business Update
class OrderUpdate
  attr_accessor :user, :params, :id

  def initialize(id:, current_user:, params:)
    @user = current_user
    @params = params
    @id = id
  end

  def call
    @order = Order.find(id)

    update_purchase_list

    @order.update(params) ? true : false
  end

  private

  def update_purchase_list
    return unless params[:status] == 'approved'

    purchase = Purchase.new(
      price: @order.price,
      quantity: @order.quantity,
      business_id: @order.business_id,
      user_id: @order.user_id
    )
    purchase.save!
  end
end
