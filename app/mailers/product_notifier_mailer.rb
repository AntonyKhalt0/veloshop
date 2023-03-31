class ProductNotifierMailer < ApplicationMailer
  def digest(users, product)
    @product = product

    users.each do |user|
      mail to: user.email
    end
  end
end
