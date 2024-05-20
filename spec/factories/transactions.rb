FactoryBot.define do
  factory :transaction do
    association :sender, factory: :account
    association :receiver, factory: :account
    association :payment_method
  end
end
