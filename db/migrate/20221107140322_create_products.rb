# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :brand, null: false
      t.string :model, null: false
      t.integer :article, null: false
      t.string :description, null: false
      t.float :price, null: false
      t.integer :count, default: 1
      t.string :product_type, null: false
      t.string :color
      t.string :size, null: false
      t.string :material, null: false
      t.references :category, foreign_key: true, null: false
      t.references :subscribers, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
