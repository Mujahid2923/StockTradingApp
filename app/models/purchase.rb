# frozen_string_literal: true

# app/models/purchase.rb
class Purchase < ApplicationRecord
  belongs_to :user, inverse_of: :purchases
  belongs_to :business, inverse_of: :purchases
end
