class ShoppingCartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shop_cart, only: %i[show add_product delete_product]

  authorize_resource

  def show
    @order = Order.new
  end

  def add_product
    @shop_cart.products << set_product
    #flash[:success] = 'The product has been successfully added to your cart'
  end

  def delete_product
    @shop_cart.products.delete(set_product)
    redirect_to @shop_cart
  end

  private

  def set_shop_cart
    @shop_cart = current_user.shopping_cart
  end

  def set_product
    Product.find(params[:id])
  end
end
