require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to :buyer }
  it { should belong_to :seller }
  it { should belong_to :shopping_cart }

  it { should validate_presence_of :payment_type }
  it { should validate_presence_of :success }
end
