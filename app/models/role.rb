# frozen_string_literal: true

# app/models/role.rb
class Role < ApplicationRecord
  has_many :users, dependent: :restrict_with_error
  has_many :permissions, as: :accessor, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  enum name: { owner: 0, buyer: 1 }

  accepts_nested_attributes_for :permissions
end
