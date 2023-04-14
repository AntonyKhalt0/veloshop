class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.references :buyer, foreign_key: { to_table: :users }
      t.references :product, foreign_key: true
      t.string :body, null: false
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
