# frozen_string_literal: true

FactoryBot.define do
  factory :purchase do
    quantity { 10 }
    price { 111 }
    status { 0 }
  end
end
