# frozen_string_literal: true

class PaymentMethod < ApplicationRecord
  has_many :transactions
  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :taxa, presence: true

  def fee(amount)
    return 0 if code == 'P'

    amount * taxa / 100
  end
end
