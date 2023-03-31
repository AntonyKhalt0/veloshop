# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_many :subscribers, class_name: "Buyer"

  has_many_attached :images

  validates :article, :description, :price, presence: true
end
