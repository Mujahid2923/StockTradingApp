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

    transient do
      with_permissions { {} }
    end

    after(:create) do |user, evaluator|
      evaluator.with_permissions.each_pair do |resource, actions|
        actions = [actions] unless actions.is_a?(Array)

        create(
          :permission,
          accessor: user.role,
          resource: resource,
          actions: actions.index_with { |_key| true }
        )
      end
    end
  end
end
