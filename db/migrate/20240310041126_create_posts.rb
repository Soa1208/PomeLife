class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :customer_id
      t.integer :pet_id
      t.string :title, null: false
      t.string :body, null: false
      t.timestamps
    end
  end
end
