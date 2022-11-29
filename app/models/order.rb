class Order < ApplicationRecord
  belongs_to :buyer, class_name: 'Buyer'
  belongs_to :seller, class_name: 'Seller', optional: true
  belongs_to :shopping_cart

  validates :payment_type, :status, presence: true

  scope :created, -> { where(status: 'created') }
  scope :executable, -> { where(status: 'executable') }
  scope :completed, -> { where(status: 'completed') }
end
