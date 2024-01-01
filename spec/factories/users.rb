# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'user@example.com' }
    password { 'password' }
    # ...

    trait :admin do
      role { 'admin' }
    end

    trait :standard do
      role { 'standard' }
    end

    # ... other roles
  end
end
