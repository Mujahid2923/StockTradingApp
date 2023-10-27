# frozen_string_literal: true

# app/models/user.rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :businesses, inverse_of: :user, dependent: :destroy
  has_many :purchases, inverse_of: :user, dependent: :destroy
  has_many :orders, inverse_of: :user, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :role, presence: true

  enum role: {
    owner: 0,
    buyer: 1
  }
end
