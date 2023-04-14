require 'rails_helper'

RSpec.describe Feedback, type: :model do
  it { should belong_to :buyer }
  it { should belong_to :product }

  it { should validate_presence_of :body }
end
