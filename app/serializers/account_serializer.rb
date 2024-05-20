# frozen_string_literal: true

class AccountSerializer < ActiveModel::Serializer
  attributes :id, :balance, :user_id
end
