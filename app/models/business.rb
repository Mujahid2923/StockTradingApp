# frozen_string_literal: true

# app/models/business.rb
class Business < ApplicationRecord
  belongs_to :user, inverse_of: :businesses

  has_many :purchases, inverse_of: :business, dependent: :destroy
  has_many :orders, inverse_of: :business, dependent: :destroy

  validates :name, presence: true
  validates :shares_available, presence: true
end
