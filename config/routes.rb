# frozen_string_literal: true

Rails.application.routes.draw do
  apipie
  resources :accounts
  get 'home/index'
  devise_for :users
  root to: 'home#index'

  namespace :api do
    resources :accounts, only: %i[create show]
    resources :transactions, only: %i[create show]
    post 'transferir', to: 'transactions#transfer'
    post 'sacar', to: 'transactions#withdraw'
  end
  resources :conta, controller: 'accounts', only: %i[create show]
  resources :transacao, controller: 'transactions', only: %i[create show]
end
