# frozen_string_literal: true

class Buyer < User
  has_one :shopping_cart, dependent: :destroy
  has_one :bank_account, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :feedbacks
  has_many :products, through: :feedbacks

  after_create :add_shop_cart_and_bank_account

  private

  def add_shop_cart_and_bank_account
    shopping_cart = ShoppingCart.create!(buyer_id: id)
    bank_account = BankAccount.create!(buyer_id: id)
    save
  end
end
