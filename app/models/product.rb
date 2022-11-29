# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :shopping_carts

  has_many_attached :images

  validates :article, :description, :price, presence: true
end
