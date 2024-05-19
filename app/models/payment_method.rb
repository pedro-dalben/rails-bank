# frozen_string_literal: true

class PaymentMethod < ApplicationRecord
  has_many :transactions
end
