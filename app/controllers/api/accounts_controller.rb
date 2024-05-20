# frozen_string_literal: true

# app/controllers/api/account_controller.rb
module Api
  class AccountsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      user = User.new(email: params[:email], password: 'changeme', password_confirmation: 'changeme',
                      name: params[:name])
      if user.save
        account = user.account
        account.update(balance: params[:saldo])
        render json: account, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def show
      account = Account.find_by(id: params[:id])
      if account
        render json: account, status: :ok
      else
        render json: { error: 'Account not found' }, status: :not_found
      end
    end
  end
end
