# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user, only: %i[show edit update_salary destroy]

  def index
    @buyers = Buyer.all.paginate(page: params[:page], per_page: 3)
    @sellers = Seller.all.paginate(page: params[:page], per_page: 3)
  end

  def show
    @completed_orders = @user.execute_orders.where(status: "completed") if @user.seller?
  end

  def update_salary
    @user.salary = user_params[:salary]

    if @user.save
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:seller).permit(:salary)
  end

  def get_user
    @user = User.find(params[:id])
  end
end
