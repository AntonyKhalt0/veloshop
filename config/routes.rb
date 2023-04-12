# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'products#index'

  namespace :sellers do
    resources :orders, only: %i[edit update], shallow: true
  end

  namespace :buyers do
    resources :orders, only: %i[new create destroy], shallow: true
  end

  resources :orders, only: %i[index show]

  resources :shopping_carts, only: :show do
    member do
      patch :add_product
      patch :delete_product
    end
  end

  post 'search', action: :search, controller: 'search'

  get '/about', to: "about#index"
  resources :bank_accounts, only: %i[edit update]
  resources :profiles, only: %i[show]
  get '/sort_by_availability', to: 'products#sort_by_availability'
  resources :products do
    member do
      patch :update_count
      patch :add_subscriber
    end
  end
  get '/:category/products', to: 'products#index'
  resources :categories
  resources :users, only: %i[index show edit destroy] do
    patch :update_salary, on: :member
  end
  post :payment, to: 'payments#payment'
end
