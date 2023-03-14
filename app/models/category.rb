# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :title, :url_name, presence: true
end
