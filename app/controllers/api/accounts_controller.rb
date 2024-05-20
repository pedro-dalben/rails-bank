# app/controllers/api/accounts_controller.rb
module Api
  class AccountsController < ApplicationController
    skip_before_action :verify_authenticity_token

    api :POST, '/conta', 'Cria uma nova conta de usuário'
    param :email, String, desc: 'E-mail do usuário', required: true
    param :nome, String, desc: 'Nome do usuário', required: true
    param :saldo, Float, desc: 'Saldo inicial da conta', required: true
    param :senha, String, desc: 'Senha para o usuário', required: false
    error code: 422, desc: 'Unprocessable Entity'

    def create
      password = params[:senha] || 'changeme'
      user = User.new(email: params[:email], password:, password_confirmation: password,
                      name: params[:nome])
      if user.save
        account = user.account
        account.update(balance: params[:saldo])
        render json: account, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    api :GET, '/conta/:id', 'Exibe uma conta de usuário'
    param :id, :number, desc: 'ID da conta', required: true
    error code: 404, desc: 'Conta não encontrada'

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
