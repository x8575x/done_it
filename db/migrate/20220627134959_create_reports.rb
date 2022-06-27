class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|

      t.integer :user_id, null: false
      t.integer :review_id
      t.integer :category, null: false
      t.text :comment
      t.boolean :is_active, null: false, default: false
      
      t.timestamps
    end
  end
end
