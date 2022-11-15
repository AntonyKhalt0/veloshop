class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :bank_account, only: :payment

  def payment
    if @bank_account.amount >= order.total_price
      @bank_account.amount -= order.total_price
      @bank_account.save
      order.update(payment_status: true)
      redirect_to orders_path
      flash[:notice] = "The order has been successfully paid for!"
    else
      redirect_to edit_bank_account_path(@bank_account)
      flash[:alert] = "Insufficient funds in your account!"
    end
  end

  private

  def bank_account
    @bank_account = BankAccount.find_by(user_id: current_user.id)
  end

  def order
    @order = Order.find(params[:order_id])
  end
end
