# frozen_string_literal: true

# app/models/permission.rb
class Permission < ApplicationRecord
  belongs_to :accessor, polymorphic: true

  validates :resource, presence: true, uniqueness: { scope: %i[accessor_id accessor_type], case_sensitive: false }
  validates :actions, permission_actions: true

  def resource=(value)
    super(value&.downcase)
  end
end
