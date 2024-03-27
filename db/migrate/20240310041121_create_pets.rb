class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.integer :customer_id
      t.string :name, null: false
      t.date :birthday, null: false
      t.integer :gender, default: 0
      t.integer :breed_type, default: 0
      t.string :mix_breed_info1
      t.string :mix_breed_info2
      t.string :introduction
      t.timestamps
    end
  end
end
