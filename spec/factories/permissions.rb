# frozen_string_literal: true

FactoryBot.define do
  factory :permission do
    resource { :business }
    actions { { create: true } }
  end
end
