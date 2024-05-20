# frozen_string_literal: true

class User < ApplicationRecord
  has_one :account, dependent: :destroy

  devise :database_authenticatable, :registerable, :validatable

  after_create :create_account

  validates :name, presence: true
  validates :email, uniqueness: true, email: true, length: { maximum: 70 }

  private

  def create_account
    Account.create(user: self, balance: 0.0)
  end
end
