class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  belongs_to :shopping_cart, optional: true
  has_many :orders, as: :buyer, dependent: :nullify

  validates :first_name, :last_name, presence: true

  after_create :add_shop_cart

  def creator?(resource)
    resource.buyer.id == self.id
  end

  def performer?(order)
    order.seller.id == self.id
  end

  private

  def add_shop_cart
    self.shopping_cart = ShoppingCart.new(buyer_id: self.id)
    self.save
  end
end
