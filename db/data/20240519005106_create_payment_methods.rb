# frozen_string_literal: true

class CreatePaymentMethods < ActiveRecord::Migration[7.1]
  def up
    PaymentMethod.create!(name: 'Pix', code: 'P', taxa: 0.00)
    PaymentMethod.create!(name: 'Cartão de Crédito', code: 'C', taxa: 0.05)
    PaymentMethod.create!(name: 'Cartão de Débito', code: 'D', taxa: 0.03)
  end

  def down
    PaymentMethod.where(code: %w[P C D]).destroy_all
  end
end
