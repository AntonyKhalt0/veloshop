# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :url_name }
  it { should have_many :products }
end
