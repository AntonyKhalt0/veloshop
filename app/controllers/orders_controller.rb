class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_order, only: %w[show edit update destroy]

  authorize_resource

  def index
    @executable_orders = Order.executable
    @created_orders = Order.created
    @completed_orders = Order.completed
  end

  def new
    @shop_cart = get_shop_cart
    @order = Order.new
  end

  def create
    @order = Order.new(
      payment_type: order_params[:payment_type],
      status: 'created',
      total_price: get_shop_cart.total_price,
      buyer_id: current_user.id,
      shopping_cart_id: get_shop_cart.id,
      products: get_products
    )

    if @order.save
      get_shop_cart.products = []
      redirect_to orders_path
    else
      render shopping_cart_path(get_shop_cart)
    end
  end

  def update
    if @order.update(seller_id: current_user.id, status: order_params[:status])
      redirect_to orders_path
    else
      render "edit"
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:payment_type, :status)
  end

  def get_order
    @order = Order.find(params[:id])
  end

  def get_shop_cart
    current_user.shopping_cart
  end

  def get_products
    @products = {}
    get_shop_cart.products.each do |product|
      @products[product.title] = { article: product.article, description: product.description, price: product.price }
    end
    @products
  end
end
