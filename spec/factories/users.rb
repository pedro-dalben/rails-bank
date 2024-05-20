# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { 'changeme' }
    password_confirmation { 'changeme' }
    name { FFaker::Name.name }
  end
end
