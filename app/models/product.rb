# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :subscribers, class_name: "Buyer"
  has_many :feedbacks
  has_many :buyers, through: :feedbacks

  has_many_attached :images

  validates :article, :description, :price, presence: true

  def overall_rating
    rating = 0.0
    feedbacks = Feedback.where(product_id: self)
    feedbacks.each do |feedback|
      rating += feedback.score
    end
    return rating.zero? ? rating : rating / feedbacks.count
  end
end
