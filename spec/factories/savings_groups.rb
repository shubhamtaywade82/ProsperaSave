# frozen_string_literal: true

FactoryBot.define do
  factory :savings_group do
    name { Faker::Company.name }
    start_date { Faker::Date.in_date_period }
    duration { Faker::Number.between(from: 1, to: 10) }
  end
end
