# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShoppingCart, type: :model do
  it { should belong_to :buyer }
  it { should have_one :order }
  it { should have_many :shopping_cart_products }
  it { should have_many :products }
end
