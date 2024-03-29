# frozen_string_literal: true

module Buyers
  class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :get_order, only: :destroy

    authorize_resource

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

    def destroy
      @order.destroy
      current_user.bank_account.amount += @order.total_price if @order.payment_status == true
      current_user.bank_account.save
      redirect_to orders_path
    end

    private

    def order_params
      params.require(:order).permit(:payment_type)
    end

    def get_order
      @order = Order.find(params[:id])
    end

    def get_shop_cart
      current_user.shopping_cart
    end

    def get_products
      @products = {}
      shop_cart_products = get_shop_cart.shopping_cart_products.eager_load(:product)
      shop_cart_products.each do |scp|
        @products[scp.product.title] = { article: scp.product.article,
                                         description: scp.product.description,
                                         count: scp.count,
                                         price: scp.product.price * scp.count }
      end
      @products
    end
  end
end
