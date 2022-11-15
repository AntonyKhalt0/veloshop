class ShoppingCart < ApplicationRecord
  belongs_to :buyer, class_name: 'User', dependent: :destroy
  has_one :order
  has_and_belongs_to_many :products

  def total_price
    products.pluck(:price).sum
  end
end
