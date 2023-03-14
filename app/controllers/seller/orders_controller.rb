# frozen_string_literal: true

module Seller
  class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :get_order, only: %i[edit update]

    authorize_resource

    def update
      if @order.update(seller_id: current_user.id, status: order_params[:status])
        redirect_to orders_path
      else
        render 'edit'
      end
    end

    private

    def order_params
      params.require(:order).permit(:status)
    end

    def get_order
      @order = Order.find(params[:id])
    end
  end
end
