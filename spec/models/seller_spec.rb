# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Seller, type: :model do
  it { should have_many :execute_orders }
end
