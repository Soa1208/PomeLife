class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :customer_id
      t.string :title, null: false
      t.string :content, null: false
      t.boolean :is_active, null: false, default: false
      t.string :category
      t.timestamps
    end
  end
end
