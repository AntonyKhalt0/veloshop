# frozen_string_literal: true

class ShoppingCart < ApplicationRecord
  belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id
  has_one :order
  has_many :shopping_cart_products
  has_many :products, through: :shopping_cart_products

  def total_price
    #TODO Переделать под новую модель с количеством товаров
  end
end
