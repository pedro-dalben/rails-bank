# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    balance { FFaker::Random.rand(100.0..1000.0) }
    user { create(:user) }
  end
end
