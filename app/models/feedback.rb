class Feedback < ApplicationRecord
  belongs_to :buyer, class_name: "Buyer"
  belongs_to :product

  validates :body, presence: true
end
