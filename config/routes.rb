# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'products#index'

  resources :products
  resources :categories
  resources :shopping_carts, only: :show do
    member do
      patch :add_product
      patch :delete_product
    end
  end
  resources :orders
  resources :profiles, only: %i[show]
  resources :bank_accounts, only: %i[edit update]
  post :payment, to: 'payments#payment'
end
