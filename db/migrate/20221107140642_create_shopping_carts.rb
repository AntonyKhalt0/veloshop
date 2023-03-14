# frozen_string_literal: true

class CreateShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_carts do |t|
      t.integer :buyer_id

      t.timestamps
    end
  end
end
