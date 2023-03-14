# frozen_string_literal: true

class Buyer < User
  belongs_to :shopping_cart, optional: true, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :bank_account, dependent: :destroy

  after_create :add_shop_cart_and_bank_account

  private

  def add_shop_cart_and_bank_account
    shopping_cart = ShoppingCart.new(buyer_id: id)
    bank_account = BankAccount.new(buyer_id: id)
    save
  end
end
