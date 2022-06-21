class CreateReadings < ActiveRecord::Migration[6.1]
  def change
    create_table :readings do |t|
      
      t.integer :user_id
      t.integer :book_id, limit: 8, null: false

      t.timestamps
    end
  end
end
