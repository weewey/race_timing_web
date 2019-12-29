# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'user@example.com' }
    password { 'password' }
    confirmed_at { Time.now }
  end

  factory :api_user do
    email { 'api-user@example.com' }
    password { 'password' }
    confirmed_at { Time.now }
  end

end
