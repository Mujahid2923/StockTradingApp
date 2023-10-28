# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    quantity { 10 }
    price { 111 }
    status { 0 }
  end
end
