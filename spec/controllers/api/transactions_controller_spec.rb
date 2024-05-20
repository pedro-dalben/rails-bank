# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Api::TransactionsController, type: :controller do
  describe 'POST #create' do
    context 'with valid params' do
      let(:payment_method) { create(:payment_method) }

      let(:valid_transaction_params) { { valor: 100, forma_pagamento: payment_method.code } }

      it 'creates a new transaction' do
        expect do
          post :create, params: valid_transaction_params, format: :json
        end

        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      let(:invalid_transaction_params) { { valor: -100, forma_pagamento: 'P' } }

      it 'does not create a new transaction' do
        expect do
          post :create, params: invalid_transaction_params, format: :json
        end.not_to change(Transaction, :count)

        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET #show' do
    let(:transaction) { create(:transaction) }

    it 'returns the transaction details' do
      get :show, params: { id: transaction.id }, format: :json
      expect(response.body).to eq(TransactionSerializer.new(transaction).to_json)
    end
  end

  describe 'POST #transfer' do
    let(:payment_method) { create(:payment_method) }
    let(:valid_transfer_params) do
      { valor: 100, forma_pagamento: payment_method.code, conta_envio_id: sender_account.id,
        conta_recebimento_id: receiver_account.id }
    end
    let(:sender_account) { create(:account) }
    let(:receiver_account) { create(:account) }

    it 'creates a new transaction' do
      expect do
        post :transfer, params: valid_transfer_params, format: :json
      end.to change(Transaction, :count).by(1)

      expect(response).to have_http_status(:created)
    end

    context 'with invalid params' do
      let(:invalid_transfer_params) do
        { valor: 1000, forma_pagamento: payment_method.code, conta_envio_id: sender_account.id,
          conta_recebimento_id: receiver_account.id }
      end

      it 'does not create a new transaction' do
        expect do
          post :transfer, params: invalid_transfer_params, format: :json
        end.not_to change(Transaction, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
