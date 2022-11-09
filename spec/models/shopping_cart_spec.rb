require 'rails_helper'

RSpec.describe ShoppingCart, type: :model do
  it { should belong_to :buyer }
  it { should have_and_belong_to_many :products }
end
