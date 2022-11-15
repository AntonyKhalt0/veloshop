class CreateBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_accounts do |t|
      t.float :amount, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
