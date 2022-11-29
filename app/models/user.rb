class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  def buyer?
    self.is_a?(Buyer)
  end

  def seller?
    self.is_a?(Seller)
  end

  def director?
    self.is_a?(Director)
  end

  def creator?(resource)
    resource.buyer.id == self.id
  end

  def performer?(order)
    order.seller.id == self.id
  end
end
