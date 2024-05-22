# frozen_string_literal: true

class AddPaymentMethod < ActiveRecord::Migration[7.1]
  def up
    PaymentMethod.create!(name: 'Saque', code: 'S', taxa: 0.00)
  end

  def down
    PaymentMethod.where(code: %w[S]).destroy_all
  end
end
