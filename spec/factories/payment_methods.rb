FactoryBot.define do
  factory :payment_method do
    code { "CODE#{rand(10..99)}" }
    name { FFaker::Company.unique.name }
    taxa { FFaker::Number.unique.decimal }
  end
end
