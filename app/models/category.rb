# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  has_one_attached :image

  validates :title, :url_name, presence: true
end
