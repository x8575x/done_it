class CreateTagRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_relationships do |t|
      
      t.integer :tag_id
      t.integer :review_id

      t.timestamps
    end
  end
end
