class ProductNotifier
  def send_digest(product)
    users = product.subscribers

    ProductNotifierMailer.digest(users, product).deliver_now
  end
end
