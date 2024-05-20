# frozen_string_literal: true

module Api
  class TransactionsController < ApplicationController
    before_action :find_account, only: [:create]
    before_action :set_transaction, only: [:show]
    before_action :set_accounts, only: [:transfer]
    skip_before_action :verify_authenticity_token

    def create
      amount = params[:valor].to_f
      payment_method_code = params[:forma_pagamento]
      payment_method = PaymentMethod.find_by(code: payment_method_code)

      unless payment_method
        render json: { error: 'Forma de pagamento inválida' }, status: :unprocessable_entity
        return
      end

      transaction_fee = amount * payment_method.taxa
      total_amount = amount + transaction_fee

      if @account.balance >= total_amount
        @account.balance -= total_amount
        @account.save!

        render json: { numero_conta: @account.id, saldo: @account.balance }, status: :created
      else
        render json: { error: 'Saldo insuficiente' }, status: :not_found
      end
    end

    def show
      render json: @transaction
    end

    def transfer
      amount = params[:amount].to_f
      payment_method = PaymentMethod.find_by(code: params[:payment_method])

      if payment_method.nil?
        render json: { error: 'Forma de pagamento inválida' }, status: :unprocessable_entity
        return
      end

      if @sender_account.balance >= amount + payment_method.fee(amount)
        ActiveRecord::Base.transaction do
          @sender_account.update!(balance: @sender_account.balance - amount - payment_method.fee(amount))
          @receiver_account.update!(balance: @receiver_account.balance + amount)

          transaction = Transaction.create!(
            amount:,
            payment_method:,
            sender: @sender_account,
            receiver: @receiver_account
          )
          render json: transaction, status: :created
        end
      else
        render json: { error: 'Insufficient balance' }, status: :unprocessable_entity
      end
    end

    private

    def find_account
      @account = Account.find_by(id: params[:numero_conta])
      render json: { error: 'Conta não encontrada' }, status: :not_found unless @account
    end

    def set_transaction
      @transaction = Transaction.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Transaction not found' }, status: :not_found
    end

    def set_accounts
      @sender_account = Account.find_by(id: params[:sender_account_id])
      @receiver_account = Account.find_by(id: params[:receiver_account_id])

      return unless @sender_account.nil? || @receiver_account.nil?

      render json: { error: 'Invalid account(s)' }, status: :not_found
    end
  end
end
