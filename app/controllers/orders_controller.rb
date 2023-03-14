# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_order, only: :show

  authorize_resource

  def index
    @executable_orders = Order.executable.paginate(page: params[:page], per_page: 1)
    @created_orders = Order.created.paginate(page: params[:page], per_page: 1)
    @completed_orders = Order.completed.paginate(page: params[:page], per_page: 1)
  end

  private

  def get_order
    @order = Order.find(params[:id])
  end
end
