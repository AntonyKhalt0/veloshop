class BankAccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_bank_account, only: %i[edit update]

  def update
    @bank_account.amount += bank_account_params[:amount].to_f

    if @bank_account.save
      redirect_to profile_path(@bank_account.user)
    else
      render :edit
    end
  end

  private

  def bank_account_params
    params.require(:bank_account).permit(:amount, :card_number, :card_date)
  end

  def get_bank_account
    @bank_account = BankAccount.find(params[:id])
  end

end
