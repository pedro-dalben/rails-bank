# frozen_string_literal: true

# Model for transaction
class Transaction < ApplicationRecord
  belongs_to :sender, class_name: 'Account', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'Account', foreign_key: 'receiver_id'
  belongs_to :payment_method

  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validates :payment_method_id, presence: true
end
