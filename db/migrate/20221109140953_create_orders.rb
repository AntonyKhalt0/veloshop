class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :payment_type, default: 'cash'
      t.boolean :payment_status, default: false
      t.string :status, default: "create"
      t.float :total_price
      t.json :products
      t.references :buyer, foreign_key: { to_table: :users }, null: false
      t.references :seller, foreign_key: { to_table: :users }
      t.references :shopping_cart, foreign_key: true

      t.timestamps
    end
  end
end
