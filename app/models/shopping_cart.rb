class ShoppingCart < ApplicationRecord
  belongs_to :buyer, class_name: 'User', dependent: :destroy
  has_and_belongs_to_many :products
end
