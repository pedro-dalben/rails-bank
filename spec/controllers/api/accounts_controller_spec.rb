# frozen_string_literal: true

require 'rails_helper'
# Test for Api::AccountsController
RSpec.describe Api::AccountsController, type: :controller do
  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) { { email: 'test@example.com', name: 'Test User', saldo: 100.0 } }

      it 'creates a new user and account' do
        expect do
          post :create, params: valid_params, format: :json
        end.to change(User, :count).by(1).and change(Account, :count).by(1)

        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { { email: 'invalid_email', name: '', saldo: -10.0 } }

      it 'returns unprocessable entity status' do
        post :create, params: invalid_params, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET #show' do
    let(:account) { create(:account) }

    context 'when account exists' do
      it 'returns the account details' do
        get :show, params: { id: account.id }, format: :json
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to eq(JSON.parse(AccountSerializer.new(account).to_json))
      end
    end

    context 'when account does not exist' do
      it 'returns not found status' do
        get :show, params: { id: 'invalid_id' }, format: :json
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
