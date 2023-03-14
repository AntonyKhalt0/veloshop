# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  def buyer?
    is_a?(Buyer)
  end

  def seller?
    is_a?(Seller)
  end

  def director?
    is_a?(Director)
  end

  def creator?(resource)
    resource.buyer.id == id
  end

  def performer?(order)
    order.seller.id == id
  end
end
