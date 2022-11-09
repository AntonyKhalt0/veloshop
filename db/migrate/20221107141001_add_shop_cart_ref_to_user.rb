class AddShopCartRefToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :shopping_cart, foreign_key: true, null: true
  end
end
