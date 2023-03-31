# frozen_string_literal: true

class ShoppingCart < ApplicationRecord
  belongs_to :buyer, class_name: 'Buyer', foreign_key: :buyer_id
  has_one :order
  has_many :shopping_cart_products
  has_many :products, through: :shopping_cart_products

  def total_price
    products = shopping_cart_products.eager_load(:product)
    total_price = 0

    products.each do |product|
      total_price += product.product.price * product.count
    end

    total_price
  end
end
