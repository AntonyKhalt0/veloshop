# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.integer :article, null: false
      t.string :description, null: false
      t.float :price, null: false
      t.references :category, foreign_key: true, null: false

      t.timestamps
    end
  end
end
