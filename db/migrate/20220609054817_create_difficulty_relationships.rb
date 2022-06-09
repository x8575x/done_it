class CreateDifficultyRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :difficulty_relationships do |t|
      
      t.integer :difficulty_id
      t.integer :review_id

      t.timestamps
    end
  end
end
