# frozen_string_literal: true

# app/models/user.rb
class User < ApplicationRecord
  cattr_accessor :current_user

  devise(
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable,
    :jwt_authenticatable,
    jwt_revocation_strategy: self
  )

  include Devise::JWT::RevocationStrategies::JTIMatcher

  belongs_to :role

  has_many :businesses, inverse_of: :user, dependent: :destroy
  has_many :purchases, inverse_of: :user, dependent: :destroy
  has_many :orders, inverse_of: :user, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  delegate :owner?, :buyer?, to: :role
end
