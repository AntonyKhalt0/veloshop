# frozen_string_literal: true

class Seller < User
  has_many :execute_orders, class_name: 'Order', foreign_key: :seller_id, dependent: :nullify
end
