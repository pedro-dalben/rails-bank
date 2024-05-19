# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.integer :sender_id
      t.integer :receiver_id
      t.references :payment_method, null: false, foreign_key: true

      t.timestamps
    end
  end
end
