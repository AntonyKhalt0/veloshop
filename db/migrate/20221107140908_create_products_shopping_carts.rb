class CreateProductsShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :products_shopping_carts do |t|
      t.belongs_to :shopping_cart
      t.belongs_to :product
    end
  end
end
