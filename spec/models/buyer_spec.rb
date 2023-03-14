# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Buyer, type: :model do
  it { should have_many :orders }
  it { should have_one :bank_account }
end
