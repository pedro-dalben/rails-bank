# frozen_string_literal: true

class AddTaxaToPaymentMethods < ActiveRecord::Migration[7.1]
  def change
    add_column :payment_methods, :taxa, :decimal, precision: 5, scale: 2, default: 0.0
  end
end
