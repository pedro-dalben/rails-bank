# frozen_string_literal: true

class CreatePaymentMethods < ActiveRecord::Migration[7.1]
  def up
    PaymentMethod.create!(code: 'P', name: 'Pix')
    PaymentMethod.create!(code: 'C', name: 'Cartão de Crédito')
    PaymentMethod.create!(code: 'D', name: 'Cartão de Débito')
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
