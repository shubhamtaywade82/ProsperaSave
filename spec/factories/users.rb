# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true) }

    trait :member do
      role { 'member' }
    end

    trait :admin do
      role { 'admin' }
    end
  end
end
