# frozen_string_literal: true

# app/models/order.rb
class Order < ApplicationRecord
  belongs_to :user, inverse_of: :orders
  belongs_to :business, inverse_of: :orders

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :status, presence: true

  enum status: {
    pending: 0,
    approved: 1,
    rejected: 2
  }
end
