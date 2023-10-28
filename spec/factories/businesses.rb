# frozen_string_literal: true

FactoryBot.define do
  factory :business do
    name { Faker::Job.title }
    shares_available { 10 }
  end
end
