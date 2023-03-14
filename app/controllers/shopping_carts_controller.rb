# frozen_string_literal: true

class ShoppingCartsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_shop_cart, only: %i[show add_product delete_product]
  authorize_resource

  def show
    @order = Order.new
  end

  def add_product
    get_product
    shopping_cart_product ? change_product_count : add_product_in_shopping_cart
    @product.update(count: @product.count - params[:count].to_i)
    redirect_to @shop_cart
    flash[:notice] = 'Товар был успешно добавлен в корзину!'
  end

  def delete_product
    get_product
    @shop_cart.products.delete(@product)
    @product.update(count: @product.count + 1)
    redirect_to @shop_cart
    flash[:notice] = 'Товар был успешно удален из корзины!'
  end

  private

  def get_shop_cart
    @shop_cart = ShoppingCart.find(params[:id])
  end

  def get_product
    @product = Product.find(params[:product_id])
  end

  def shopping_cart_product
    ShoppingCartProduct.find_by(shopping_cart: @shop_cart, product: @product)
  end

  def add_product_in_shopping_cart
    @shop_cart.shopping_cart_products << ShoppingCartProduct.create!(shopping_cart: @shop_cart, product: @product, count: params[:count])
  end

  def change_product_count
    shopping_cart_product.update(count: shopping_cart_product.count + params[:count].to_i)
  end
end
