class Product < ApplicationRecord
	belongs_to :category

	validates :article, :description, :price, presence: true
end
