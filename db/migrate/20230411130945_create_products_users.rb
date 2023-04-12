class CreateProductsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :products_users do |t|
      t.references :buyer, foreign_key: { to_table: :users }
      t.references :product, foreign_key: true
    end
  end
end
