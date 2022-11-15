class CreateShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_carts do |t|
      t.references :buyer, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
