# frozen_string_literal: true

class CreateBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_accounts do |t|
      t.float :amount, default: 0
      t.integer :buyer_id

      t.timestamps
    end
  end
end
