class BankAccount < ApplicationRecord
  belongs_to :buyer

  validates :amount, presence: true
end
