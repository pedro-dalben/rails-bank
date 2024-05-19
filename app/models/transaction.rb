# frozen_string_literal: true

# app/models/transaction.rb
class Transaction < ApplicationRecord
  belongs_to :sender, class_name: 'Account', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'Account', foreign_key: 'receiver_id'
  belongs_to :payment_method
end
