# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  it { should belong_to :buyer }

  it { should validate_presence_of :amount }
end
