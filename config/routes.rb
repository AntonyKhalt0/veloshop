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
end
