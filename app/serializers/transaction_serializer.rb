# frozen_string_literal: true

class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :payment_method, :sender_id, :receiver_id, :created_at, :updated_at

  def payment_method
    object.payment_method.code
  end
end
