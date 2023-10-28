# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
    name { Faker::Name.first_name }

    trait :owner do
      role { Role.find_or_create_by!(name: 0) }
    end

    trait :buyer do
      role { Role.find_or_create_by!(name: 1) }
    end
  end
end
