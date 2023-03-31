class ProductNotifierJob < ApplicationJob
  queue_as :default

  def perform(product)
    ProductNotifier.new.send_digest(product)
  end
end
