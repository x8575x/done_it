class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
    
      t.integer :user_id
      t.integer :book_id
      t.integer :type_id
      t.integer :long_id
      t.integer :mystery_relationship_id
      t.integer :difficulty_relationship_id
      t.integer :tag_relationship_id
      t.text :body
      t.text :netabare

      t.timestamps
    end
  end
end
