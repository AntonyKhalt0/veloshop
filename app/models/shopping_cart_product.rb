# frozen_string_literal: true

class ShoppingCartProduct < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :product

  validates :count, presence: true
end
