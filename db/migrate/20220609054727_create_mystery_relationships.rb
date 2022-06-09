class CreateMysteryRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :mystery_relationships do |t|
      
      t.integer :mystery_id
      t.integer :review_id
      
      t.timestamps
    end
  end
end
