# frozen_string_literal: true

class CreateShoppingCartProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_cart_products do |t|
      t.belongs_to :shopping_cart
      t.belongs_to :product
      t.integer :count, default: 0, null: false

      t.timestamps
    end
  end
end
