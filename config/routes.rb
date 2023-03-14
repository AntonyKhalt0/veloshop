# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'products#index'

  namespace :seller do
    resources :orders, only: %i[edit update], shallow: true
  end

  namespace :buyer do
    resources :orders, only: %i[new create destroy], shallow: true
  end

  resources :orders, only: %i[index show]

  resources :shopping_carts, only: :show do
    member do
      patch :add_product
      patch :delete_product
    end
  end

  get '/about', to: "about#index"
  resources :bank_accounts, only: %i[edit update]
  resources :profiles, only: %i[show]
  resources :products do
    patch :update_count, on: :member
  end
  get '/:category/products', to: 'products#index'
  resources :categories
  resources :users, only: %i[index show edit destroy] do
    patch :update_salary, on: :member
  end
  post :payment, to: 'payments#payment'
end
