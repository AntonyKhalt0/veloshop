# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Buyer, type: :model do
  it { should have_many :orders }
  it { should have_one :bank_account }
  it { should have_one :shopping_cart }
  it { should have_many :feedbacks }
  it { should have_many :products }
end
