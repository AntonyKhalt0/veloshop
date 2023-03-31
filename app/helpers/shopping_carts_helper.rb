# frozen_string_literal: true

module ShoppingCartsHelper
  def shop_cart_product_count(shop_cart, product)
    shop_cart.shopping_cart_products.find_by(product: product).count
  end
end
